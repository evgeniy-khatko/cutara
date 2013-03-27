# -*- encoding : utf-8 -*-
require 'babosa'
module Cutara
  ROOT = Dir.pwd + "/features"
  PAGES = ROOT + "/pages"
  STEPS = ROOT + "/step_definitions"
  SUPPORT = ROOT + "/support"
  ASSETS = File.dirname(__FILE__)+"/../assets"
  GENERATION = File.dirname(__FILE__)+"/../generation/"
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
      return self.to_slug.to_ruby_method.downcase
    else
      return self.to_slug.transliterate(String.label_language).to_ruby_method.downcase
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

  def to_each
    self.to_label+'_each'
  end

  def to_open_subpage
    self.to_label+'_open'
  end

  def to_params
    params = {}
    self.split(",").collect(&:strip).sort.each{|p|
      params[p.split("=")[0].strip.to_sym] = p.split("=")[1].strip
    }
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
