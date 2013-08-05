# -*- encoding : utf-8 -*-
Допустим /^открыть страницу "(.*?)"$/ do |arg1|
  open_page(arg1)
end

Допустим /^выполнить "(.*?)"$/ do |arg1|
  run_action arg1
end

Допустим /^"(.*?)" выполнить с параметрами "(.*?)"$/ do |arg1, arg2|
  run_action_with_args(arg1, arg2)
end

Допустим(/^проверить "(.*?)"$/) do |arg1|
  run_validator(arg1)
end

Допустим(/^результат запомнить как "(.*?)"$/) do |arg1|
  result_remember_as arg1
end

Допустим /^на форме "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Допустим /^в поле "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  feed_field(arg1, arg2)
end

Допустим(/^значение поля "(.*?)" равно "(.*?)"$/) do |arg1, arg2|
  field_value_is_equal_to arg1, arg2
end

Допустим(/^значение поля "(.*?)" содержит "(.*?)"$/) do |arg1, arg2|
  field_value_contains arg1, arg2
end

Допустим(/^"(.*?)" равно "(.*?)"$/) do |arg1, arg2|
  variable_value_equals_to arg1, arg2
end

Допустим(/^"(.*?)" содержит "(.*?)"$/) do |arg1, arg2|
  variable_value_contains arg1, arg2
end

Допустим /^на странице ввести "(.*?)"$/ do |arg1|
  feed_page(arg1)
end

Допустим /^в набор элементов "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Допустим /^страницу "(.*?)" открыть с параметрами "(.*?)"$/ do |arg1, arg2|
  open_page_with_params(arg1, arg2)
end

Допустим /^на каждой странице пагинации выполнить "(.*?)"$/ do |arg1|
  run_on_each arg1
end

Допустим /^на первых "(.*?)" страницах пагинации выполнить "(.*?)"$/ do |arg1, arg2|
  run_on_first_N arg1, arg2
end

Допустим /^перейти на "(.*?)" страницу пагинации$/ do |arg1|
  open_subpage arg1
end

Допустим /^нажать ссылку "(.*?)"$/ do |arg1|
  press arg1
end

Допустим /^нажать кнопку "(.*?)"$/ do |arg1|
  press arg1
end

Допустим /^нажать на элемент "(.*?)"$/ do |arg1|
  press arg1
end

Допустим(/^открыть новое окно браузера$/) do
  close_browser
  start_browser
end

Допустим(/^в таблице "(.*?)" есть строка:$/) do |arg1, table|
  table_has_string arg1, table
end

Допустим(/^таблица "(.*?)" не содержит "(.*?)"$/) do |arg1, arg2|
  table_doesnt_contain arg1, arg2
end

Допустим(/^в таблице "(.*?)" есть строки:$/) do |arg1, table|
  select_rows(arg1, table.hashes)
end

Допустим(/^нажать на ячейку "(.*?)"$/) do |arg1|
  press_on_cell arg1
end

Допустим(/^текст ячейки "(.*?)" равен "(.*?)"$/) do |arg1, arg2|
  cell_text_equal_to arg1, arg2
end

Допустим(/^текст ячейки "(.*?)" запомнить как "(.*?)"$/) do |arg1, arg2|
  cell_text_remember arg1, arg2
end

Допустим(/^"(.*?)" вернет "(.*?)"$/) do |arg1, arg2|
  run_action_validator(arg1, arg2)
end

Допустим(/^выполнение "(.*?)" с параметрами "(.*?)" вернет "(.*?)"$/) do |arg1, arg2, arg3|
  run_action_with_args_validator(arg1, arg2, arg3)
end

Допустим /^в таблице "(.*?)" выбрать ячейку колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select(arg1, arg2, arg3, arg4)
end

Допустим /^в таблице "(.*?)" выбрать ячейку с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select_regexp(arg1, arg2, arg2, arg3)
end

Допустим /^в таблице "(.*?)" выбрать ячейку с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select(arg1, arg2, arg2, arg3)
end

Допустим /^в таблице "(.*?)" выбрать элемент колонки "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg1, arg2)
end

Допустим /^в таблице "(.*?)" выбрать элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

Допустим(/^в "(.*?)" строке колонки "(.*?)" таблицы "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  select_by_row_num_validator(arg1, arg2, arg3, arg4)
end

Допустим(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" равным "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  complex_select_validator(arg1, arg2, arg3, arg4, arg5)
end

Допустим(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" похожим на "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  complex_select_regexp_validator(arg1, arg2, arg3, arg4, arg5)
end

Допустим(/^открывается страница "(.*?)"$/) do |arg1|
  current_page_is arg1
end

Допустим(/^открывается диалог "(.*?)"$/) do |arg1|
  current_page_is arg1
end

Допустим /^выполнено "(.*?)"$/ do |arg1|
  run_action arg1
end

Допустим /^"(.*?)" выполнено с параметрами "(.*?)"$/ do |arg1, arg2|
  run_action_with_args(arg1, arg2)
end

Допустим /^на странице введены "(.*?)"$/ do |arg1|
  feed_page(arg1)
end

Допустим /^в набор элементов "(.*?)" введены "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Допустим /^на форме "(.*?)" введены "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Допустим /^в поле "(.*?)" введено "(.*?)"$/ do |arg1, arg2|
  feed_field(arg1, arg2)
end

Допустим /^открыта страница "(.*?)"$/ do |arg1|
  open_page(arg1)
end

Допустим /^открыт диалог "(.*?)"$/ do |arg1|
  open_page(arg1)
end

Допустим /^страница "(.*?)" открыта с параметрами "(.*?)"$/ do |arg1, arg2|
  open_page_with_params(arg1, arg2)
end

Допустим /^открыта "(.*?)" страница пагинации$/ do |arg1|
  open_subpage arg1
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

Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select(arg1, arg2, arg3, arg4)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select_regexp(arg1, arg2, arg3, arg4)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select_regexp(arg1, arg2, arg2, arg3)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select(arg1, arg2, arg2, arg3)
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg1, arg2)
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

Допустим(/^в новой вкладке открывается страница "(.*?)"$/) do |arg1|
  page_is_opened_in_new_tab arg1
end

Допустим(/^подождать "(.*?)" минут\(ы\)$/) do |arg1|
  sleep arg1.to_f*60
end

Допустим(/^текущая страница - "(.*?)"$/) do |arg1|
  current_page_is arg1
end

Допустим(/^проверить юзабилити страницы$/) do
  take_shot
end
