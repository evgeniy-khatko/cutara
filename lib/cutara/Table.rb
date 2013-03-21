require 'PageElement'
class Table < PageElement
  attr_accessor :columns
  def initialize label
    super label
    @columns = []
  end

  def to_snippet
    "\ttable #{@label.inspect} do\n\tend\n\n"
  end
end



