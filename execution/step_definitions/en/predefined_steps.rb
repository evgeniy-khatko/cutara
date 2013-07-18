# -*- encoding : utf-8 -*-
Given /^open page "(.*?)"$/ do |arg1|
  open_page(arg1)
end

Given /^run "(.*?)"$/ do |arg1|
  run_action arg1
end

Given /^"(.*?)" run with parameters "(.*?)"$/ do |arg1, arg2|
  run_action_with_args(arg1, arg2)
end

Given(/^validate "(.*?)"$/) do |arg1|
  run_validator(arg1)
end

Given(/^remember result as "(.*?)"$/) do |arg1|
  result_remember_as arg1
end

Given /^fill "(.*?)" form with "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Given /^fill "(.*?)" field with "(.*?)"$/ do |arg1, arg2|
  feed_field(arg1, arg2)
end

Given(/^"(.*?)" field value equals to "(.*?)"$/) do |arg1, arg2|
  field_value_is_equal_to arg1, arg2
end

Given(/^"(.*?)" field value contains "(.*?)"$/) do |arg1, arg2|
  field_value_contains arg1, arg2
end

Given(/^"(.*?)" equals "(.*?)"$/) do |arg1, arg2|
  variable_value_equals_to arg1, arg2
end

Given(/^"(.*?)" contains "(.*?)"$/) do |arg1, arg2|
  variable_value_contains arg1, arg2
end

Given /^fill current page with "(.*?)"$/ do |arg1|
  feed_page(arg1)
end

Given /^fill "(.*?)" elements set with "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Given /^"(.*?)" page open with parameters "(.*?)"$/ do |arg1, arg2|
  open_page_with_params(arg1, arg2)
end

Given /^run "(.*?)" on each subpage$/ do |arg1|
  run_on_each arg1
end

Given /^run "(.*?)" on the first "(.*?)" subpages$/ do |arg1, arg2|
  run_on_first_N arg1, arg2
end

Given /^open "(.*?)" subpage$/ do |arg1|
  open_subpage arg1
end

Given /^click "(.*?)" link$/ do |arg1|
  press arg1
end

Given /^press "(.*?)" button$/ do |arg1|
  press arg1
end

Given /^press on "(.*?)" element$/ do |arg1|
  press arg1
end

Given(/^open new browser window$/) do
  close_browser
  start_browser
end

Given(/^table "(.*?)" contains row:$/) do |arg1, table|
  table_has_string arg1, table
end

Given(/^table "(.*?)" does not contain "(.*?)"$/) do |arg1, arg2|
  table_doesnt_contain arg1, arg2
end

Given(/^table "(.*?)" contains rows:$/) do |arg1, table|
  select_rows(arg1, table.hashes)
end

Given(/^click on cell "(.*?)"$/) do |arg1|
  press_on_cell arg1
end

Given(/^cell "(.*?)" text equels to "(.*?)"$/) do |arg1, arg2|
  cell_text_equal_to arg1, arg2
end

Given(/^cell "(.*?)" text remember as "(.*?)"$/) do |arg1, arg2|
  cell_text_remember arg1, arg2
end

Given(/^"(.*?)" returns "(.*?)"$/) do |arg1, arg2|
  run_action_validator(arg1, arg2)
end

Given(/^running "(.*?)" with parameters "(.*?)" returns "(.*?)"$/) do |arg1, arg2, arg3|
  run_action_with_args_validator(arg1, arg2, arg3)
end

Given /^choose a cell of "(.*?)" with "(.*?)" equal to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select(arg4, arg1, arg2, arg4)
end

Given /^choose a "(.*?)" cell similar to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select_regexp(arg3, arg1, arg1, arg2)
end

Given /^choose a "(.*?)" cell equal to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  complex_select(arg3, arg1, arg1, arg2)
end

Given /^choose element from column "(.*?)" from table "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg2, arg1)
end

Given /^choose element from column "(.*?)" and row "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  select_by_row_num(arg3, arg1, arg2)
end

Given(/^row "(.*?)" column "(.*?)" of table "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  select_by_row_num_validator(arg1, arg2, arg3, arg4)
end

Given(/^column "(.*?)" of table "(.*?)" where "(.*?)" equals to "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  complex_select_validator(arg1, arg2, arg3, arg4, arg5)
end

Given(/^column "(.*?)" of table "(.*?)" where "(.*?)" similar to "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  complex_select_regexp_validator(arg1, arg2, arg3, arg4, arg5)
end

Given(/^"(.*?)" page has opened$/) do |arg1|
  current_page_is arg1
end

Given(/^"(.*?)" dialog has appeared$/) do |arg1|
  current_page_is arg1
end

Given /^"(.*?)" was run$/ do |arg1|
  run_action arg1
end

Given /^"(.*?)" was run with parameters "(.*?)"$/ do |arg1, arg2|
  run_action_with_args(arg1, arg2)
end

Given /^"(.*?)" was entered on the current page$/ do |arg1|
  feed_page(arg1)
end

Given /^"(.*?)" was entered in "(.*?)" form$/ do |arg1, arg2|
  feed_set(arg2, arg1)
end

Given /^"(.*?)" was entered in "(.*?)" elements set$/ do |arg1, arg2|
  feed_set(arg2, arg1)
end

Given /^"(.*?)" was entered to "(.*?)" field$/ do |arg1, arg2|
  feed_field(arg1, arg2)
end

Given /^"(.*?)" page was opened$/ do |arg1|
  open_page(arg1)
end

Given /^"(.*?)" dialog was opened$/ do |arg1|
  open_page(arg1)
end

Given /^"(.*?)" page was opened with parameters "(.*?)"$/ do |arg1, arg2|
  open_page_with_params(arg1, arg2)
end

Given /^"(.*?)" subpage was opened$/ do |arg1|
  open_subpage arg1
end

Given /^"(.*?)" link was clicked$/ do |arg1|
  press arg1  
end

Given /^"(.*?)" button was pressed$/ do |arg1|
  press arg1  
end

Given /^"(.*?)" element was pressed$/ do |arg1|
  press arg1  
end

Given /^cell from column "(.*?)" with "(.*?)" equal to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select(arg4, arg1, arg2, arg3)
end

Given /^cell from column "(.*?)" with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select_regexp(arg4, arg1, arg2, arg3)
end

Given /^"(.*?)" cell with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select_regexp(arg4, arg1, arg2, arg3)
end

Given /^"(.*?)" cell with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  complex_select(arg4, arg1, arg2, arg3)
end

Given /^a cell from column "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg2, arg1)
end

Given /^a cell from column "(.*?)" and row "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

Given(/^"(.*?)" page is being opened in a new tab$/) do |arg1|
  page_is_opened_in_new_tab arg1
end

Given(/^wait for "(.*?)" min$/) do |arg1|
  sleep arg1.to_f*60
end

Given(/^current page is "(.*?)"$/) do |arg1|
  current_page_is arg1
end
