# -*- encoding : utf-8 -*-
require 'cucumber/formatter/html'
require 'TarantulaUpdater'
require 'cutara'

module Cucumber
  module Formatter
    module Duration
      def format_duration_simple(seconds)
        seconds
      end
    end
    class CustomTarantulaHtmlFormatter < Html

      def initialize(runtime, path_or_io, options)
        @io = ensure_io(path_or_io, "html")
        @runtime = runtime
        @options = options
        @buffer = {}
        @builder = create_builder(@io)
        @feature_number = 0
        @scenario_number = 0
        @step_number = 0
        @header_red = nil
        @delayed_messages = []
        @img_id = 0
        #############################################
        @scenario_index = 0
        @scenario_exceptions = []
        @scenario_undefined = false
        @scenario_updated = false
        Cutara::TarantulaUpdater.config = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))
        #############################################
      end

      def after_features(features)
        #############################################
        result = 'Tarantula response undefined'
        begin
          result = Cutara::TarantulaUpdater.update_testcase_duration(ENV["project"], ENV["execution"], @feature_name, format_duration_simple(features.duration)) if features && features.duration
        rescue Exception => e
          result = e.message
        end
        @builder << "<p>#{result}</p>"
        #############################################
        print_stats(features)
        @builder << '</div>'
        @builder << '</body>'
        @builder << '</html>'
      end

      def before_feature(feature)
        @exceptions = []
        @builder << '<div class="feature">'
        #############################################
        @scenario_index = 0
        #############################################
      end

      def feature_name(keyword, name)
        lines = name.split(/\r?\n/)
        return if lines.empty?
        @builder.h2 do |h2|
          @builder.span(keyword + ': ' + lines[0], :class => 'val')
        end
        @builder.p(:class => 'narrative') do
          lines[1..-1].each do |line|
            @builder.text!(line.strip)
            @builder.br
          end
        end
        #############################################
        @feature_name = name.split("\n").first
        #############################################
      end

      def scenario_name(keyword, name, file_colon_line, source_indent)
        @builder.span(:class => 'scenario_file') do
          @builder << file_colon_line
        end
        @listing_background = false
        @builder.h3(:id => "scenario_#{@scenario_number}") do
          @builder.span(keyword + ':', :class => 'keyword')
          @builder.text!(' ')
          @builder.span(name, :class => 'val')
        end
        #############################################
        @scenario_index += 1 unless @in_background
        @scenario_exceptions = []
        @scenario_undefined = false
        #############################################
      end

      def before_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
        @step_match = step_match
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
        @status = status
        return if @hide_this_step
        set_scenario_color(status)
        @builder << "<li id='#{@step_id}' class='step #{status}'>"
      end

      def after_table_row(table_row)
        return if @hide_this_step
        print_table_row_messages
        @builder << '</tr>'
        if table_row.exception
          @builder.tr do
            @builder.td(:colspan => @col_index.to_s, :class => 'failed') do
              @builder.pre do |pre|
                pre << h(format_exception(table_row.exception))
              end
            end
          end
          if table_row.exception.is_a? ::Cucumber::Pending
            set_scenario_color_pending
          else
            set_scenario_color_failed
          end
          #############################################
          @scenario_updated = true
          message = table_row.exception.inspect
          if @in_background
            message += " !INSIDE BACKGROUND!"
          end
          result = 'Tarantula response undefined'
          begin
            result = Cutara::TarantulaUpdater.update_testcase_duration(ENV["project"], ENV["execution"], @feature_name, format_duration_simple(features.duration)) if features && features.duration
          rescue Exception => e
            result = e.message
          end
          @builder << "<p>#{result}</p>"
          #############################################
        end
        if @outline_row
          @outline_row += 1
        end
        @step_number += 1
        move_progress
      end

      def after_steps(steps)
        @builder << '</ol>'
        #############################################
        return if @scenario_updated
        result = "PASSED"
        message = ''
        position = @scenario_index
        if not @scenario_exceptions.empty?
          result = "FAILED"
          message = @scenario_exceptions.inspect
          @scenario_updated = true
        elsif @scenario_undefined
          result = "NOT_IMPL"
          message = "Undefined cucumber sentence found"
          @scenario_updated = true
        end
        if @in_background
          message += " !INSIDE BACKGROUND!"
          position = 1
        end
        result = 'Tarantula response undefined'
        begin
          result = Cutara::TarantulaUpdater.update_testcase_duration(ENV["project"], ENV["execution"], @feature_name, format_duration_simple(features.duration)) if features && features.duration
        rescue Exception => e
          result = e.message
        end
        @builder << "<p>#{result}</p>"
        #############################################
      end
    end
  end
end
