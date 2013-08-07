# -*- encoding : utf-8 -*-
require 'cucumber/formatter/pretty'
require 'TarantulaUpdater'
require 'cutara'

module Cucumber
  module Formatter
    module Duration
      def format_duration_simple(seconds)
        seconds
      end
    end
    class CustomTarantulaFormatter < Pretty

      def initialize(runtime, path_or_io, options)
        @runtime, @io, @options = runtime, ensure_io(path_or_io, "pretty"), options
        @exceptions = []
        @indent = 0
        @prefixes = options[:prefixes] || {}
        @delayed_messages = []
        #############################################
        @scenario_index = 0
        @scenario_exceptions = []
        @scenario_undefined = false
        @scenario_updated = false
        @feature_result = 'PASSED'
        @start_time = 0
        Cutara::TarantulaUpdater.config = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))
        #############################################
      end

      def after_features(features)
        print_summary(features) unless @options[:autoformat]
        @io.puts(format_duration_simple(features.duration)) if features && features.duration
      end

      def before_feature(feature)
        #############################################
        @scenario_index = 0
        @start_time = Time.now.to_i
        #############################################
        @exceptions = []
        @indent = 0
        if @options[:autoformat]
          file = File.join(@options[:autoformat], feature.file)
          dir = File.dirname(file)
          mkdir_p(dir) unless File.directory?(dir)
          @io = ensure_file(file, "pretty")
        end
      end

      def feature_name(keyword, name)
        @io.puts("#{keyword}: #{name}")
        @io.puts
        @io.flush
        #############################################
        @feature_name = name.split("\n").first
        #############################################
      end

      def scenario_name(keyword, name, file_colon_line, source_indent)
        #############################################
        @scenario_index += 1 unless @in_background
        @scenario_exceptions = []
        @scenario_undefined = false
        #############################################
        print_feature_element_name(keyword, name, file_colon_line, source_indent)
      end

      def before_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
        @hide_this_step = false
        if exception
          if @exceptions.include?(exception)
            @hide_this_step = true
            return
          end
          @exceptions << exception
          #############################################
          @scenario_exceptions << exception
          #############################################
        end
        if status != :failed && @in_background ^ background
          @hide_this_step = true
          return
        end
        if status == :undefined
          #############################################
          @scenario_undefined = true
          #############################################
        end
        @status = status
      end

      def after_table_row(table_row)
        return if !@table || @hide_this_step
        print_table_row_messages
        @io.puts
        if table_row.exception && !@exceptions.include?(table_row.exception)
          #############################################
          @scenario_updated = true
          message = table_row.exception.inspect
          if @in_background
            message += " !INSIDE BACKGROUND!"
          end
          resp = Cutara::TarantulaUpdater.update_testcase_step(ENV["project"], ENV["execution"], @feature_name, @scenario_index, "FAILED", message)
          resp += Cutara::TarantulaUpdater.update_testcase_results(ENV["project"], ENV["execution"], @feature_name, Time.now.to_i - @start_time, @feature_result)
          @io.puts ">>>>>>>>>>>>>>>" + resp.to_s
          #############################################
          print_exception(table_row.exception, table_row.status, @indent)
        end
      end

      def after_steps(steps)
        #############################################
        return if @scenario_updated
        result = "PASSED"
        message = ''
        position = @scenario_index
        if not @scenario_exceptions.empty?
          result = "FAILED"
          @feature_result = 'FAILED'
          message = @scenario_exceptions.inspect
          @scenario_updated = true
        elsif @scenario_undefined
          result = "NOT_IMPL"
          @feature_result = 'NOT_IMPL'
          message = "Undefined cucumber sentence found"
          @scenario_updated = true
        end
        if @in_background
          message += " !INSIDE BACKGROUND!"
          position = 1
        end
        resp = Cutara::TarantulaUpdater.update_testcase_step(ENV["project"], ENV["execution"], @feature_name, position, result, message)
        resp += Cutara::TarantulaUpdater.update_testcase_results(ENV["project"], ENV["execution"], @feature_name, Time.now.to_i - @start_time, @feature_result)
        @io.puts ">>>>>>>>>>>>>>>" + resp.to_s
        #############################################
      end
    end
  end
end
