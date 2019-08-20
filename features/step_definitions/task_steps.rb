#-----First-----
When (/^I open the left side section$/) do
  Element.click(:id, 'home')
end

And (/^open "Saved" section$/) do
  Element.click(:xpath, "//*[@text='Saved']")
end

Then (/^the title in the top says "Saved" correctly$/) do
  text = Element.get(:id, "title").text
  if text == "Saved"
    puts "Title says Saved"
  else
    raise "Title Does NOT says Saved"
  end
end


#-----Second-----

Given (/^I have logged_signed in$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

And (/^I click on the "Search for anything" field$/) do
  Element.click(:id, 'search_box')
end

And (/^I search "hockey stick tape" in the search field$/) do
  Element.set(:id, 'search_src_text', "hockey stick tape")
  $driver.press_keycode(66)
end

When (/^I choose the first option in the list$/) do
  Element.click(:id, "text_slot_1")
  Element.click(:xpath, "//*[@resource-id='com.ebay.mobile:id/cell_collection_item' and @index='0']")
end

Then (/^this item has the searched keywords in the title$/) do

  item_title = Element.get(:id, "textview_item_name").text
  keyword = "Hockey Stick Tape"
  unless item_title.include? keyword
    raise "Incorrect title! Expected: #{keyword}, actual: #{item_title}"
  end
end
