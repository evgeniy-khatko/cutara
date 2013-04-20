require 'cutara'
module Cutara
require GENERATION + 'support/PageElement'
require GENERATION + 'support/Action'
  class Validator < Action
    def to_snippet
      if @params
        return "\tvalidator #{@label.inspect} do |#{params.join(", ")}| \n\tend\n\n"
      else
        return "\tvalidator #{@label.inspect} do \n\tend\n\n"
      end
    end
  end
end
