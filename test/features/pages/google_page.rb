# -*- encoding : utf-8 -*-
PageObjectWrapper.define_page(:google_search_results) do
  locator 'https://www.google.ru/search?q=cucumber+debug+output&aq=f&oq=cucumber+debug+output&aqs=chrome.0.57j62l3.6749&sourceid=chrome&ie=UTF-8#q=yoppy+gff&hl=ru&newwindow=1&ei=-CtHUeWzAaqN4gSP5IG4Cg&start=0&sa=N&bav=on.2,or.r_cp.r_qf.&bvm=bv.43828540,d.bGE&fp=4dc2e6c6464cbd9b&biw=1920&bih=965'

  action :nazhatie_na_poisk do
    button(:id => 'gbqfb').click
  end

  pagination :pagination do
    locator "a(:text => '2')", '2'
  end

  validator :current_number? do |n|
    td( :text => n.to_s ).present?
  end
end
