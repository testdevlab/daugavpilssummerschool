When (/^I open all deal section$/) do
  Element.click(:xpath, '//android.widget.Button[@content-desc="See All Deals"]')
end

Then (/^all the expected categories are visible$/) do
expected_names = ["FEATURED", "TECH", "FASHION" ,"HOME & GARDEN"] #All ok
#expected_names = ["FEATURED", "TECH", "FASHION" ,"AAAAA"] # All ok: find bug "AAAA"
error_list = []
tab_name_list = Element.get_list(:xpath, '//*[@resource-id="com.ebay.mobile:id/tabs_toolbar"]//android.widget.TextView')
counter=0
tab_name_list.each do |name|
unless name.text == expected_names[counter]
  error_list << "Wrong tab name, expected: #{expected_names[counter]}, got: #{name.text}"
end
counter+=1
end
raise error_list.to_s.tr(',',"\n") unless error_list.empty?
end