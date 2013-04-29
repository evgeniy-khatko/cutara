# -*- encoding : utf-8 -*-
PageObjectWrapper.define_page :yandex do
	locator "http://yandex.ru/yandsearch?text=:text" 

	action :poiska do |tekst| 
    text_field( :name => 'text' ).set tekst
    span( :text => 'Найти' ).click
    strong( :class => 'b-head-logo__text' ).when_present.text.gsub("\n",' ')
	end

  text_field :poisk do
    locator :name => 'text'
  end

	action :proverku_nalichiya_teksta_nashlos_32_mln_otvetov do 
    strong( :class => 'b-head-logo__text' ).when_present.text == "Нашлось\n23 млн ответов"
	end

	pagination :pagination do 
    locator 'div(:class => "b-pager__pages").a(:text => "10")', '10'
	end
end
