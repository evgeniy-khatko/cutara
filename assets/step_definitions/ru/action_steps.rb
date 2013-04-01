# -*- encoding : utf-8 -*-
def run_action(action_name)
  PageObjectWrapper.current_page.send action_name.to_action
end

def run_action_with_args(action_name, params_string)
  args = params_string.to_params.values
  PageObjectWrapper.current_page.send action_name.to_action, *args
end

Допустим /^выполнено "(.*?)"$/ do |arg1|
  run_action arg1
end

Допустим /^"(.*?)" выполнено с параметрами "(.*?)"$/ do |arg1, arg2|
  run_action_with_args(arg1, arg2)
end

Если /^выполнить "(.*?)"$/ do |arg1|
  run_action arg1
end

Если /^"(.*?)" выполнить с параметрами "(.*?)"$/ do |arg1, arg2|
  run_action_with_args(arg1, arg2)
end
