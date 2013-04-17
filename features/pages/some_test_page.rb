# -*- encoding : utf-8 -*-
PageObjectWrapper.define_page(:some_test_page) do
  locator 'http://www.cs.tut.fi/~jkorpela/www/testel.html'

  text_field(:tf) do
    locator :id => 'f1'
    menu :loud, 'tf food'
  end

  button(:cool_button) do
    locator :name => 'foo'
    press_action :click
  end

  link :some_link do
    locator :name => 'foo'
  end


  elements_set(:test_elements) do

    textarea(:ta) do
      locator :id => 'f2'
      menu :loud, 'ta food'
    end

    radio(:rb){ 
      locator :id => 'f3' 
      menu :loud, true
      menu :quite, false
    }
  end

  action(:press_cool_button) do 
    button(:id => 'but').click
  end

  action(:fill_text_area) do |fill_with|
    data = (fill_with.nil?)? 'Default data' : fill_with
    textarea(:id => 'f2').set data
    textarea(:id => 'f2').value
  end

  action(:populate_text_field) do
    text_field(:id => 'f1').set 'whible'
    ''
  end

  table(:countries) do
    locator :summary => 'Each row names a Nordic country and specifies its total area and land area, in square kilometers'
    header [:country, :total_area, :land_area]
  end

  action(:znachenie_hedera) do
    h1.when_present.text
  end 

  validator(:znachenie_hedera) do
    h1.when_present.text
  end 
end
