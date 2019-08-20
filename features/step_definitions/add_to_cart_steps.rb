Given(/^"(.+)" with "(.+)" and "(.+)" searched for "(.+)"$/) do |user, email, passwd, src_inpt|
  step "I start signing in with \"#{user}\""
  step "I input \"#{email}\", \"#{password}\""
  step 'I press sign in button'
  step 'I click on the "Search for anything" field'
  step "I input \"#{src_inpt}\" in the search field"
  step 'I click for searche'
end

Given(/^User seached for "(.+)"$/) do  |src_item|
  step 'I click on the "Search for anything" field'
  step "I input \"#{src_item}\" in the search field"
end

Given(/^Item page was opened$/) do
  step 'I click for searche'
  step 'I open first item from item list'
end

When(/^I choose all needed options$/) do
  if Element.check_if_visible(:id, 'selection_option_row')
    option_list = Element.get_list(:id, 'selection_option_row')
    option_list.each do |option|
      option.click
      # Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/selection_option_row"]')
      Element.click(:xpath, '(//*[@resource-id="com.ebay.mobile:id/text"])[1]')
    end
  else
    puts "Seems that there is no options to choose!"
  end
end

And(/^I add the item to the cart$/) do
  # p $driver.methods
  screen_sizes = { start_x: [], start_y: [], end_x: [], end_y: [], duration: [] }
  screen_sizes = Element.get_screen_sizes
  Element.scroll_down(screen_sizes)
  Element.click(:id, 'button_add_to_cart')
  # $driver.alert_accept
  Element.click(:xpath, '//*[@resource-id="android:id/button1"]')
  # //*[@resource-id="com.ebay.mobile:id/action_bar_root"]//*[@resource-id="android:id/button1"]
end

Then(/^I am asked to input my credit card credentials$/) do
  if Element.check_if_visible(:xpath, '//*[@content-desc="Provide your contact info"]', timer: 15)
    puts "Good! Item has been added to cart!"
  else
    raise "Oh crap, failed!"
  end
end
