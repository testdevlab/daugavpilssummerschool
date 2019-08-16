Given(/^I have logged in$/) do

name = "fsd025"

Element.click(:id, 'home')

if Element.get(:id, 'textview_sign_in_status').text == name
  p "u are logged in"
  else
    p "u are not logged in"
end
  @driver.back

end

And(/^I click on the "Search for anything" field$/) do

Element.click(:id, 'search_box')

end
And(/^I search "hockey stick tape" in the search field$/) do


Element.send_keys(:id, 'search_src_text', "hockey stick tape")

end
When(/^I choose the first option in the list$/)do

Elemen.click(:xpath, '/hierarchy/*/*/*/*/*/*/*/android.widget.RelativeLayout[1]/android.widget.TextView')

end
Then(/^this item has the searched keywords in the title$/)do

if Element.get(:id, 'com.ebay.mobile:id/text_slot_1')
  Element.click(:id, 'com.ebay.mobile:id/text_slot_1')
end

if Element.get(:xpath, '/hierarchy/*/*/*/*/*/*/*/*/*/*/*/*/a*/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/*').text == "#{(s...k)}"
 p "exist"
else
  p "not exist"
end
end
