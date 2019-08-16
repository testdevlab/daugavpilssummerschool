Given(/^i have signed in$/) do
  step 'i start registration with an email'
  step 'i input personal data'
  step 'i press continue'
  step 'i choose my password'
  step 'i finish registration'
end

And (/^i click on the "Search for anything" field$/) do
  Element.click(:id, "search_box")
end

And(/^i search for "(.+)" and choose the first option$/) do |input_text|
  Element.set(:id, "search_src_text", input_text)
  Element.click(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout[2]/android.widget.ListView/android.widget.RelativeLayout[1]/android.widget.TextView")
  @input_text = input_text
end

And(/^i check and close informative message$/) do
  a = Element.invisible(:id, "text_slot_1")
  unless a
    Element.click(:id, "text_slot_1")
  end
end

When (/^i choose the first option in the list$/) do
  Element.click(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/*")
end

Then (/^this item has the searched keywords in the title$/) do
  Element.click(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/*")
end
