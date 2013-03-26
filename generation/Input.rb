require 'PageElement'
module Cutara
  class Input < PageElement
    attr_accessor :menus
    def initialize label
      super label
      @menus = []
    end

    def to_snippet
      out = "\ttext_field #{@label.inspect} do\n\t\tlocator\n"
      @menus.each{|menu|
        out += "\t\tmenu #{menu.inspect}\n"
      }
      out += "\tend\n\n"
    end
  end
end
