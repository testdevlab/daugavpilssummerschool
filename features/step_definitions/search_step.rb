Given (/^I have signed in$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

And (/^I choose tape in the list$/) do
Element.click(:xpath, '//android.widget.RelativeLayout[3]/android.widget.TextView')
end

And (/^I choose the model and quantity$/) do
Element.click(:id, 'text_slot_1')
Element.click(:xpath, '//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]')
Element.click(:id, 'quantity_option_row')
Element.click(:xpath, '//*[@text="1"]')
end

And (/^I add the item to the cart$/) do
#screen_sizes = Element.get_screen_sizes
#Element.scroll_down(screen_sizes)
Element.click(:xpath, '//*[@text="ADD TO CART"]')
Element.click(:xpath, '//*[@text="OK"]')
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
Element.click(:id, 'text_slot_1') #In my device shown "save" alert, that's why I click on it that close it
error_list = []
title = Element.get_list(:id, 'title')
title.each do |item|
  unless item.text.include? @input_text
    error_list << "Item does not have the keywords, expected: #{@input_text}, got: #{item.text}"
  end
end
raise error_list.to_s.tr(',',"\n") unless error_list.empty?
end

Then (/^I am asked to input my credit card credentials$/) do
#Need for phone number
number= (1..7).to_a.shuffle
num=number.join

Element.set(:xpath, '//*[@text="Enter address"]', "Test 8 street")
Element.set(:xpath, '//*[@text="City"]', "Toronto")
Element.set(:xpath, '//*[@text="Postal Code"]', "LV-5404")
Element.set(:xpath, '//*[@text="Mobile number"]', "2#{num}")
sleep(0.5) # Need sleep, because sometimes it don't have time to click on "Continue" after puting in number field
Element.click(:accessibility_id, 'Continue')
Element.click(:xpath, '//*[@text="ADD TO CART"]')
sleep(1.5) # Need sleep, because it need some time to add to cart, reload page and when press next button
Element.click(:xpath, '//*[@text="BUY IT NOW"]')
Element.click(:xpath, '//*[@text="REVIEW"]')
Element.click(:id, 'xo_uxcomp_hub_payment_method')
Element.click(:xpath, '//*[@text="Add card"]')
Element.set(:xpath, '//*[@text="Card number"]', "1423423425")
Element.set(:xpath, '//*[@text="Expiration date"]', "12/19")
Element.set(:xpath, '//*[@text="Security code"]', "5609")
end
