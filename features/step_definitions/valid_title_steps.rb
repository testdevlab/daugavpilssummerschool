Given(/^"(.+)" with "(.+)" and "(.+)" signed in$/) do |user, email, password|
  step "I start signing in with \"#{user}\""
  step "I input \"#{email}\", \"#{password}\""
  step 'I press sign in button'
end

Given(/^I have clicked on search field$/) do
  step 'I click on the "Search for anything" field'
end

When(/^I have written "(.+)"$/) do |item_search|
  @item_search = item_search
  Element.set(:id, 'search_src_text', @item_search)
  # //*[@resource-id="com.ebay.mobile:id/suggestionList"]/android.widget.RelativeLayout[1]

end

And(/^I click for searche$/) do
  Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]//android.widget.TextView[1]')
end


And(/^I open first item from item list$/) do
  if Element.check_if_visible(:xpath, '//*[@resource-id="com.ebay.mobile:id/text_slot_1"]')
    Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/text_slot_1"]')
  end
  Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/cell_collection_item"][1]')
end

Then(/^This item has the searched keywords in the title$/) do
  title = Element.get(:id, 'com.ebay.mobile:id/textview_item_name').text.to_s

  keywrd_arr = @item_search.split

  num = 1
  sum = 0
  keywrd_arr.each do |key|
    if title.include?(key)
      sum += 1
    end
    num += 1
  end
  if sum == sum
    puts "Passed"
  end
end
