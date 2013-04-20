# -*- encoding : utf-8 -*-
include Cutara

# open_steps
Допустим /^открыта страница "(.*?)"$/ do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Допустим /^страница "(.*?)" открыта с параметрами "(.*?)"$/ do |arg1, arg2|
  APP.add_page arg1.to_label.to_sym
end

Допустим /^открыть страницу "(.*?)"$/ do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Допустим /^страницу "(.*?)" открыть с параметрами "(.*?)"$/ do |arg1, arg2|
  APP.add_page arg1.to_label.to_sym
end

Допустим(/^открыт диалог "(.*?)"$/) do |arg1|
  APP.add_page arg1.to_label.to_sym
end


# action_steps
Допустим /^выполнено "(.*?)"$/ do |arg1|
  APP.add_action arg1.to_label.to_sym
end

Допустим /^"(.*?)" выполнено с параметрами "(.*?)"$/ do |arg1, arg2|
  args = arg2.to_params.keys
  APP.add_action arg1.to_label.to_sym, args
end

Допустим /^выполнить "(.*?)"$/ do |arg1|
  APP.add_action arg1.to_label.to_sym
end

Допустим /^"(.*?)" выполнить с параметрами "(.*?)"$/ do |arg1, arg2|
  args = arg2.to_params.keys
  APP.add_action arg1.to_label.to_sym, args
end

# data_input_steps
Допустим /^на странице введены "(.*?)"$/ do |arg1|
  APP.add_menu arg1.to_label.to_sym
end

Допустим /^в набор элементов "(.*?)" введены "(.*?)"$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Допустим /^на форме "(.*?)" введены "(.*?)"$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Допустим /^в поле "(.*?)" введено "(.*?)"$/ do |arg1, arg2|
  APP.add_input arg1.to_label.to_sym
end

Допустим /^на странице ввести "(.*?)"$/ do |arg1|
  APP.add_menu arg1.to_label.to_sym
end

Допустим /^в набор элементов "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Допустим /^на форме "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Допустим /^в поле "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  APP.add_input arg1.to_label.to_sym
end

# press_steps
Допустим /^была нажата ссылка "(.*?)"$/ do |arg1|
  APP.add_link arg1.to_label.to_sym
end

Допустим /^была нажата кнопка "(.*?)"$/ do |arg1|
  APP.add_button arg1.to_label.to_sym
end

Допустим /^был нажат элемент "(.*?)"$/ do |arg1|
  APP.add_element arg1.to_label.to_sym
end

Допустим /^нажать ссылку "(.*?)"$/ do |arg1|
  APP.add_link arg1.to_label.to_sym
end

Допустим /^нажать кнопку "(.*?)"$/ do |arg1|
  APP.add_button arg1.to_label.to_sym
end

Допустим /^нажать на элемент "(.*?)"$/ do |arg1|
  APP.add_element arg1.to_label.to_sym
end

# table_steps
Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)"$/ do |arg1, arg2|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" выбрать ячейку колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" выбрать ячейку с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" выбрать ячейку с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" выбрать элемент колонки "(.*?)"$/ do |arg1, arg2|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" выбрать элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  t = APP.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end
# pagination_steps
Допустим /^открыта "(.*?)" страница пагинации$/ do |arg1|
  APP.add_pagination
end

Допустим /^на каждой странице пагинации выполнить "(.*?)"$/ do |arg1|
  APP.add_pagination
  APP.add_action arg1.to_label.to_sym
end

Допустим /^на первых "(.*?)" страницах пагинации выполнить "(.*?)"$/ do |arg1, arg2|
  APP.add_pagination
  APP.add_action arg2.to_label.to_sym
end

Допустим /^перейти на "(.*?)" страницу пагинации$/ do |arg1|
  APP.add_pagination
end

# validation_steps
Допустим(/^открывается страница "(.*?)"$/) do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Допустим(/^проверка "(.*?)" вернет "(.*?)"$/) do |arg1, arg2|
  APP.add_validator arg1.to_label.to_sym
end

Допустим(/^"(.*?)" вернет "(.*?)"$/) do |arg1, arg2|
  APP.add_action arg1.to_label.to_sym
end

Допустим(/^выполнение "(.*?)" с параметрами "(.*?)" вернет "(.*?)"$/) do |arg1, arg2, arg3|
  args = arg2.to_params.keys
  APP.add_action arg1.to_label.to_sym, args
end

Допустим(/^в "(.*?)" строке колонки "(.*?)" таблицы "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg3.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" равным "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  t = APP.add_table arg2.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Допустим(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" похожим на "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  t = APP.add_table arg2.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Допустим(/^открывается диалог "(.*?)"$/) do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Допустим(/^открыть новое окно браузера$/) do
end

Допустим(/^значение поля "(.*?)" равно "(.*?)"$/) do |arg1, arg2|
  APP.add_input arg1.to_label.to_sym
end

Допустим(/^результат запомнить как "(.*?)"$/) do |arg1|
end

Допустим(/^"(.*?)" равно "(.*?)"$/) do |arg1, arg2|
end

Допустим(/^текст ячейки "(.*?)" равен "(.*?)"$/) do |arg1, arg2|
  APP.add_column arg1.to_label.to_sym
end

Допустим(/^текст ячейки "(.*?)" запомнить как "(.*?)"$/) do |arg1, arg2|
end

Допустим(/^в таблице "(.*?)" есть строка:$/) do |arg1, table|
  t = APP.add_table arg1.to_label.to_sym
  raise "search criteria: #{table.raw.inspect} has more that 2 rows" if table.raw.length != 2
  table.hashes.first.keys.each{ |column_name|
    t.add_column column_name.to_label.to_sym
  }
end

Допустим(/^нажать на ячейку "(.*?)"$/) do |arg1|
end

Допустим(/^проверить "(.*?)"$/) do |arg1|
  APP.add_validator arg1.to_label.to_sym
end
