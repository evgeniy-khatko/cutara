require 'PageElement'

class Page < PageElement
  attr_accessor :label, :actions, :esets, :inputs, :clickables, :tables, :pagination, :validators
  @@pages = []

  def initialize label
    @label = label
    @actions = []
    @esets = []
    @inputs = []
    @clickables = []
    @tables = []
    @validators = []
    @pagination = nil
  end

  def self.pages
    @@pages
  end

  def to_snippet
    out = "PageObjectWrapper.define_page #{@label.inspect} do\n\tlocator\n"
    @clickables.each{ |e| out += e.to_snippet }
    @inputs.each{ |e| out += e.to_snippet }
    @esets.each{ |e| out += e.to_snippet }
    @tables.each{ |e| out += e.to_snippet }
    @actions.each{ |e| out += e.to_snippet }
    @validators.each{ |e| out += e.to_snippet }
    out += "\tpagination :pagination do\n\tend\n" if @pagination
    out += "end"
  end

  def self.find_page label
    @@pages.select{|e| e.label == label}.first
  end

  def find_action label
    @actions.select{|e| e.label == label}.first
  end

  def find_clickable label, type
    @clickables.select{|e| e.label == label and e.type == type}.first
  end

  def find_eset label
    @esets.select{|e| e.label == label}.first
  end

  def find_input label
    @inputs.select{|e| e.label == label }.first
  end

  def find_table label
    @tables.select{|e| e.label == label}.first
  end

  def find_validator label
    @validators.select{|e| e.label == label}.first
  end
end

