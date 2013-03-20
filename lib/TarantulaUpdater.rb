require "active_support/core_ext/hash/conversions"
require 'httparty'
class TarantulaUpdater
  include HTTParty

#  debug_output $stdout
  headers  'Content-type' => 'text/xml'
  @credentials = { :username => 'admin', :password => 'admin' }
 

  def self.get_tests options 
    options = options.merge({ "language" => 'ru' })
    params = { 
      :basic_auth => @credentials,
      :body => options.to_xml(:skip_types => true, :root => "request")
    }
    self.post('http://localhost:3000/api/get_scenarios', params)
  end
end
