# -*- encoding : utf-8 -*-
require 'cucumber/formatter/progress'
require 'cucumber/step_definition_light'

module Cucumber
  module Formatter
    class SimpleSteps
      def initialize(runtime, io, options)
        @io = io
        @indent = 0
      end

      def respond_to?(*args)
        true
      end
      
      def step_name(keyword, step_match, status, source_indent, background, file_colon_line)
        step_name = step_match.format_args(lambda{|param| "*#{param}*"})
        @io.puts step_name
      end

    end
  end
end
