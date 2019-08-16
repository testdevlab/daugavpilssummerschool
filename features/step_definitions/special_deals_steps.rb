#deal

When (/^I open all deal section$/) do
  Element.click(:xpath, '//android.widget.Button[@content-desc="See All Deals"]')
end

Then (/^all the expected categories are visible$/)do
  error_list = []
  tab_names = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/tabs_toolbar"]//android.widget.TextView')
  expected_names = ["FEATURED", "TECH", "FASHION", "HOME", "MORE"]
  counter = 0
  tab_names.each do |tab|
    unless tab.text == expected_names[counter]
      error_list << "Wrong name, expected: #{expected_names[counter]}. got: #{tab.text}"
      end
    counter += 1
  end
  raise eror_list.to_s.tr(',',"\n") unless error_list.empty?
end
