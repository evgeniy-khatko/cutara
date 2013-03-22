# -*- encoding : utf-8 -*-
require 'Application'
require 'Helper'
module Generator
  @app = Application.new
end

World{ Generator }

at_exit do
  @app.pages.each{ |p| 
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
