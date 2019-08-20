When (/^I open the left side section$/)do
  Element.click(:id, 'com.ebay.mobile:id/home')
end

And (/^open "Saved" section$/)do
  Element.click(:xpath, '//*[@text="Saved"]')
end

Then (/^the title in the top says "Saved" correctly$/)do
Element.get(:xpath, '//*[@text="Saved"]')
  end
