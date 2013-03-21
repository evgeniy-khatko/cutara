# -*- encoding : utf-8 -*-
Допустим /^открыта "(.*?)" страница пагинации$/ do |arg1|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_open arg1.strip.to_i
end

Допустим /^на каждой странице пагинации выполнить действие "(.*?)"$/ do |arg1|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_each{ |p|
    p.send arg1.to_action
  }
end

Допустим /^на первых "(.*?)" страницах пагинации выполнить действие "(.*?)"$/ do |arg1, arg2|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_each( :limit => arg1.strip.to_i ){ |p|
    p.send arg2.to_action
  }

end

Допустим /^перейти на "(.*?)" страницу пагинации$/ do |arg1|
  current_page = PageObjectWrapper.current_page
  current_page.pagination_open arg1.strip.to_i
end
