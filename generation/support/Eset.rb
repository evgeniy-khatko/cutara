require 'cutara'
include Cutara
require GENERATION + 'support/PageElement'
  class Eset < PageElement
    attr_accessor :menus
    def initialize label
      super label
      @menus = []
    end

    def to_snippet
      out = "\telements_set #{@label.inspect} do \n"
      @menus.uniq.each{|menu|
        out += "\t\tmenu #{menu.inspect} \n"
      }
      out += "\tend\n\n"
    end
  end
