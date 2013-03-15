# -*- encoding : utf-8 -*-
def complex_select(t_name, find_in, find_by, value)
  current_page = PageObjectWrapper.current_page
  current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => value }
end

def complex_select_regexp(t_name, find_in, find_by, value)
  current_page = PageObjectWrapper.current_page
  current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => Regexp.new(value) }
end

def select_by_row_num(t_name, find_in, col_num)
  current_page = PageObjectWrapper.current_page
  current_page.send t_name.to_select, find_in.to_label.to_sym, :row => col_num
end

def select_by_col_name(t_name, find_in)
  current_page = PageObjectWrapper.current_page
  current_page.send t_name.to_select, find_in.to_label.to_sym
end


Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select(arg1, arg2, arg3, arg4)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select_regexp(arg1, arg2, arg2, arg3)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select(arg1, arg2, arg2, arg3)
end

Допустим /^в таблице "(.*?)" была выбрана ячейка колонки "(.*?)" с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select_regexp(arg1, arg2, arg3, arg4)
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg1, arg2)
end

Допустим /^в таблице "(.*?)" был выбран элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

Если /^в таблице "(.*?)" выбрать ячейку колонки "(.*?)" с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select(arg1, arg2, arg3, arg4)
end

Если /^в таблице "(.*?)" выбрать ячейку с "(.*?)" похожим на "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select_regexp(arg1, arg2, arg2, arg3)
end

Если /^в таблице "(.*?)" выбрать ячейку с "(.*?)" равным "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select(arg1, arg2, arg2, arg3)
end

Если /^в таблице "(.*?)" выбрать элемент колонки "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg1, arg2)
end

Если /^в таблице "(.*?)" выбрать элемент колонки "(.*?)" из "(.*?)" строки$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

