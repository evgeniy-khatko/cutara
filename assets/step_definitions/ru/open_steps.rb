# -*- encoding : utf-8 -*-
def open_page(page_name)
  PageObjectWrapper.open_page(page_name.to_label.to_sym) 
end

def open_page_with_params(page_name, params_string)
  params = params_string.to_params
  raise ExecutionStepError, "Invalid url parameters: #{params_string}" if params.empty?
  PageObjectWrapper.open_page(page_name.to_label.to_sym, params)
end

Допустим /^открыта страница "(.*?)"$/ do |arg1|
  open_page(arg1)
end

Допустим /^страница "(.*?)" открыта с параметрами "(.*?)"$/ do |arg1, arg2|
  open_page_with_params(arg1, arg2)
end

Если /^открыть страницу "(.*?)"$/ do |arg1|
  open_page(arg1)
end

Если /^страницу "(.*?)" открыть с параметрами "(.*?)"$/ do |arg1, arg2|
  open_page_with_params(arg1, arg2)
end
