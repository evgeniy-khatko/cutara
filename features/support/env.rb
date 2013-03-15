# -*- encoding : utf-8 -*-
require 'page_object_wrapper'
require 'StringHelper'
require 'rspec/expectations'
World(RSpec::Matchers)

PageObjectWrapper.load "./features/pages"
PageObjectWrapper.use_browser Watir::Browser.new

at_exit do
  PageObjectWrapper.browser.quit
end
