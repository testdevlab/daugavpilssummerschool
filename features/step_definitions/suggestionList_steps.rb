Given(/^"(.+)" with "(.+)" and "(.+)" logged in$/) do |user, email, password|
  step "I start signing in with \"#{user}\""
  step "I input \"#{email}\", \"#{password}\""
  step 'I press sign in button'
end

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
