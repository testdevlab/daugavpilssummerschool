When(/^I open all deal section$/) do
  Element.click(:xpath, '//android.widget.Button[@content-desc="See All Deals"]')

end

Then(/^all the expected categories are visible$/) do
  expected_names = ["FEATURED", "TECH", "FASHION", "HOME", "MORE"]
  error_list = []
  tab_name_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/tabs_toolbar"]//android.widget.TextView')
counter = 0
  tab_name_list.each do |tab|
    unless tab.text == expected_names[counter]
      error_list << "Wrong tab name, expected: "
    end
    counter += 1
  end
  raise
end


# open all deals
# //android.widget.Button[@content-desc="See All Deals"], xpath, click

# list of tab names
# //*[@resource-id="com.ebay.mobile:id/tabs_toolbar"]//android.widget.TextView, xpath, validate text

# actual tab names
# FEATURED, TECH, FASHION, HOME, MORE
