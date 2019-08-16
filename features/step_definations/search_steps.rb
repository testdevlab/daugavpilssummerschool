@test2
Given(/^I have sign in$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

And(/^Filled in the searchfield$/) do
  Element.click(:id, 'com.ebay.mobile:id/search_box')
  Element.set(:id, 'com.ebay.mobile:id/search_src_text', "hockey stick tape")
  $driver.hide_keyboard
end

And(/^choose the first option$/) do
Element.click(:xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout[2]/android.widget.ListView/android.widget.RelativeLayout[1]/android.widget.TextView')
#sleep(1)
begin
Element.click(:id, 'com.ebay.mobile:id/text_slot_1')
rescue
  puts "Element 'com.ebay.mobile:id/text_slot_1' not found"
end
end
