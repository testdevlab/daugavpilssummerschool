
Given(/^I have logged signed in$/) do
  get_element(:id, 'button_register').click
  get_element(:id, 'button_classic').click
  email2 = Faker::Internet.email
  name = "#{email2}"
  Element.set(:xpath, '//*[@text="Email"]', name)
  $driver.hide_keyboard
  Element.set(:xpath, '//*[@text="First name"]', "Janis")
  $driver.hide_keyboard
  Element.set(:xpath, '//*[@text="Last name"]', "Rozentals")
  $driver.hide_keyboard
  Element.click(:xpath, '//*[@text="CONTINUE"]')
  Element.set(:id, 'et_temp', "parilois123")
  $driver.hide_keyboard
  get_element(:id, 'bt_create_your_account').click
end




  And (/^I click on the "Search for anything" field$/) do
    Element.click(:id, 'com.ebay.mobile:id/search_box')
  end

  And (/^I search "hockey stick tape" in the search field$/) do
    Element.set(:id, 'com.ebay.mobile:id/search_src_text', "hockey stick tape")
    $driver.hide_keyboard
  end


  When (/^I choose the first option in the list$/) do

Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]/android.widget.RelativeLayout[@index="0"]/android.widget.TextView')
begin
  Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/popup_container"]')
  p "Popup found and clicked"
rescue
  p "Popup not found"
end
end

  Then (/^this item has the searched keywords in the title$/)do
    Element.click(:xpath,'//*[@resource-id="com.ebay.mobile:id/recycler"]/android.widget.RelativeLayout[1]')
    chktxt = Element.get(:id, 'com.ebay.mobile:id/textview_item_name').text
    p chktxt.downcase!
    if (chktxt.include? "hockey") && (chktxt.include? "tape") && (chktxt.include? "stick")
    p "Includes key words"
  else
    raise "Does not include key words"
    end
  end

  And (/^I choose the model and color or other required categories$/) do
Element.click(:xpath,'//*[@resource-id="com.ebay.mobile:id/recycler"]/android.widget.RelativeLayout[1]')


  end





When(/^I open the left side section$/)do
Element.click(:id,'com.ebay.mobile:id/home')
end

And(/^open "Saved" section$/)do
Element.click(:xpath,'//*[@resource-id="com.ebay.mobile:id/design_menu_item_text"][@text="Saved"]')
end

Then(/^the title in the top says "Saved" correctly$/) do
el = Element.get(:xpath, '//*[@class="android.widget.TextView"][@text="Saved"]')
if el.text == "Saved"
 p "Correct, tile says seved"
else
  raise "Incorrect, title does not say saved"
end
end

  When (/^I open the categories$/) do
    Element.click(:xpath,'//android.widget.TextView[@content-desc="Categories button"]')
  end

  And (/^I choose Antiques category$/)do
    Element.click(:xpath, '//*[@text="Antiques"]')
  end

  And (/^I choose Antiquities subcategory$/) do
    Element.click(:xpath,'//*[@text="Antiquities"]')
  end

  And (/^I choose Byzantine category option$/) do
    Element.click(:xpath,'//*[@text="Byzantine"]')
  end

  Then (/^the correct list of materials are shown$/) do
  sleep(3)
  element_list += Element.get(:xpath, '//*[@resource-id="com.ebay.mobile:id/recyclerview_items"]//*[@class="android.widget.TextView"][@content-desc=""]').text
  action = Appium::TouchAction.new.swipe(start_x: 1000, start_y: 530, end_x: 200, end_y: 530, duration: 3000)
  action.perform
  puts element_list
  sleep(7)

  #  sleep(10)
#  screensizes = Element.get_screen_sizes
#  Element.scroll_down(screensizes)

    #//*[@text="Copper"][@resource-id="com.ebay.mobile:id/textview_item_title"]
  end
