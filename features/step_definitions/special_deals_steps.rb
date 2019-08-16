When (/^I open all deals section$/) do
  Element.click(:xpath, '//android.widget.Button[@content-desc="See All Deals"]')
end

Then (/^all the expected categories are visible$/) do
  expected_names = ["FEATURED", "TECH", "FASHION", "HOME", "MORE"]
  error_list = []
  tab_name_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]//android.widget.TextView')
    counter = 0
  tab_name_list.each do |name|
    unless option.text.include? @input_text
      error_list << "Option does not have the keywords, expected: #{@input_text}, got: #{option.text}"
    end
  end
  raise error_list.to_s.tr(',',"\n") unless error_list.empty?
end
