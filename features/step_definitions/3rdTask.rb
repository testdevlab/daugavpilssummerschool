Given ("I have logged") do
  step "I search for log in button"
  step "I Log in to account"
end

When ("I searching for something")do
  Element.click(:id, "search_box")
  Element.set(:id, "search_src_text", "hockey stick tape")
  Element.click(:xpath, "//android.widget.RelativeLayout[1]/android.widget.TextView")
end

And ("I choose the first option in the list")do
  Element.click(:id, "text_slot_1")
  Element.click(:id, "textview_item_title")
end

And ("I choose the model and colour")do
  Element.click(:xpath, "//*/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[2]")
end

And ("I add the item to the cart")do
  Element.click(:id, "button_add_to_cart")
  Element.click(:xpath, "//android.widget.Button[2]")
end

Then ("I see what I have and go to checkout")do
Element.get(:xpath, "//android.view.View[1]/android.view.View[2]").text.include? "contact info"
p "Done"
end
