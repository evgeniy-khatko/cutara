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

  action(:press_cool_button, :test_page_with_table) do
    button(:name => 'foo').when_present.click
  end

  action(:fill_text_area) do |fill_with|
    data = (fill_with.nil?)? 'Default data' : fill_with
    textarea(:id => 'f2').set data
  end

  table(:table) do
    locator :summary => 'Each row names a Nordic country and specifies its total area and land area, in square kilometers'
    header [:country, :total_area, :land_area]
  end

  validator(:textarea_value) do |expected|
    textarea(:id => 'f2').value == expected
  end

  pagination :some_pagination do
    locator "link(:text => 2)", 2
  end
end
