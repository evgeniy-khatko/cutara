# -*- encoding : utf-8 -*-
module Cutara
  module Helper
    def load_pages
      PageObjectWrapper.load "#{Dir.pwd}/features/pages"
    end

    def start_browser
      PageObjectWrapper.use_browser Watir::Browser.new
      PageObjectWrapper.browser.driver.manage.window.maximize
    end

    def close_browser
      PageObjectWrapper.browser.quit
    end

    def open_page(page_name)
      PageObjectWrapper.open_page(page_name.to_label.to_sym) 
    end

    def open_page_with_params(page_name, params_string)
      params = params_string.to_params
      raise ExecutionStepError, "Invalid url parameters: #{params_string}" if params.empty?
      PageObjectWrapper.open_page(page_name.to_label.to_sym, params)
    end

    def run_action(action_name)
      PageObjectWrapper.current_page.send action_name.to_action
    end

    def run_action_with_args(action_name, params_string)
      args = params_string.to_params.values
      PageObjectWrapper.current_page.send action_name.to_action, *args
    end

    def feed_page(menu_name=nil)
      PageObjectWrapper.current_page.feed_all(menu_name.to_label.to_sym)
    end

    def feed_set(set_name, menu_name=nil)
      PageObjectWrapper.current_page.send set_name.to_input, menu_name.to_label.to_sym
    end

    def feed_field(field_name, value=nil)
      PageObjectWrapper.current_page.send field_name.to_input, value
    end

    def press el_name
      PageObjectWrapper.current_page.send el_name.to_press_action
    end

    def select_row(t_name, query)
      sanitized_query = {}
      query.each{ |k,v| 
        v = recall(v) if v.is_variable?
        if k == '#'
          sanitized_query[:number] = v.to_i
        else
          sanitized_query[k.to_label.to_sym] = v
        end
      }
      current_page = PageObjectWrapper.current_page
      row = current_page.send t_name.to_select_row, sanitized_query
      raise "table \"#{t_name}\" does not have row with parameters #{sanitized_query.inspect}" if row.nil?
    end

    def select_rows(t_name, queries)
      queries.each{ |query| 
        select_row(t_name, query)
      }
    end

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
      current_page.send t_name.to_select, find_in.to_label.to_sym, :row => col_num.to_i
    end

    def select_by_col_name(t_name, find_in)
      current_page = PageObjectWrapper.current_page
      current_page.send t_name.to_select, find_in.to_label.to_sym
    end

    def run_action_validator(action_name, check_value)
      res = PageObjectWrapper.current_page.send action_name.to_action
      res.should eq check_value
    end

    def run_validator(validator_name)
      res = PageObjectWrapper.current_page.send validator_name.to_validator
      res.should eq true
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

    def remember_as(var, res)
      case
      when(res.is_a? Watir::TableCell)
        instance_variable_set("@#{var.to_label}", res.text)
      when(res.respond_to? :value)
        instance_variable_set("@#{var.to_label}", res.value)
      else
        instance_variable_set("@#{var.to_label}", res.to_s)
      end
    end

    def recall(var)
      instance_variable_get("@#{var.to_label}")
    end
  end
end
