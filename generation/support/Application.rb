require 'cutara'
module Cutara
require GENERATION + 'support/Page'
require GENERATION + 'support/Action'
require GENERATION + 'support/Eset'
require GENERATION + 'support/Input'
require GENERATION + 'support/Clickable'
require GENERATION + 'support/Table'
require GENERATION + 'support/Validator'

  class Application
    attr_accessor :current_page
    
    def initialize
      @current_page = nil
      @current_table = nil
    end

    def pages
      Page.pages
    end

    def add_page label
      p = Page.find_page(label) || Page.new(label)
      (Page.pages << p).uniq!
      @current_page = p
    end

    def add_action label, params=nil
      a = @current_page.find_action(label) || Action.new(label, params)
      (@current_page.actions << a).uniq!
    end

    def add_menu label
      @current_page.inputs.each{ |i| (i.menus << label).uniq! }
      @current_page.esets.each{ |e| (e.menus << label).uniq! }
    end

    def add_eset label, menu
      eset = @current_page.find_eset(label) || Eset.new(label)
      eset.menus << menu
      (@current_page.esets << eset).uniq!
    end

    def add_input label
      i = @current_page.find_input(label) || Input.new(label)
      (@current_page.inputs << i).uniq!
    end

    def add_link label
      c = @current_page.find_clickable(label, :link) || Clickable.new(label, :link)
      (@current_page.clickables << c).uniq!
    end

    def add_button label
      c = @current_page.find_clickable(label, :button) || Clickable.new(label, :button)
      (@current_page.clickables << c).uniq!
    end

    def add_element label
      c = @current_page.find_clickable(label, :element) || Clickable.new(label, :element)
      (@current_page.clickables << c).uniq!
    end

    def add_table label
      t = @current_page.find_table(label) || Table.new(label)
      (@current_page.tables << t).uniq!
      @current_table = t
      t
    end

    def add_column label
      @current_table.add_column label
    end

    def add_validator label, params=nil
      v = @current_page.find_validator(label) || Validator.new(label, params)
      (@current_page.validators << v).uniq!
    end

    def add_pagination
      @current_page.pagination = :pagination 
    end
  end
end
