 When(/^I click on the "Search for anything" field$/) do
   Element.click(:id, 'search_box')
 end

 And(/^I search "(.+)" in the search field$/) do|input_text|
   @input_text = input_text
   Element.set(:id, 'search_src_text', @input_text)
     Element.click(:xpath,'//android.widget.RelativeLayout[1]/android.widget.TextView')
 end

And(/^I choose the first option in the list$/) do
  begin
    Element.click(:id,'text_slot_1')
  rescue
    p "Popup did not appear"
  end
  Element.click(:xpath,'//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]')

end

And('I choose the model and color')do
  Element.click(:xpath,'//android.widget.RelativeLayout[3]/android.widget.TextView')

end

And(/^I add the item to the cart$/) do
  Element.click(:id, "com.ebay.mobile:id/button_bin")
  Element.click(:id, "android:id/button1")
end

Then ("I am asked to input my credit card credentials")do
Element.get(:xpath, '//android.view.View[@content-desc="Provide your contact info"]').text.include? "contact info"
p "Done"
end
