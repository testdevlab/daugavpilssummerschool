Given(/^"(.+)" with "(.+)" and "(.+)" searched for "(.+)"$/) do |user, email, passwd, src_inpt|
  step "I start signing in with \"#{user}\""
  step "I input \"#{email}\", \"#{password}\""
  step 'I press sign in button'
  step 'I click on the "Search for anything" field'
  step "I input \"#{src_inpt}\" in the search field"
end

# Given(/^I have opened item page with "(.+)"$/) do |input|
#   step 'I did logging_in'
#   step 'I have clicked on search field'
#   step "I have written \"#{input}\""
#   step 'I click for searche'
#   step 'I open first item from item list'
# end

When(/^I choose all needed options$/) do
  # I need to check if there are options I have to choose
  # option_sec = []
  option_sec = Element.get_list(:xpath, '//android.widget.FrameLayout[@resource-id="com.ebay.mobile:id/variations_layout"]//*[@resource-id="com.ebay.mobile:id/options"]//*[@resource-id="com.ebay.mobile:id/spinner_selection_option"]')
  if option_sec != nil
    option_sec.each do |option|
      Element.get(:xpath, '//android.widget.FrameLayout[@resource-id="com.ebay.mobile:id/variations_layout"]//*[@resource-id="com.ebay.mobile:id/options"]//*[@resource-id="com.ebay.mobile:id/spinner_selection_option"]')
      Element.click(:xpath, '//android.widget.FrameLayout[@resource-id="com.ebay.mobile:id/variations_layout"]//*[@resource-id="com.ebay.mobile:id/options"]//*[@resource-id="com.ebay.mobile:id/spinner_selection_option"]')
      Element.click(:xpath, '//android.widget.FrameLayout/android.widget.ListView//android.widget.FrameLayout[2]')

      if Element.get(:xpath, '//android.widget.FrameLayout[@resource-id="com.ebay.mobile:id/variations_layout"]//*[@resource-id="com.ebay.mobile:id/options"]//*[@resource-id="com.ebay.mobile:id/spinner_selection_option"]//*[@text="Select"]')
        Element.click(:xpath, '//android.widget.FrameLayout[@resource-id="com.ebay.mobile:id/variations_layout"]//*[@resource-id="com.ebay.mobile:id/options"]//*[@resource-id="com.ebay.mobile:id/spinner_selection_option"]')
        Element.click(:xpath, '//android.widget.FrameLayout/android.widget.ListView//android.widget.FrameLayout[2]')
      end
    end
  end
end

And(/^I add the item to the cart$/) do
  # p $driver.methods
  # screen_sizes = { start_x: [], start_y: [], end_x: [], end_y: [], duration: [] }
  # screen_sizes = Element.get_screen_sizes
  # Element.scroll_down(screen_sizes)
  # Element.click(:id, 'button_add_to_cart')
  # $driver.alert_accept
end

Then(/^I am asked to input my credit card credentials$/) do

end
