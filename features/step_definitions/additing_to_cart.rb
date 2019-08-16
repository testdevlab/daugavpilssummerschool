Given(/^I have signed in account$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

And(/^I click on the "Search for some item" field$/) do
  Element.click(:id, 'search_box')
end

And(/^I search for some "hockey stick tape" in the search field$/) do
  # input_text = "hockey stick tape"
  Element.set(:id, 'search_src_text', "hockey stick tape")
end

And(/^I choose the first option in the suggested list$/) do
  # Element.click(:xpath, '//android.widget.RelativeLayout[1]/android.widget.LinearLayout[1]/android.widget.TextView')
  Element.click(:xpath, '//android.widget.ListView/android.widget.RelativeLayout[1]')
  Element.click(:id, "text_slot_1")
  Element.click(:xpath, '//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]')
end

And(/^I choose quantity of item$/) do
  Element.click(:xpath, '//android.widget.RelativeLayout[2]/android.widget.TextView')
end

And(/^I add the item to the cart$/) do
  # Element.click(:id, 'button_add_to_cart')
  Element.click(:id, 'button_bin')
  Element.click(:xpath, '//android.widget.LinearLayout/android.widget.Button[2]')

end

Then(/^I am asked to input my credit card credentials$/) do
  Element.get(:xpath, '//*[@content-desc="Provide your contact info"]').text.include? "Provide your contact info"
  p "Right window is opened!"
end
