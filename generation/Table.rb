require 'cutara'
module Cutara
require GENERATION + 'PageElement'
  class Table < PageElement
    attr_accessor :columns
    def initialize label
      super label
      @columns = []
    end

    def to_snippet
      out = ""
      out += "\ttable #{@label.inspect} do\n\t\tlocator\n"
      out += "\t\theader #{@columns.inspect}\n"
      out += "\tend\n\n"
    end

    def add_column label
      @columns << label
      @columns.uniq!
    end
  end
end
