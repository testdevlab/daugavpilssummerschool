When("I search for log in button") do
  #validate_if_invisible(:id, "search_box")
  Element.click(:id, "button_sign_in")
  Element.click(:id, "button_classic")
end

And("I Log in to account")do
  Element.set(:xpath, "//*[@text='Email or username']", "test@acc.lv")
  Element.set(:xpath, "//*[@text='Password']", "!23456Aa")
  Element.click(:xpath, "//*[@text='SIGN IN']")
end

And("I search for something")do
  Element.click(:id, "search_box")
  Element.set(:id, "search_src_text", "Bike wheel")
  Element.click(:xpath, "//android.widget.RelativeLayout[1]/android.widget.TextView")
end

Then ("I look for search result in item name")do
  Element.click(:id, "text_slot_1")
  Element.get(:id, "textview_item_title").text.include? "Bike"
  p "Done"
end
