#test1

Given (/^I have signed in$/) do
  Element.click(:id, "com.ebay.mobile:id/button_sign_in")

  Element.click(:id, "com.ebay.mobile:id/button_classic")

  email = "mister@mister.com"
  Element.set(:xpath, '//*[@text="Email or username"]', email)
  password = "qwerty12345"
  Element.set(:xpath, '//*[@text="Password"]', password)

  Element.click(:xpath, '//*[@text="SIGN IN"]')
  Element.get(:id, "com.ebay.mobile:id/gdpr_consent").click
end

When(/^I click on the "Search for anything"$/) do
  Element.click(:id, 'search_box')
end

And(/^I input "(.+)" in the search field$/) do |input_text|
  @input_text = input_text
  Element.set(:id, 'search_src_text', @input_text)
end

Then(/^all offers include searched keywords$/) do
  error_list = []
  option_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]//android.widget.TextView')
  option_list.each do |option|
    unless option.text.include? @input_text
      error_list << "Option does not have the keywords, expected: #{@input_text}, got: #{option.text}"
    end
  end
  raise error_list.to_s.tr(',',"\n") unless error_list.empty?
end

#test2

And (/^I click on the "Search for anything" field$/)do
  Element.click(:id, "com.ebay.mobile:id/search_box")
end

And (/^I search "(.+)" in the search field$/)do |search|
  @search = search
  Element.set(:id, "com.ebay.mobile:id/search_src_text", @search)
end

When (/^I choose the first option in the list$/)do
  Element.click(:xpath, '//android.widget.ListView/android.widget.RelativeLayout[1]')
  Element.click(:id, "com.ebay.mobile:id/text_slot_1")
  Element.click(:xpath, '//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]')
end

Then (/^this item has the searched keywords in the title$/)do
  title = Element.get(:id, "com.ebay.mobile:id/textview_item_name")
  unless title.text.include? @search
    puts "#{title.text} doesn't match expected title: #{@search}"
  end
  puts "#{title.text} match expected title: #{@search}"
end


#test3

And (/^I choose the model and color, or other required categories$/)do
  Element.get(:id, "com.ebay.mobile:id/quantity_selection_spinner") do
    Element.click(:id, "com.ebay.mobile:id/quantity_selection_spinner")
    Element.click(:xpath, '//android.widget.ListView/android.widget.CheckedTextView[.]').sample
  end
end

When (/^I add the item to the cart$/) do
  Element.click(:id, "com.ebay.mobile:id/button_add_to_cart")
  Element.click(:xpath, '//android.widget.LinearLayout/*[@text="OK"]')
end

Then (/^I am asked to input my credit card credentials$/) do
  Element.get(:xpath, '//android.view.View[@content-desc="Provide your contact info"]')
end

#test4
When (/^I open the left side section$/)do
  Element.click(:id, "com.ebay.mobile:id/home")
end

And (/^open "Saved" section$/)do
  Element.click(:id, "com.ebay.mobile:id/menuitem_saved")
end

Then (/^the title in the top says "Saved" correctly$/)do
  title = Element.get(:id, "com.ebay.mobile:id/title")
unless title.text.include? "Saved"
  puts "#{title.text} doesn't match expected title: Saved"
end
puts "#{title.text} match expected title: Saved"
end

#test5
  When (/^I open the categories$/)do
    Element.click(:xpath, '//android.widget.TextView[@content-desc="Categories button"]')
  end

  And (/^I choose Antiques category$/)do
    Element.click(:xpath, '//*[@text="Antiques"]')
  end

  And (/^I choose Antiquities subcategory$/)do
    Element.click(:xpath, '//*[@text="Antiquities"]')
  end

  And (/^I choose Byzantine category option$/)do
    Element.click(:xpath, '//*[@text="Byzantine"]')
  end

  Then (/^the correct list of materials are shown$/)do
  error_list = []
  tab_names = Element.get_list(:xpath, '//android.widget.LinearLayout [@resource-id="com.ebay.mobile:id/scrolling_container_view"]')
  expected_names = ["Bronze", "Gold", "Lead", "Glass", "Copper", "Iron", "Wood", "Paper", "Stone", "Brass", "Pottery", "Terracota"]
  counter = 0
  tab_names.each do |tab|
    unless tab.text == expected_names[counter]
      error_list << "Wrong name, expected: #{expected_names[counter]}. got: #{tab.text}"
      end
    counter += 1
  end
  end
