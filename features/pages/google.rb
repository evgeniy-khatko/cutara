PageObjectWrapper.define_page :google do
	locator 'google.com'
	button :iskat do
		locator :id => 'gbqfb'
	end

	text_field :poisk do
		locator :id => 'gbqfq'
	end
  action :tekst_pervoi_ssylki do
    text = div(:id => 'ires').when_present.links.first.text
	end

end
