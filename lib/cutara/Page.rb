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
    out = "PageObjectWrapper.define_page #{@label.inspect} do\n"
    @clickables.each{ |e| out += e.to_snippet }
    @inputs.each{ |e| out += e.to_snippet }
    @esets.each{ |e| out += e.to_snippet }
    @actions.each{ |e| out += e.to_snippet }
    @validators.each{ |e| out += e.to_snippet }
    out += "\tpagination :pagination do\n\tend\n" if @pagination
    out += "end"
  end

private 

  def self.find_action label
    @actions.select{|e| e.label == label}.first
  end

  def self.find_clickable label, type
    @clickables.select{|e| e.label == label and e.type == type}.first
  end

  def self.find_eset label, type
    @esets.select{|e| e.label == label and e.type == type}.first
  end

  def self.find_input label, type
    @inputs.select{|e| e.label == label and e.type == type}.first
  end

  def self.find_table label
    @tables.select{|e| e.label == label}.first
  end

  def self.find_validator label
    @validators.select{|e| e.label == label}.first
  end
end

