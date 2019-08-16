When(/^I click on the "Search for anything" field$/) do
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


When(/^I open all deal section$/) do
  Element.click(:xpath, '//android.widget.TextView[@content-desc="Deals button"]')
end

Then(/^all the expected categories are visible$/) do |expected_names|
  expected_names = [["FEATURED", "TECH", "FASHION", "HOME", "MORE"]]
  error_list = []
  tab_name_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/tabs_toolbar"]/*/android.widget.TextView')
  counter = 0
  tab_name_list.each do |tab|
    unless tab.text == expected_names[counter]
      error_list << "Wrong tab name, expected: #{expected_names[counter]}, got #{tab.text}"
    end
    counter += 1
  end
  raise error_list.to_s.tr(',',"\n") unless error_list.empty?
end
