# Given (/^I did logging_in$/) do
#   step 'I start signing in with "(.+)"'
#   step 'I input "(.+)", "(.+)"'
# end


# Given(/^I logged in as "(.+)"$/) do |user, email, password|
#   step "I input \"#{email}\", \"#{password}\""
#   step 'I press sign in button'
# end

When(/^I click on the "Search for anything" field$/) do
# Close side-menu clicking on home
# Element.click(:id, "menuitem_home")
Element.click(:id, "search_box")
end

And(/^I input "(.+)" in the search field$/) do |set_search_str|
  @set_search_str = set_search_str
  Element.set(:id, 'search_src_text', @set_search_str)

end


Then(/^all offers include searched keywords$/) do
  error_list = []
  option_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]//android.widget.TextView')
  option_list.each do |option|
    unless option.text.include? @set_search_str
      error_list << "Option does not have the keywords, expected: #{@set_search_str}, got: #{option.text}"
    end
  end
  raise error_list.to_s.tr(",","\n") unless error_list.empty?
end

# -----------------------

# Given(/^I have clicked on search field$/) do
#   step 'I click on the "Search for anything" field'
# end
#
# When(/^I have written (.+)$/) do |item_search|
#   puts "click search"
#   # //*[@resource-id="com.ebay.mobile:id/suggestionList"]/android.widget.RelativeLayout[1]
#
# end
#
# And(/^I open first item from list$/) do
#   puts "open item page"
#   # //*[@resource-id="com.ebay.mobile:id/cell_collection_item"][1]
#
# end
#
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
