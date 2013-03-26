require 'PageElement'
module Cutara
  class Clickable < PageElement
    attr_accessor :type
    def initialize label, type
      super label
      @type = type
    end

    def to_snippet
      "\t#{@type} #{@label.inspect} do\n\t\tlocator\n\tend\n\n"
    end
  end
end
