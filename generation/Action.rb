require 'cutara'
module Cutara
require GENERATION + 'PageElement'
  class Action < PageElement
    attr_accessor :params

    def initialize label, params=nil
      super label
      @params = params
    end

    def to_snippet
      if @params
        return "\taction #{@label.inspect} do |#{params.join(", ")}|\n\tend\n\n"
      else
        return "\taction #{@label.inspect} do\n\tend\n\n"
      end
    end
  end
end
