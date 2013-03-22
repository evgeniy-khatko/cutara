require "active_support/core_ext/hash"
require 'httparty'
require 'Helper'

class TarantulaUpdater
  include HTTParty

  @config = nil
  debug_output $stdout
  headers  'Content-type' => 'application/xml', 'Accept' => 'application/xml' 

  def self.config= hash
    @config = hash
  end

  def self.get_tests options 
    options = options.merge({ "language" => @config["language"] })
    params = { 
      :basic_auth => { :username => @config["username"], :password => @config["password"] },
      :body => options.to_xml(:skip_types => true, :root => "request")
    }
    response = self.post(@config["server"]+'/api/get_scenarios', params)
    raise response.body unless response.code == 200
    response
  end

  def self.update_testcase_step(project, execution, testcase, step_position, result, comment)
    body = {      
        :project => project,
        :execution => execution,
        :testcase => testcase,
        :position => step_position,
        :result => result,
        :comment => comment
      }.to_xml(:skip_types => true, :root => "request")

    params = { 
      :basic_auth => { :username => @config["username"], :password => @config["password"] },
      :body => body
    }
    response = self.post(@config["server"]+'/api/update_testcase_step', params)
    raise response.body unless response.code == 200
    response
  end
end
