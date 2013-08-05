# -*- encoding : utf-8 -*-
require 'babosa'
module Cutara
  ROOT = Dir.pwd + "/features"
  PAGES = ROOT + "/pages"
  STEPS = ROOT + "/step_definitions"
  SCRN = ROOT + "/screenshots"
  SUPPORT = ROOT + "/support"
  EXECUTION = File.dirname(__FILE__)+"/../execution/"
  GENERATION = File.dirname(__FILE__)+"/../generation/"
  TMP = File.dirname(__FILE__)+"/../tmp/"
  WEBSERVER = File.dirname(__FILE__)+"/../lib/webserver"

  class ExecutionStepError < StandardError; end
  class ParseError < StandardError; end
end

class String
  @supported_languages = [:english,:bulgarian,:danish,:german,:greek,:macedonian,:norwegian,:romanian,:russian,:serbian,:spanish,:swedish,:ukrainian]
  @@label_language = :russian

  def self.label_language=(l)
    raise ArgumentError, "unsupported language, supported languages: #{@supported_languages.inspect}\nmore: https://github.com/norman/babosa.git"\
    unless @supported_languages.include? l
    @@label_language = l
  end

  def self.label_language
    @@label_language
  end

  def to_label
    if String.label_language == :english
      return self.to_slug.to_ruby_method.downcase.gsub(/\W/,'')
    else
      return self.to_slug.transliterate(String.label_language).to_ruby_method.downcase.gsub(/\W/,'')
    end
  end
  
  def to_action
    'fire_'+self.to_label
  end

  def to_validator
    'validate_'+self.to_label
  end

  def to_input
    'feed_'+self.to_label
  end

  def to_press_action
    'press_'+self.to_label
  end

  def to_select
    'select_from_'+self.to_label
  end

  def to_select_row
    'select_row_from_'+self.to_label
  end

  def to_each
    self.to_label+'_each'
  end

  def to_open_subpage
    self.to_label+'_open'
  end

  def is_variable?
    /^_/ === self
  end

  def to_params
    params = {}
    i = 0
    begin
      self.split(",").collect(&:strip).sort.each{|p|
        i += 1
        if p =~ /=/
          params[p.split("=")[0].strip.to_label.to_sym] = p.split("=")[1].strip
        else
          params[p.strip.to_label.to_sym] = p.strip
        end
      }
    rescue
      raise Cutara::ParseError, "inside params: #{self}"
    end
    params
  end
end

class Dir
  def recursive_each &block
    self.each do |dir|
      dirpath = self.path + '/' + dir
      if File.directory?(dirpath) then
        if dir != '.' && dir != '..' then
          Dir.new(dirpath).recursive_each &block
        end
      else
        block.call dirpath
      end
    end
  end
end
