# -*- encoding : utf-8 -*-
def feed_page(menu_name=nil)
  PageObjectWrapper.current_page.feed_all(menu_name.to_label.to_sym)
end

def feed_set(set_name, menu_name=nil)
  PageObjectWrapper.current_page.send set_name.to_input, menu_name.to_label.to_sym
end

def feed_field(field_name, value=nil)
  PageObjectWrapper.current_page.send field_name.to_input, value
end

Пусть /^на странице введены данные типа "(.*?)"$/ do |arg1|
  feed_page(arg1)
end

Пусть /^в набор элементов "(.*?)" введены данные типа "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Пусть /^на форме "(.*?)" введены данные типа "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Пусть /^в поле "(.*?)" введено значение "(.*?)"$/ do |arg1, arg2|
  feed_field(arg1, arg2)
end

Если /^на странице ввести данные типа "(.*?)"$/ do |arg1|
  feed_page(arg1)
end

Если /^в набор элементов "(.*?)" ввести данные типа "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Если /^на форме "(.*?)" ввести данные типа "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Если /^в поле "(.*?)" ввести значение "(.*?)"$/ do |arg1, arg2|
  feed_field(arg1, arg2)
end
