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
  res = PageObjectWrapper.current_result
  remember_as(arg1, res)
end

Допустим /^на форме "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Допустим /^в поле "(.*?)" ввести "(.*?)"$/ do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  feed_field(arg1, value)
end

Допустим(/^значение поля "(.*?)" равно "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  PageObjectWrapper.current_page.send(arg1.to_label.to_sym).value.should eq value
end

Допустим(/^значение поля "(.*?)" содержит "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  PageObjectWrapper.current_page.send(arg1.to_label.to_sym).value.should =~ /#{value}/
end

Допустим(/^"(.*?)" равно "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  recall(arg1).should eq value
end

Допустим(/^"(.*?)" содержит "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  recall(arg1).should =~ /#{value}/
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
  current_page = PageObjectWrapper.current_page
  current_page.pagination_each{ |p|
    p.send arg1.to_action
  arg1.to_label.to_sym}
end

Допустим /^на первых "(.*?)" страницах пагинации выполнить "(.*?)"$/ do |arg1, arg2|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_each( :limit => arg1.strip.to_i ){ |p|
    p.send arg2.to_action
  }
end

Допустим /^перейти на "(.*?)" страницу пагинации$/ do |arg1|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_open arg1.strip.to_i
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
  # table is a Cucumber::Ast::Table
  raise "search criteria: #{table.raw.inspect} has more that 2 rows" if table.raw.length != 2
  select_row(arg1, table.hashes.first)
end

Допустим(/^нажать на ячейку "(.*?)"$/) do |arg1|
  res = PageObjectWrapper.current_result
  case
  when(res.is_a? Watir::TableCell)
    if res.link.exist? then res.link.click else res.click end
  when(res.is_a? Hash)
    if res[arg1.to_label.to_sym].link.exist? then res[arg1.to_label.to_sym].link.click else res[arg1.to_label.to_sym].click end
  end
end

Допустим(/^текст ячейки "(.*?)" равен "(.*?)"$/) do |arg1, arg2|
  res = PageObjectWrapper.current_result
  value = (arg2.is_variable?)? recall(arg2) : arg2
  case
  when(res.is_a? Watir::TableCell)
    res.text.should eq value
  when(res.is_a? Hash)
    res[arg1.to_label.to_sym].text.should eq value
  end
end

Допустим(/^текст ячейки "(.*?)" запомнить как "(.*?)"$/) do |arg1, arg2|
  res = PageObjectWrapper.current_result
  case
  when(res.is_a? Watir::TableCell)
    instance_variable_set '@'+arg2.to_label, res.text
  when(res.is_a? Hash)
    instance_variable_set '@'+arg2.to_label, res[arg1.to_label.to_sym].text
  end
end

Допустим(/^"(.*?)" вернет "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  run_action_validator(arg1, value)
end

Допустим(/^выполнение "(.*?)" с параметрами "(.*?)" вернет "(.*?)"$/) do |arg1, arg2, arg3|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  run_action_with_args_validator(arg1, arg2, value)
end

Допустим /^в таблице "(.*?)" выбрать ячейку колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  value = (arg4.is_variable?)? recall(arg4) : arg4
  complex_select(arg1, arg2, arg3, value)
end

Допустим /^в таблице "(.*?)" выбрать ячейку с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select_regexp(arg1, arg2, arg2, value)
end

Допустим /^в таблице "(.*?)" выбрать ячейку с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select(arg1, arg2, arg2, value)
end

Допустим /^в таблице "(.*?)" выбрать элемент колонки "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg1, arg2)
end

Допустим /^в таблице "(.*?)" выбрать элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

Допустим(/^в "(.*?)" строке колонки "(.*?)" таблицы "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  value = (arg4.is_variable?)? recall(arg4) : arg4
  select_by_row_num_validator(arg1, arg2, arg3, value)
end

Допустим(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" равным "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  value1 = (arg4.is_variable?)? recall(arg4) : arg4
  value2 = (arg5.is_variable?)? recall(arg5) : arg5
  complex_select_validator(arg1, arg2, arg3, value1, value2)
end

Допустим(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" похожим на "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  value1 = (arg4.is_variable?)? recall(arg4) : arg4
  value2 = (arg5.is_variable?)? recall(arg5) : arg5
  complex_select_regexp_validator(arg1, arg2, arg3, value1, value2)
end

Допустим(/^открывается страница "(.*?)"$/) do |arg1|
  PageObjectWrapper.current_page? arg1.to_label.to_sym
end

Допустим(/^открывается диалог "(.*?)"$/) do |arg1|
  PageObjectWrapper.current_page? arg1.to_label.to_sym
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
  value = (arg2.is_variable?)? recall(arg2) : arg2
  feed_field(arg1, value)
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
  current_page = PageObjectWrapper.current_page
  current_page.pagination_open arg1.strip.to_i
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
  value = (arg4.is_variable?)? recall(arg4) : arg4
  complex_select(arg1, arg2, arg3, value)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  value = (arg4.is_variable?)? recall(arg4) : arg4
  complex_select_regexp(arg1, arg2, arg3, value)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select_regexp(arg1, arg2, arg2, value)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select(arg1, arg2, arg2, value)
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg1, arg2)
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

Допустим(/^в новой вкладке открывается страница "(.*?)"$/) do |arg1|
  PageObjectWrapper.browser.windows.last.use
  PageObjectWrapper.current_page? arg1.to_label.to_sym
end
