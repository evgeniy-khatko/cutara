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
      value = recall(value) if value.is_variable?
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
      value = recall(value) if value.is_variable?
      current_page = PageObjectWrapper.current_page
      current_page.send t_name.to_select, find_in.to_label.to_sym, { find_by.to_label.to_sym => value }
    end

    def complex_select_regexp(t_name, find_in, find_by, value)
      value = recall(value) if value.is_variable?
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
        eval "$#{var.to_label} = #{res.text}"
      when(res.respond_to? :value)
        eval "$#{var.to_label} = #{res.value}"
      else
        eval "$#{var.to_label} = #{res.to_s}"
      end
    end

    def recall(var)
      val = eval "$#{ var.to_label }"
      raise "Cutara::Helper: Cant recall value from variable #{var}. Was it defined?" if val.nil?
      val
    end

    def result_remember_as var_name
      res = PageObjectWrapper.current_result
      remember_as(var_name, res)
    end

    def field_value_is_equal_to field, value
      value = (value.is_variable?)? recall(value) : value
      PageObjectWrapper.current_page.send(field.to_label.to_sym).value.should eq value
    end

    def field_value_contains field, value
      value = (value.is_variable?)? recall(value) : value
      PageObjectWrapper.current_page.send(field.to_label.to_sym).value.should =~ /#{value}/
    end

    def variable_value_equals_to var, value
      value = (value.is_variable?)? recall(value) : value
      recall(var).should eq value
    end

    def variable_value_contains var, value
      value = (value.is_variable?)? recall(value) : value
      recall(var).should =~ /#{value}/
    end

    def run_on_each action
      current_page = PageObjectWrapper.current_page
      current_page.pagination_each{ |p|
        p.send action.to_action
      }
    end

    def run_on_first_N n, action
      current_page = PageObjectWrapper.current_page
      current_page.pagination_each( :limit => n.strip.to_i ){ |p|
        p.send action.to_action
      }
    end

    def open_subpage index
      current_page = PageObjectWrapper.current_page
      current_page.pagination_open index.strip.to_i
    end

    def table_has_string str, table
      # table is a Cucumber::Ast::Table
      raise "search criteria: #{table.raw.inspect} has more than 2 rows" if table.raw.length != 2
      select_row(str, table.hashes.first)
    end
    
    def table_doesnt_contain table, value
      value = (value.is_variable?)? recall(value) : value
      found = false
      page = PageObjectWrapper.current_page
      pow_table = page.send table.to_label.to_sym
      raise "#{page.label_value} does not have table #{table}" unless pow_table.present?
      pow_table.rows.each{ |row| 
        row.cells.each{ |cell| 
          found = true if cell.text =~ /#{ value }/
        }
      }
      found.should eq false
    end

    def press_on_cell cell
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
        if res[cell.to_label.to_sym].link.exist? then 
          res[cell.to_label.to_sym].link.click 
        else 
          res[cell.to_label.to_sym].click 
        end
      end
    end

    def cell_text_equal_to cell, value
      res = PageObjectWrapper.current_result
      value = (value.is_variable?)? recall(value) : value
      case
      when(res.is_a? Watir::TableCell)
        res.text.should eq value
      when(res.is_a? Hash)
        res[cell.to_label.to_sym].text.should eq value
      end
    end

    def cell_text_remember cell, var
      res = PageObjectWrapper.current_result
      case
      when(res.is_a? Watir::TableCell)
        instance_variable_set '@'+var.to_label, res.text
      when(res.is_a? Hash)
        instance_variable_set '@'+var.to_label, res[cell.to_label.to_sym].text
      end
    end

    def current_page_is label
      PageObjectWrapper.current_page? label.to_label.to_sym
    end

    def page_is_opened_in_new_tab label
      PageObjectWrapper.browser.windows.last.use
      PageObjectWrapper.current_page? label.to_label.to_sym
    end
  end
end
