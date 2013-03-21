require 'Page'
require 'Action'
require 'Eset'
require 'Input'
require 'Clickable'
require 'Table'
require 'Validator'
require 'Pagination'

class Application
  attr_accessor :pages, :current_page
  
  def initialize
    @pages = []
    @current_page = nil
  end

  def add_page label
    p = Page.find_page(label) || Page.new(label)
    (Page.pages << p).uniq!
    @current_page = p
  end

  def add_action label, params=nil
    a = Page.find_action(label) || Action.new(label)
    (@current_page.actions << a).uniq!
  end

  def add_menu label
    @current_page.inputs.each{ |i| i.menus << label }
    @current_page.esets.each{ |e| e.menus << label }
  end

  def add_eset label, menu
    eset = Page.find_eset(label) || Eset.new(label)
    eset.menus << menu
    (@current_page.esets << eset).uniq!
  end

  def add_input label
    i = Page.find_input(label) || Input.new(label)
    (@current_page.inputs << i).uniq!
  end

  def add_link label
    c = Page.find_clickable(label, :link) || Clickable.new(label, :link)
    (@current_page.clickables << c).uniq!
  end

  def add_button label
    c = Page.find_clickable(label, :button) || Clickable.new(label, :button)
    (@current_page.clickables << c).uniq!
  end

  def add_element label
    c = Page.find_clickable(label, :element) || Clickable.new(label, :element)
    (@current_page.clickables << c).uniq!
  end

  def add_table label
    t = Page.find_table(label) || Table.new(label)
    (@current_page.tables << t).uniq!
  end

  def add_validator label
    v = Page.find_validator(label) || Validator.new(label)
    (@current_page.validators << v).uniq!
  end

  def add_pagination
    @current_page.pagination = :pagination 
  end
end
