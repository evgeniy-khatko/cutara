require 'PageElement'
class Clickable < PageElement
  def initialize label, type
    super label
    @type = type
  end

  def to_snippet
    "\t#{@type} #{@label.inspect} do\n\tend\n\n"
  end
end


