# Some steps taken from 3rdTask.rb... some from autorization_steps.rb, and yes, I am lazy :)
#scenario0
When ('I open the left side section')do
  Element.click(:id, 'home')
end
And ('open "Saved" section')do
  Element.click(:xpath, '//*/android.widget.CheckedTextView[@text="Saved"]')
end
Then ('the title in the top says "Saved" correctly')do
  Element.get(:id, 'title').text.include? "Saved"
  p "Scenario 0 done"
end
# passed

#scenario1
Given ("I have logged in") do
  step "I search for log in button"
  step "I Log in to account"
end

When ('I click on the "Search" field') do
  Element.click(:id, "search_box")
end

And ('I search "hockey stick tape"') do
  Element.set(:id, "search_src_text", "hockey stick tape")
end

And ("I choose the first option in the given list") do
  Element.click(:xpath, "//android.widget.RelativeLayout[1]/android.widget.TextView")
end

Then ("this item has the searched keywords in the title") do
  Element.click(:id, "text_slot_1")
  Element.get(:id, "textview_item_title").text.include? "hockey stick tape"
  p "Scenario 1 done"
end
# passed

#scenario2
Given ("I have logged in and search for hockey stick tape")do
  step "I search for log in button"
  step "I Log in to account"
  step 'I click on the "Search" field'
  step 'I search "hockey stick tape"'
  step 'I choose the first option in the given list'
end

And ('I choose the first option in result list') do
  step 'I choose the first option in the list'
end

And ('I choose the model and color') do
  step 'I choose the model and colour'
end

And ('I add the item to the cart in scenario2') do
  step 'I add the item to the cart'
end

Then ('I am asked to input my credit card credentials') do
  Element.get(:xpath, "//android.view.View[1]/android.view.View[2]").text.include? "contact info"
  p "Scenario 2 done"
end
# passed

#scenario3
Given ('I have signed in')do
  step 'I have logged in'
end

When ('I open the categories')do
  sleep(1) # at least need small cooldown
  step 'I open the left side section'
  Element.click(:xpath, '//*[@text="Accept"]')
  Element.click(:id, 'menuitem_categories')
end

And ('I choose Antiques category')do
  Element.click(:xpath, '//*[@text="Antiques"]')
end

And ('I choose Antiquities subcategory')do
  Element.click(:xpath, "//*[@content-desc='Collapsed Antiquities Button']/android.widget.TextView[@text='Antiquities']")
end

And ('I choose Byzantine category option')do
  Element.click(:xpath, '//*[@text="Byzantine"]')
end

# True art section!
Then ('the correct list of materials are shown')do
  sleep(2) # Slow reload fix
  expElem = ["Bronze", "Gold", "Lead", "Glass", "Copper", "Iron", "Wood", "Paper", "Stone", "Brass", "Pottery", "Terracota"]
  i = 0
  10.times{
    p expElem.include? Element.get(:xpath, "//androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.TextView").text
    $driver.swipe(start_x: 400, start_y: 600, end_x: 0, end_y: 600, duration: 1000)
  }
  p expElem.include? Element.get(:xpath, "//androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[2]/android.widget.TextView").text
  p expElem.include? Element.get(:xpath, "//androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout[3]/android.widget.TextView").text
end
# End of True art section
# passed
