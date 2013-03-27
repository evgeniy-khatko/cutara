# -*- encoding : utf-8 -*-
require 'cutara'
require Cutara::GENERATION + 'Application'
module Cutara
  APP = Application.new unless const_defined?(:APP)
end

World{ Cutara }

at_exit do
  Cutara::APP.pages.each{ |p| 
    file_name = "#{ROOT}/pages/#{p.label.to_s}.rb"
    raise "directory #{ROOT}/pages not found, run rake cutara:build first" unless File.exist? "#{ROOT}/pages"
    data = p.to_snippet
    unless File.exist? file_name
      File.open(file_name, "w") do |f|
        f.puts "# -*- encoding : utf-8 -*-"
        f.puts data
        f.close
      end
    end
    puts data
  }
end
