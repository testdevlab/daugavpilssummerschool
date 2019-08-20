Given(/^"(.+)" with "(.+)" and "(.+)" searched for "(.+)"$/) do |user, email, passwd, src_inpt|
  step "I start signing in with \"#{user}\""
  step "I input \"#{email}\", \"#{password}\""
  step 'I press sign in button'
  step 'I click on the "Search for anything" field'
  step "I input \"#{src_inpt}\" in the search field"
  step 'I click for searche'
end

# Given(/^I have opened item page with "(.+)"$/) do |input|
#   step 'I did logging_in'
#   step 'I have clicked on search field'
#   step "I have written \"#{input}\""
#   step 'I click for searche'
#   step 'I open first item from item list'
# end

Given(/^User seached for "(.+)"$/) do  |src_item|
  step 'I click on the "Search for anything" field'
  step "I input \"#{src_item}\" in the search field"
end

Given(/^Item page was opened$/) do
  step 'I click for searche'
  step 'I open first item from item list'
end

When(/^I choose all needed options$/) do
  # I need to check if there are options I have to choose
  # option_sec = []
  begin
    option_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/selection_option_row"]')
    option_list.each do |option|
      Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/selection_option_row"]')
      Element.click(:xpath, '//android.widget.FrameLayout/android.widget.ListView//android.widget.FrameLayout[2]')
    end
  rescue
  end
end

And(/^I add the item to the cart$/) do
  # p $driver.methods
  screen_sizes = { start_x: [], start_y: [], end_x: [], end_y: [], duration: [] }
  screen_sizes = Element.get_screen_sizes
  Element.scroll_down(screen_sizes)
  Element.click(:id, 'button_add_to_cart')
  $driver.alert_accept
end

Then(/^I am asked to input my credit card credentials$/) do

end
