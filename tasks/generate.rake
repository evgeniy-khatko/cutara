require 'Helper'
require 'Application'


namespace "cutara" do
  desc "Generates page_objects according to page_object_wrapper gem"
  task :generate do
    raise "#{ROOT} not found, please run rake cutara:build before running this task" unless File.exist? ROOT
  end
end


