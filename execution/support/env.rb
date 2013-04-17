# -*- encoding : utf-8 -*-
require 'page_object_wrapper'
require 'cutara'
require 'rspec/expectations'
require "#{File.dirname(__FILE__)}/helper"
include Cutara::Helper

  World(RSpec::Matchers)
  World(Cutara::Helper)

  load_pages
  start_browser

at_exit do
  close_browser
end
