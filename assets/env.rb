# -*- encoding : utf-8 -*-
require 'page_object_wrapper'
require 'cutara'
require 'rspec/expectations'
World(RSpec::Matchers)

PageObjectWrapper.load "#{Dir.pwd}/features/pages"
PageObjectWrapper.use_browser Watir::Browser.new
PageObjectWrapper.browser.driver.manage.window.maximize

at_exit do
  PageObjectWrapper.browser.quit
end
