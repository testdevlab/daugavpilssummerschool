#testss2

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
  Element.click(:xpath, '//*[@resource-id="com.ebay.mobile:id/suggestionList"]/*[@index="0"]')
  @input_text = input_text
end

And(/^i check and close informative message$/) do
  a = Element.invisible(:id, "text_slot_1")
  unless a
    Element.click(:id, "text_slot_1")
  end
end

When (/^i choose the first option in the list$/) do
  Element.click(:xpath,'//*[@resource-id="com.ebay.mobile:id/recycler"]/android.widget.RelativeLayout[1]')
end

Then (/^this item has the searched keywords in the title$/) do
  gettxt = Element.get(:id, "textview_item_name").text
  gettxt.downcase!

  if (gettxt.include? "hockey") && (gettxt.include? "stick") && (gettxt.include? "tape") #var optimizēt sadalot keywords uz 3 dažādām daļām
    p "Keywords (#{@input_text}) are included"
  else
    raise p "Keywords (#{@input_text}) are not found"
  end
end
