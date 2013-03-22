# -*- encoding : utf-8 -*-
require 'page_object_wrapper'
require 'Helper'
require 'rspec/expectations'
require 'ruby-debug' 
require 'Application'
World(RSpec::Matchers)

PageObjectWrapper.load File.dirname(__FILE__)+"/../pages"
PageObjectWrapper.use_browser Watir::Browser.new
PageObjectWrapper.browser.driver.manage.window.maximize
@app = Application.new

at_exit do
  PageObjectWrapper.browser.quit
end
