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
  res = PageObjectWrapper.current_result
  remember_as(arg1, res)
end

Given /^fill "(.*?)" form with "(.*?)"$/ do |arg1, arg2|
  feed_set(arg1, arg2)
end

Given /^fill "(.*?)" field with "(.*?)"$/ do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  feed_field(arg1, value)
end

Given(/^"(.*?)" field value equals to "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  PageObjectWrapper.current_page.send(arg1.to_label.to_sym).value.should eq value
end

Given(/^"(.*?)" field value contains "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  PageObjectWrapper.current_page.send(arg1.to_label.to_sym).value.should =~ /#{value}/
end

Given(/^"(.*?)" equals "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  recall(arg1).should eq value
end

Given(/^"(.*?)" contains "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  recall(arg1).should =~ /#{value}/
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
  current_page = PageObjectWrapper.current_page
  current_page.pagination_each{ |p|
    p.send arg1.to_action
  arg1.to_label.to_sym}
end

Given /^run "(.*?)" on the first "(.*?)" subpages$/ do |arg1, arg2|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_each( :limit => arg2.strip.to_i ){ |p|
    p.send arg1.to_action
  }
end

Given /^open "(.*?)" subpage$/ do |arg1|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_open arg1.strip.to_i
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
  # table is a Cucumber::Ast::Table
  raise "search criteria: #{table.raw.inspect} has more than 2 rows" if table.raw.length != 2
  select_row(arg1, table.hashes.first)
end

Given(/^table "(.*?)" does not contain "(.*?)"$/) do |arg1, arg2|
  found = false
  page = PageObjectWrapper.current_page
  table = page.send arg1.to_label.to_sym
  raise "#{page.label_value} does not have table #{arg1}" unless table.present?
  table.rows.each{ |row| 
    row.cells.each{ |cell| 
      found = true if cell.text =~ /#{arg2}/
    }
  }
  found.should eq false
end

Given(/^table "(.*?)" contains rows:$/) do |arg1, table|
  select_rows(arg1, table.hashes)
end

Given(/^click on cell "(.*?)"$/) do |arg1|
  res = PageObjectWrapper.current_result
  case
  when(res.is_a? Watir::TableCell)
    if res.link.exists? 
      res.link.click 
    elsif res.checkbox.exists?
      res.checkbox.set
    elsif res.radio.exists?
      res.radio.set
    elsif res.button.exist?
      res.button.click
    else
      res.click
    end
  when(res.is_a? Hash)
    if res[arg1.to_label.to_sym].link.exist? then res[arg1.to_label.to_sym].link.click else res[arg1.to_label.to_sym].click end
  end
end

Given(/^cell "(.*?)" text equels to "(.*?)"$/) do |arg1, arg2|
  res = PageObjectWrapper.current_result
  value = (arg2.is_variable?)? recall(arg2) : arg2
  case
  when(res.is_a? Watir::TableCell)
    res.text.should eq value
  when(res.is_a? Hash)
    res[arg1.to_label.to_sym].text.should eq value
  end
end

Given(/^cell "(.*?)" text remember as "(.*?)"$/) do |arg1, arg2|
  res = PageObjectWrapper.current_result
  case
  when(res.is_a? Watir::TableCell)
    instance_variable_set '@'+arg2.to_label, res.text
  when(res.is_a? Hash)
    instance_variable_set '@'+arg2.to_label, res[arg1.to_label.to_sym].text
  end
end

Given(/^"(.*?)" returns "(.*?)"$/) do |arg1, arg2|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  run_action_validator(arg1, value)
end

Given(/^running "(.*?)" with parameters "(.*?)" returns "(.*?)"$/) do |arg1, arg2, arg3|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  run_action_with_args_validator(arg1, arg2, value)
end

Given /^choose a cell of "(.*?)" with "(.*?)" equal to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  value = (arg3.is_variable?)? recall(arg4) : arg4
  complex_select(arg4, arg1, arg2, value)
end

Given /^choose a "(.*?)" cell similar to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  complex_select_regexp(arg3, arg1, arg1, value)
end

Given /^choose a "(.*?)" cell equal to "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  value = (arg2.is_variable?)? recall(arg2) : arg2
  complex_select(arg3, arg1, arg1, value)
end

Given /^choose element from column "(.*?)" from table "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg2, arg1)
end

Given /^choose element from column "(.*?)" and row "(.*?)" from table "(.*?)"$/ do |arg1, arg2, arg3|
  select_by_row_num(arg3, arg1, arg2)
end

Given(/^row "(.*?)" column "(.*?)" of table "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  value = (arg4.is_variable?)? recall(arg4) : arg4
  select_by_row_num_validator(arg1, arg2, arg3, value)
end

Given(/^column "(.*?)" of table "(.*?)" where "(.*?)" equals to "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  value1 = (arg4.is_variable?)? recall(arg4) : arg4
  value2 = (arg5.is_variable?)? recall(arg5) : arg5
  complex_select_validator(arg1, arg2, arg3, value1, value2)
end

Given(/^column "(.*?)" of table "(.*?)" where "(.*?)" similar to "(.*?)" contains "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  value1 = (arg4.is_variable?)? recall(arg4) : arg4
  value2 = (arg5.is_variable?)? recall(arg5) : arg5
  complex_select_regexp_validator(arg1, arg2, arg3, value1, value2)
end

Given(/^"(.*?)" page has opened$/) do |arg1|
  PageObjectWrapper.current_page? arg1.to_label.to_sym
end

Given(/^"(.*?)" dialog has appeared$/) do |arg1|
  PageObjectWrapper.current_page? arg1.to_label.to_sym
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
  value = (arg2.is_variable?)? recall(arg2) : arg2
  feed_field(arg1, value)
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
  current_page = PageObjectWrapper.current_page
  current_page.pagination_open arg1.strip.to_i
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
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select(arg4, arg1, arg2, value)
end

Given /^cell from column "(.*?)" with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select_regexp(arg4, arg1, arg2, value)
end

Given /^"(.*?)" cell with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select_regexp(arg4, arg1, arg2, value)
end

Given /^"(.*?)" cell with "(.*?)" similar to "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  value = (arg3.is_variable?)? recall(arg3) : arg3
  complex_select(arg4, arg1, arg2, value)
end

Given /^a cell from column "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2|
  select_by_col_name(arg2, arg1)
end

Given /^a cell from column "(.*?)" and row "(.*?)" was chosen from table "(.*?)"$/ do |arg1, arg2, arg3|
  select_by_row_num(arg1, arg2, arg3)
end

Given(/^"(.*?)" page is being opened in a new tab$/) do |arg1|
  PageObjectWrapper.browser.windows.last.use
  PageObjectWrapper.current_page? arg1.to_label.to_sym
end

Given(/^wait for "(.*?)" min$/) do |arg1|
  sleep arg1.to_f*60
end

Given(/^confirm action$/) do
  PageObjectWrapper.browser.alert.ok
end

Given(/^dismiss action$/) do
  PageObjectWrapper.browser.alert.close
end

Given(/^current page is "(.*?)"$/) do |arg1|
  (PageObjectWrapper.current_page? arg1.to_label.to_sym).should eq true
end
