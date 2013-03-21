require "active_support/core_ext/hash/conversions"
require 'httparty'
require 'Helper'

class TarantulaUpdater
  include HTTParty

  @config = nil
  # debug_output $stdout
  headers  'Content-type' => 'text/xml'
 
  def self.config= hash
    @config = hash
  end

  def self.get_tests options 
    options = options.merge({ "language" => @config["language"] })
    params = { 
      :basic_auth => { :username => @config["username"], :password => @config["password"] },
      :body => options.to_xml(:skip_types => true, :root => "request")
    }
    self.post(@config["server"]+'/api/get_scenarios', params)
  end
end
