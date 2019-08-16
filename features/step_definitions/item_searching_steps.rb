Given(/^I have logged in$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

When(/^I click on the "Search for an item" field$/) do
  Element.click(:id, 'search_box')
end

And(/^I search for "hockey stick tape" in the search field$/) do
  input_text = "hockey stick tape"
  Element.set(:id, 'search_src_text', input_text)
end

When(/^I choose the first item in the list$/) do
  Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]//android.widget.RelativeLayout[1]/android.widget.TextView
')
end

Then(/^this item has the searched keywords in the title$/) do
  # error_list = []
  Element.click(:id, "text_slot_1")
  Element.get(:id, 'textview_item_title').text.include? "hockey stick tape"
  puts "Hockey stick tape is in the title!"
end
