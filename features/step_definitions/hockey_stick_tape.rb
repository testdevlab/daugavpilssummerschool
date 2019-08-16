Given(/^I have signed in$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

And(/^I click on the Search for anything fieldd$/) do

Element.click(:id, "search_box")

end

And (/^I search hockey stick tape in the search field$/) do

  #Element.click(:id, 'search_src_text')
  Element.set(:id, 'search_src_text', "hockey stick tape")

end

And (/^Choose the first option in the listt$/) do

  Element.click(:xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout[2]/android.widget.ListView/android.widget.RelativeLayout[1]/android.widget.TextView')

end

And(/^thisss item has the searched keywords in the title$/) do


  if Element.get(:id, 'com.ebay.mobile:id/text_slot_1')
    Element.click(:id, 'com.ebay.mobile:id/text_slot_1')
  end
  if Element.get(:xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]').text == (/^(hockey|stick|tape)$/)
    p "Hockey stick tape found"
  end


end

# all is OK

And(/^I choose the first option in the listtt$/) do

Element.click(:xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]')


end

And(/^I choose the model and color or other required categoriesss$/) do


Element.click(:xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[3]/android.widget.TextView')
end

And(/^I ad the item to the cart$/) do

Element.click(:id, 'button_bin')



end

Then(/^I am asked to input my credit card credentials$/) do


sleep(5)
$driver.alert_accept

if Element.get(:accessibility_id, "Provide your contact info").text == "Provide your contact info"
p "U got it!"
else
  p "bad news..."
end

end
