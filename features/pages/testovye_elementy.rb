# -*- encoding : utf-8 -*-
PageObjectWrapper.define_page :testovye_elementy do
	locator 'file://'+Dir.pwd+'/features/pages/some_test_page.html' 
	button :cool_button do
		locator :id => 'but' 
	end

	elements_set :tekstovye_elementy do 
    text_field :single_line_text_input_field do 
      menu :odinakovye_dannye_qwerty, "qwerty"
      locator :id => 'f1' 
    end 

    text_field :multi_line_text_input_field do 
      menu :odinakovye_dannye_qwerty, "qwerty"
      locator :id => 'f2'
    end 
	end

	table :countries do 
		locator :index => 0
		header [:country, :total_area, :land_area, :link] 
	end

	action :znachenie_teksta_krasnogo_tsveta do 
    ul(:index => 1).li(:text => "red text (font color=red markup used)").text
	end

	action :proverku_hedera do 
    h1.text
	end

	action :zapolnenie_pervogo_tekstovogo_polya do |_proizvolnoe_znachenie_| 
    #random_value = rand(2**256).to_s(36)[0..7]
    random_value = 'random value'
    text_field( :id => 'f1' ).set random_value
    random_value
	end

	validator :nalichie_elementa_red_text_krasnogo_tsveta do 
    ul(:index => 1).li(:text => "red text (font color=red markup used)").present?
	end

end
