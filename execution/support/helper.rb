# -*- encoding : utf-8 -*-
module Cutara
  module Helper
    def load_pages
      PageObjectWrapper.load "#{Dir.pwd}/features/pages"
    end

    def start_browser
      PageObjectWrapper.domain = 'http://172.21.225.230:17080/kb-web-ui/'
      PageObjectWrapper.use_browser Watir::Browser.new :chrome
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
      args = args.collect{ |arg| ( arg.is_variable? )? recall(arg) : arg }
      PageObjectWrapper.current_page.send action_name.to_action, *args
    end

    def feed_page(menu_name=nil)
      PageObjectWrapper.current_page.feed_all(menu_name.to_label.to_sym)
    end

    def feed_set(set_name, menu_name=nil)
      PageObjectWrapper.current_page.send set_name.to_input, menu_name.to_label.to_sym
    end

    def feed_field(field_name, value=nil)
      recall(value) if value.is_variable?
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
      recall(value) if value.is_variable?
      current_page = PageObjectWrapper.current_page
      current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => value }
    end

    def complex_select_regexp(t_name, find_in, find_by, value)
      recall(value) if value.is_variable?
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
      check_value = recall(check_value) if check_value.is_variable?
      res = PageObjectWrapper.current_page.send action_name.to_action
      res.should eq check_value
    end

    def run_validator(validator_name)
      res = PageObjectWrapper.current_page.send validator_name.to_validator
      res.should eq true
    end

    def run_action_with_args_validator(action_name, params_string, check_value)
      check_value = recall(check_value) if check_value.is_variable?
      args = params_string.to_params.values
      args = args.collect{ |arg| ( arg.is_variable? )? recall(arg) : arg }
      res = PageObjectWrapper.current_page.send action_name.to_action, *args
      res.should eq check_value
    end

    def complex_select_validator(find_in, t_name, find_by, value, check_value)
      check_value = recall(check_value) if check_value.is_variable?
      value = recall(value) if value.is_variable?
      current_page = PageObjectWrapper.current_page
      res = current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => value }
      res.text.should =~ /#{check_value}/
    end

    def complex_select_regexp_validator(find_in, t_name, find_by, value, check_value)
      check_value = recall(check_value) if check_value.is_variable?
      value = recall(value) if value.is_variable?
      current_page = PageObjectWrapper.current_page
      res = current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => Regexp.new(value) }
      res.text.should =~ /#{check_value}/
    end

    def select_by_row_num_validator(col_num, find_in, t_name, check_value)
      check_value = recall(check_value) if check_value.is_variable?
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

    def pick_a_date date_array
      fool_protection = 50
      fool_index = 0
      month={"0"=>"01", "1"=>"02", "2"=>"03", "3"=>"04", "4"=>"05", "5"=>"06", "6"=>"07", "7"=>"08", "8"=>"09", "9"=>"10", "10"=>"11", "11"=>"12"}
      nex = (PageObjectWrapper.browser.a(:title, 'Next').present?)? PageObjectWrapper.browser.a(:title, 'Next') : PageObjectWrapper.browser.a(:title, 'Вперед')
      pre = (PageObjectWrapper.browser.a(:title, 'Prev').present?)? PageObjectWrapper.browser.a(:title, 'Prev') : PageObjectWrapper.browser.a(:title, 'Назад')
      datepicker = PageObjectWrapper.browser.div(:class=>'ui-datepicker-title')
      while  datepicker.select(:class=>'ui-datepicker-year').value!= date_array[0] and fool_index < fool_protection
        fool_index += 1
        if datepicker.select(:class, 'ui-datepicker-year').value < date_array[0]
          nex.click
        elsif datepicker.select(:class, 'ui-datepicker-year').value > date_array[0]
          pre.click
        end
      end
      fool_index = 0
      while fool_index < fool_protection
        fool_index += 1
        current_month=month[datepicker.select(:class, 'ui-datepicker-month').value]
        break if current_month == date_array[1]
        if current_month < date_array[1]
          nex.click
        elsif current_month > date_array[1]
          pre.click
        end
      end
      PageObjectWrapper.browser.table(:class, 'ui-datepicker-calendar').a(:text, date_array[2].to_i.to_s).click
      PageObjectWrapper.browser.table(:class, 'ui-datepicker-calendar').wait_while_present
    end

  end
end
