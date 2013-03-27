require 'cutara'
module Cutara
require GENERATION + 'PageElement'
  class Validator < PageElement
    def initialize label
      super label
    end

    def to_snippet
      "\tvalidator #{@label.inspect} do\n\tend\n\n"
    end
  end
end
