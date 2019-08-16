#test1

Given (/^I have signed in$/) do
  Element.click(:id, "com.ebay.mobile:id/button_sign_in")

  Element.click(:id, "com.ebay.mobile:id/button_classic")

  email = "mister@mister.com"
  Element.set(:xpath, '//*[@text="Email or username"]', email)
  password = "qwerty12345"
  Element.set(:xpath, '//*[@text="Password"]', password)

  Element.click(:xpath, '//*[@text="SIGN IN"]')

end

When(/^I click on the "Search for anything"$/) do
  Element.click(:id, 'search_box')
end

And(/^I input "(.+)" in the search field$/) do |input_text|
  @input_text = input_text
  Element.set(:id, 'search_src_text', @input_text)
end

Then(/^all offers include searched keywords$/) do
  error_list = []
  option_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]//android.widget.TextView')
  option_list.each do |option|
    unless option.text.include? @input_text
      error_list << "Option does not have the keywords, expected: #{@input_text}, got: #{option.text}"
    end
  end
  raise error_list.to_s.tr(',',"\n") unless error_list.empty?
end


#test2

And (/^I click on the "Search for anything" field$/)do
  Element.click(:id, "com.ebay.mobile:id/gdpr_consent")
  Element.click(:id, "com.ebay.mobile:id/search_box")
end

And (/^I search for random element in the search field$/)do
  @search = Faker::Games::Pokemon.name
  Element.set(:id, "com.ebay.mobile:id/search_src_text", @search)
end

When (/^I choose the first option in the list$/)do
  Element.click(:xpath, '//android.widget.ListView/android.widget.RelativeLayout[1]')
  Element.click(:id, "com.ebay.mobile:id/text_slot_1")
  Element.click(:xpath, '//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]')
end

Then (/^this item has the searched keywords in the title$/)do
  title = Element.get(:id, "com.ebay.mobile:id/textview_item_name")
  unless title.text.include? @search
    puts "#{title} doesn't match expected title: #{@search}"
  end
  puts "#{title} match expected title: #{@search}"
end


#test3
When (/^I click buy it now$/) do
  Element.click(:id, "com.ebay.mobile:id/button_bin")
  Element.click(:id, "android:id/button1")
end

Then (/^I check if I have "your contact info" field$/) do
  Element.get(:xpath, '//android.view.View[@content-desc="Provide your contact info"]')
end
