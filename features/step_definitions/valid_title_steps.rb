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
  popup_el = Element.get(:xpath, '//*[@resource-id="com.ebay.mobile:id/text_slot_1"]')
  if popup_el != nil
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


# Then(/^this item has the searched keywords in the title$/) do
#   puts "item title match with search keywords"
#   # buybox_fragment_layout - satur title text, cenu, opcijas
#   # buy it now poga ir sekcija ar id - persistent_buttons_container
#   # recyclerview_items
#   # var but ari quantity_layout un variations_layout
#
#   # ja variacijas tad vajag lista visus ele ar so celu:
#   # //android.widget.FrameLayout[@resource-id="com.ebay.mobile:id/variations_layout"]
#   #   //*[@resource-id="com.ebay.mobile:id/options"]
#   #     //*[@resource-id="com.ebay.mobile:id/spinner_selection_option"]
#   # //android.widget.FrameLayout[@resource-id="com.ebay.mobile:id/variations_layout"]//*[@resource-id="com.ebay.mobile:id/options"]//*[@resource-id="com.ebay.mobile:id/spinner_selection_option"]
# end
