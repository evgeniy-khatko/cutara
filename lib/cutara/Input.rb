require 'PageElement'
class Input < PageElement
  attr_accessor :menus
  def initialize label
    super label
    @menus = []
  end

  def to_snippet
    out = "\ttext_field #{@label.inspect} do\n"
    @menus.each{|menu|
      out += "\t\tmenu #{menu}\n"
    }
    out += "\tend\n\n"
  end
end

