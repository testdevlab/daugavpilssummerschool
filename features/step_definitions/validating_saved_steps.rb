When(/^I open the left side section$/) do
  Element.click(:id, 'com.ebay.mobile:id/home')
end

And(/^open "Saved" section$/) do
  Element.click(:id, 'com.ebay.mobile:id/menuitem_saved')
end

Then(/^the title in the top says "Saved" correctly$/) do
menu_title_name = Element.get(:id, 'title').text
expected_menu_title_name = "Saved"
  if  menu_title_name == expected_menu_title_name

    p "Menu title name is correct"
  else
    raise "Menu title name is not correct, expected: #{expected_menu_title_name}, got: #{menu_title_name}"
  end
end
