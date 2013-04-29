# -*- encoding : utf-8 -*-
PageObjectWrapper.define_page :cutara_gui do
	locator "localhost:8000" 
	button :transliterate do
		locator :id => 'transliterate'
	end

	button :list_known do
		locator :id => 'known'
	end

	button :build do
		locator :id => 'build'
	end

	button :generate do
		locator :id => 'generate'
	end

	button :execute_locally do
		locator :id => 'local_exec'
	end

	button :execute do
		locator :id => 'exec'
	end

	text_field :tarantula_test do 
		locator :name => 'tarantula_test'
	end 

	text_field :tarantula_execution do 
		locator :name => 'tarantula_execution'
	end 

	text_field :string_in_xxx do 
		locator :name => 'string'
	end 

	action :proverku_vyvoda do
    Watir::Wait.until{ div( :id => 'output' ).text =~ /INFO/ }
    div( :id => 'output' ).text
	end
end
