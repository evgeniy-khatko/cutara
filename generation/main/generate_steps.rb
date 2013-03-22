# -*- encoding : utf-8 -*-
require 'Application'
@app = Application.new

# open_steps
Допустим /^открыта страница "(.*?)"$/ do |arg1|
  @app.add_page arg1.to_label.to_sym
end

Допустим /^страница "(.*?)" открыта с параметрами "(.*?)"$/ do |arg1, arg2|
  @app.add_page arg1.to_label.to_sym
end

Если /^открыть страницу "(.*?)"$/ do |arg1|
  @app.add_page arg1.to_label.to_sym
end

Если /^страницу "(.*?)" открыть с параметрами "(.*?)"$/ do |arg1, arg2|
  @app.add_page arg1.to_label.to_sym
end

# action_steps
Допустим /^выполнено действие "(.*?)"$/ do |arg1|
  @app.add_action arg1.to_label.to_sym
end

Допустим /^действие "(.*?)" выполнено с параметрами "(.*?)"$/ do |arg1, arg2|
  args = arg2.to_params.keys
  @app.add_action arg1.to_label.to_sym, args
end

Если /^выполнить действие "(.*?)"$/ do |arg1|
  @app.add_action arg1.to_label.to_sym
end

Если /^действие "(.*?)" выполнить с параметрами "(.*?)"$/ do |arg1, arg2|
  args = arg2.to_params.keys
  @app.add_action arg1.to_label.to_sym, args
end

# data_input_steps
Пусть /^на странице введены данные типа "(.*?)"$/ do |arg1|
  @app.add_menu arg1.to_label.to_sym
end

Пусть /^в набор элементов "(.*?)" введены данные типа "(.*?)"$/ do |arg1, arg2|
  @app.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Пусть /^на форме "(.*?)" введены данные типа "(.*?)"$/ do |arg1, arg2|
  @app.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Пусть /^в поле "(.*?)" введено значение "(.*?)"$/ do |arg1, arg2|
  @app.add_input arg1.to_label.to_sym
end

Если /^на странице ввести данные типа "(.*?)"$/ do |arg1|
  @app.add_menu arg1.to_label.to_sym
end

Если /^в набор элементов "(.*?)" ввести данные типа "(.*?)"$/ do |arg1, arg2|
  @app.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Если /^на форме "(.*?)" ввести данные типа "(.*?)"$/ do |arg1, arg2|
  @app.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Если /^в поле "(.*?)" ввести значение "(.*?)"$/ do |arg1, arg2|
  @app.add_input arg1.to_label.to_sym
end

# press_steps
Допустим /^была нажата ссылка "(.*?)"$/ do |arg1|
  @app.add_link arg1.to_label.to_sym
end

Допустим /^была нажата кнопка "(.*?)"$/ do |arg1|
  @app.add_button arg1.to_label.to_sym
end

Допустим /^был нажат элемент "(.*?)"$/ do |arg1|
  @app.add_element arg1.to_label.to_sym
end

Если /^нажать ссылку "(.*?)"$/ do |arg1|
  @app.add_link arg1.to_label.to_sym
end

Если /^нажать кнопку "(.*?)"$/ do |arg1|
  @app.add_button arg1.to_label.to_sym
end

Если /^нажать на элемент "(.*?)"$/ do |arg1|
  @app.add_element arg1.to_label.to_sym
end

# table_steps
Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)"$/ do |arg1, arg2|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Если /^в таблице "(.*?)" выбрать ячейку колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Если /^в таблице "(.*?)" выбрать ячейку с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Если /^в таблице "(.*?)" выбрать ячейку с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Если /^в таблице "(.*?)" выбрать элемент колонки "(.*?)"$/ do |arg1, arg2|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Если /^в таблице "(.*?)" выбрать элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  t = @app.add_table arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end
# pagination_steps
Допустим /^открыта "(.*?)" страница пагинации$/ do |arg1|
  @app.add_pagination
end

Допустим /^на каждой странице пагинации выполнить действие "(.*?)"$/ do |arg1|
  @app.add_pagination
  @app.add_action arg1.to_label.to_sym
end

Допустим /^на первых "(.*?)" страницах пагинации выполнить действие "(.*?)"$/ do |arg1, arg2|
  @app.add_pagination
  @app.add_action arg2.to_label.to_sym
end

Допустим /^перейти на "(.*?)" страницу пагинации$/ do |arg1|
  @app.add_pagination
end

# validation_steps
Тогда(/^открывается страница "(.*?)"$/) do |arg1|
  @app.add_page arg1.to_label.to_sym
end

Тогда(/^проверка "(.*?)" вернет "(.*?)"$/) do |arg1, arg2|
  @app.add_validator arg1.to_label.to_sym
end

Тогда(/^действие "(.*?)" вернет "(.*?)"$/) do |arg1, arg2|
  @app.add_action arg1.to_label.to_sym
end

Тогда(/^выполнение действия "(.*?)" с параметрами "(.*?)" вернет "(.*?)"$/) do |arg1, arg2, arg3|
  args = arg2.to_params.keys
  @app.add_action arg1.to_label.to_sym, args
end

Тогда(/^в "(.*?)" строке колонки "(.*?)" таблицы "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  t = @app.add_table arg3.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Тогда(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" равным "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  t = @app.add_table arg2.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Тогда(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" похожим на "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  t = @app.add_table arg2.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

