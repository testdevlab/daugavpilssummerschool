#testss1

When(/^I open the left side section$/) do
  Element.click(:id, "home")
end

And(/^I open "(.+)" section$/) do |search_object|
  @search_object = search_object
  Element.click(:id, "menuitem_#{search_object.downcase}")
end

Then(/^the title in the top says searched object correctly$/) do
    Element.get(:xpath, "//android.widget.TextView[@resource-id='com.ebay.mobile:id/title'][@text='#{@search_object}']")
    p "Element found: #{@search_object}"
end
