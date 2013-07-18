# -*- encoding : utf-8 -*-
include Cutara

Given /^open page "(.*?)"$/ do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Given /^run "(.*?)"$/ do |arg1|
  APP.add_action arg1.to_label.to_sym
end

Given /^"(.*?)" run with parameters "(.*?)"$/ do |arg1, arg2|
  args = arg2.to_params.keys
  APP.add_action arg1.to_label.to_sym, args
end

Given(/^validate "(.*?)"$/) do |arg1|
  APP.add_validator arg1.to_label.to_sym
end

Given(/^remember result as "(.*?)"$/) do |arg1|
end

Given /^fill "(.*?)" form with "(.*?)"$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Given /^fill "(.*?)" field with "(.*?)"$/ do |arg1, arg2|
  APP.add_input arg1.to_label.to_sym
end

Given(/^"(.*?)" field value equals to "(.*?)"$/) do |arg1, arg2|
  APP.add_input arg1.to_label.to_sym
end

Given(/^"(.*?)" field value contains "(.*?)"$/) do |arg1, arg2|
  APP.add_input arg1.to_label.to_sym
end

Given(/^"(.*?)" equals "(.*?)"$/) do |arg1, arg2|
end

Given(/^"(.*?)" contains "(.*?)"$/) do |arg1, arg2|
end

Given /^fill current page with "(.*?)"$/ do |arg1|
  APP.add_menu arg1.to_label.to_sym
end

Given /^fill "(.*?)" elements set with "(.*?)"$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Given /^"(.*?)" page open with parameters "(.*?)"$/ do |arg1, arg2|
  APP.add_page arg1.to_label.to_sym
end

Given /^run "(.*?)" on each subpage$/ do |arg1|
  APP.add_pagination
  APP.add_action arg1.to_label.to_sym
end

Given /^run "(.*?)" on the first "(.*?)" subpages$/ do |arg1, arg2|
  APP.add_pagination
  APP.add_action arg1.to_label.to_sym
end

Given /^open "(.*?)" subpage$/ do |arg1|
  APP.add_pagination
end

Given /^click "(.*?)" link$/ do |arg1|
  APP.add_link arg1.to_label.to_sym
end

Given /^press "(.*?)" button$/ do |arg1|
  APP.add_button arg1.to_label.to_sym
end

Given /^press on "(.*?)" element$/ do |arg1|
  APP.add_element arg1.to_label.to_sym
end

Given(/^open new browser window$/) do
end

Given(/^table "(.*?)" contains row:$/) do |arg1, table|
  t = APP.add_table arg1.to_label.to_sym
  raise "search criteria: #{table.raw.inspect} has more that 2 rows" if table.raw.length != 2
  table.hashes.first.keys.each{ |column_name|
    t.add_column column_name.to_label.to_sym unless column_name == '#'
  }
end

Given(/^table "(.*?)" does not contain "(.*?)"$/) do |arg1, arg2|
  t = APP.add_table arg1.to_label.to_sym
end

Given(/^table "(.*?)" contains rows:$/) do |arg1, table|
  t = APP.add_table arg1.to_label.to_sym
  table.hashes.first.keys.each{ |column_name|
    t.add_column column_name.to_label.to_sym
  }
end

Given(/^click on cell "(.*?)"$/) do |arg1|
  APP.add_column arg1.to_label.to_sym
end

Given(/^cell "(.*?)" text equels to "(.*?)"$/) do |arg1, arg2|
  APP.add_column arg1.to_label.to_sym
end

Given(/^cell "(.*?)" text remember as "(.*?)"$/) do |arg1, arg2|
  APP.add_column arg1.to_label.to_sym
end

Given(/^"(.*?)" returns "(.*?)"$/) do |arg1, arg2|
  APP.add_action arg1.to_label.to_sym
end

Given(/^running "(.*?)" with parameters "(.*?)" returns "(.*?)"$/) do |arg1, arg2, arg3|
  args = arg2.to_params.keys
  APP.add_action arg1.to_label.to_sym, args
end

Given /^choose a cell of "(.*?)" with "(.*?)" equal to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg4.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Given /^choose a "(.*?)" cell similar to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg3.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Given /^choose a "(.*?)" cell equal to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg3.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Given /^choose element from column "(.*?)" from table "(.*?)"$/ do |arg1, arg2|
  t = APP.add_table arg2.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Given /^choose element from column "(.*?)" and row "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg3.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Given(/^row "(.*?)" column "(.*?)" of table "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg3.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Given(/^column "(.*?)" of table "(.*?)" where "(.*?)" equals to "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  t = APP.add_table arg2.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg3.to_label.to_sym
end

Given(/^column "(.*?)" of table "(.*?)" where "(.*?)" similar to "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  t = APP.add_table arg2.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg3.to_label.to_sym
end

Given(/^"(.*?)" page has opened$/) do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Given(/^"(.*?)" dialog has appeared$/) do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Given /^"(.*?)" was run$/ do |arg1|
  APP.add_action arg1.to_label.to_sym
end

Given /^"(.*?)" was run with parameters "(.*?)"$/ do |arg1, arg2|
  args = arg2.to_params.keys
  APP.add_action arg1.to_label.to_sym, args
end

Given /^"(.*?)" was entered on the current page$/ do |arg1|
  APP.add_menu arg1.to_label.to_sym
end

Given /^"(.*?)" was entered in "(.*?)" form$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Given /^"(.*?)" was entered in "(.*?)" elements set$/ do |arg1, arg2|
  APP.add_eset arg1.to_label.to_sym, arg2.to_label.to_sym
end

Given /^"(.*?)" was entered to "(.*?)" field$/ do |arg1, arg2|
  APP.add_input arg1.to_label.to_sym
end

Given /^"(.*?)" page was opened$/ do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Given /^"(.*?)" dialog was opened$/ do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Given /^"(.*?)" page was opened with parameters "(.*?)"$/ do |arg1, arg2|
  APP.add_page arg1.to_label.to_sym
end

Given /^"(.*?)" subpage was opened$/ do |arg1|
  APP.add_pagination
end

Given /^"(.*?)" link was clicked$/ do |arg1|
  APP.add_link arg1.to_label.to_sym
end

Given /^"(.*?)" button was pressed$/ do |arg1|
  APP.add_button arg1.to_label.to_sym
end

Given /^"(.*?)" element was pressed$/ do |arg1|
  APP.add_element arg1.to_label.to_sym
end

Given /^cell from column "(.*?)" with "(.*?)" equal to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg4.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Given /^cell from column "(.*?)" with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg4.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Given /^"(.*?)" cell with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg4.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Given /^"(.*?)" cell with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg4.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Given /^"(.*?)" cell with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  t = APP.add_table arg4.to_label.to_sym
  t.add_column arg1.to_label.to_sym
  t.add_column arg2.to_label.to_sym
end

Given /^a cell from column "(.*?)" and row "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3|
  t = APP.add_table arg3.to_label.to_sym
  t.add_column arg1.to_label.to_sym
end

Given(/^"(.*?)" page is being opened in a new tab$/) do |arg1|
  APP.add_page arg1.to_label.to_sym
end

Given(/^wait for "(.*?)" min$/) do |arg1|
end

Given(/^current page is "(.*?)"$/) do |arg1|
  APP.add_page arg1.to_label.to_sym
end
