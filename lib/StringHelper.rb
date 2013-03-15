# -*- encoding : utf-8 -*-
require 'babosa'
class String
  SUPPORTED_LABEL_LANGUAGES = [:english,:bulgarian,:danish,:german,:greek,:macedonian,:norwegian,:romanian,:russian,:serbian,:spanish,:swedish,:ukrainian]
  @@label_language = :russian

  def self.label_language=(l)
    raise ArgumentError, "unsupported language, supported languages: #{SUPPORTED_LABEL_LANGUAGES.inspect}\nmore: https://github.com/norman/babosa.git"\
    unless SUPPORTED_LABEL_LANGUAGES.include? l
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
