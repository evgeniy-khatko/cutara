# -*- encoding : utf-8 -*-
def run_action_validator(action_name, check_value)
  res = PageObjectWrapper.current_page.send action_name.to_action
  res.should eq check_value
end

def run_action_with_args_validator(action_name, params_string, check_value)
  args = params_string.to_params.values
  res = PageObjectWrapper.current_page.send action_name.to_action, *args
  res.should eq check_value
end

def complex_select_validator(find_in, t_name, find_by, value, check_value)
  current_page = PageObjectWrapper.current_page
  res = current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => value }
  res.text.should =~ /#{check_value}/
end

def complex_select_regexp_validator(find_in, t_name, find_by, value, check_value)
  current_page = PageObjectWrapper.current_page
  res = current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => Regexp.new(value) }
  res.text.should =~ /#{check_value}/
end

def select_by_row_num_validator(col_num, find_in, t_name, check_value)
  current_page = PageObjectWrapper.current_page
  res = current_page.send t_name.to_select, find_in.to_label.to_sym, :row => col_num.to_i
  res.text.should =~ /#{check_value}/
end

Тогда(/^открывается страница "(.*?)"$/) do |arg1|
  PageObjectWrapper.current_page? arg1.to_label.to_sym
end

Тогда(/^открывается диалог "(.*?)"$/) do |arg1|
  PageObjectWrapper.current_page? arg1.to_label.to_sym
end

Тогда(/^"(.*?)" вернет "(.*?)"$/) do |arg1, arg2|
  run_action_validator(arg1, arg2)
end

Тогда(/^выполнение "(.*?)" с параметрами "(.*?)" вернет "(.*?)"$/) do |arg1, arg2, arg3|
  run_action_with_args_validator(arg1, arg2, arg3)
end

Тогда(/^в "(.*?)" строке колонки "(.*?)" таблицы "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  select_by_row_num_validator(arg1, arg2, arg3, arg4)
end

Тогда(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" равным "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  complex_select_validator(arg1, arg2, arg3, arg4, arg5)
end

Тогда(/^в колонке "(.*?)" таблицы "(.*?)" с "(.*?)" похожим на "(.*?)" содержится "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  complex_select_regexp_validator(arg1, arg2, arg3, arg4, arg5)
end

