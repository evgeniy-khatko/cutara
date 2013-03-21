# -*- encoding : utf-8 -*-
def press el_name
  PageObjectWrapper.current_page.send el_name.to_press_action
end
Допустим /^была нажата ссылка "(.*?)"$/ do |arg1|
  press arg1  
end

Допустим /^была нажата кнопка "(.*?)"$/ do |arg1|
  press arg1  
end

Допустим /^был нажат элемент "(.*?)"$/ do |arg1|
  press arg1  
end

Если /^нажать ссылку "(.*?)"$/ do |arg1|
  press arg1
end

Если /^нажать кнопку "(.*?)"$/ do |arg1|
  press arg1
end

Если /^нажать на элемент "(.*?)"$/ do |arg1|
  press arg1
end
