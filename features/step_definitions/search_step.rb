Given (/^I have signed in$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

And (/^I search "hockey stick tape" in the search field$/) do
Element.set(:id, 'search_src_text', 'hockey stick tape')
end

And (/^I choose the first option in the list$/) do
Element.click(:xpath, '//android.widget.RelativeLayout[1]/android.widget.TextView')
end

And (/^I choose the model and color$/) do
Element.click(:id, 'text_slot_1')
Element.click(:xpath, '//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[3]')
Element.click(:xpath, '//*[@text="Select"]')
Element.click(:xpath, '//*[@text="Yellow"]')
end

And (/^I add the item to the cart$/) do
Element.click(:xpath, '//*[@text="ADD TO CART"]')
end

When(/^I click on the "Search for anything" field$/) do
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

Then (/^This item has the searched keywords in the title$/) do
Element.click(:id, 'text_slot_1')
  title = Element.get(:id, 'title').text
  p "#{title} is founded"
end

Then (/^I am asked to input my credit card credentials$/) do

end
