#! /usr/bin/ruby -w
require 'sinatra'
require 'padrino-helpers'
require 'erb'
require 'cutara'
require 'json/pure'
require 'yaml'
if RUBY_PLATFORM=='i386-mingw32'
	require 'win32/process'
	require 'win32/open3'
else
	require 'open3'
	include Open3
end

PORT=8000
config = YAML.load(File.open(Cutara::SUPPORT+"/tarantula.yml"))
#config = YAML.load(File.open(File.dirname(__FILE__)+'/../../execution/support/tarantula.yml'))
LANG = config["language"]
TARANTULA_HOST = config["server"]
TARANTULA_USER = config["username"]
TARANTULA_PROJECT = config["project"]
ENV["cutara_mode"] = 'gui'

Sinatra.register Padrino::Helpers
configure do
	set :sessions, true
	set :environment, :development
	set :port, PORT
	set :server, %w[mongrel]
  # production mode settings
  
  #set :logging, false
  #set :dump_errors, false
  #set :raise_errors, false
  #set :show_exceptions, false
  
  # use this for development mode
  set :logging, true
  set :dump_errors, true
  set :raise_errors, true
  set :show_exceptions, true		
end

  get '/' do
    erb :index
  end
	
	post '/build' do		
		content_type :json
    execute "bundle exec rake cutara:build[\"#{params['tarantula_project']}\",\"#{params['tarantula_test']}\",\"#{params['tarantula_tag']}\",\"#{params['tarantula_execution']}\"]"
    return {:status => 'ok'}.to_json		
	end

	post '/exec' do		
		content_type :json
    execute "bundle exec rake cutara:exec_html_output[\"#{params['tarantula_project']}\",\"#{params['tarantula_test']}\",\"#{params['tarantula_tag']}\",\"#{params['tarantula_execution']}\"]"
    return {:result => 'ok'}.to_json		
	end

	post '/generate' do		
		content_type :json
    execute "bundle exec rake cutara:generate"
    return {:result => 'ok'}.to_json		
	end

	post '/local_exec' do		
		content_type :json
    execute "bundle exec rake cutara:local_exec", true
    return {:result => 'ok'}.to_json		
	end

	post '/known' do		
		content_type :json
    execute "bundle exec rake cutara:known"
    return {:result => 'ok'}.to_json		
	end

	post '/transliterate' do		
		content_type :json
    execute "bundle exec rake cutara:transliterate[\"#{params['string']}\"]"
    return {:result => 'ok'}.to_json		
	end

  def execute(cmd, html_output=false)
    output = ''
    exit_status = nil
    Open3.popen2e(cmd){|i,oe,t|
      output = oe.read
      exit_status = t.value
    }
    if !html_output
      output = html_template(output.gsub("\n","</br>")) 
    end
    result = File.new("#{File.dirname(__FILE__)}/public/result.html","w+")
    result.puts output
    result.close
  end

  def html_template(body)
    "<html>
    <head>
    </head>
    <body>
      #{body}
    </body>
    </html>
    "
  end
