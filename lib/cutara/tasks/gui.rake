require 'cutara'

namespace "cutara" do
  desc "Starts webserver which helps to run commands with WEB interface"
  task :gui do
    raise "#{Cutara::SUPPORT}/tarantula.yml not found, please run \'bundle exec rake cutara:build\' and update tarantula.yml" unless File.exist? "#{Cutara::SUPPORT}/tarantula.yml"
    system "bundle exec ruby webserver/controller.rb"
  end
end
