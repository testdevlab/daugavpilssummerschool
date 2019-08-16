When (/^I open the left side section$/) do

Element.click(:id, 'home')

end
And (/^open "Saved" section$/) do

Element.click(:xpath, '//android.widget.LinearLayout[@content-desc="Earn a $30 Statement Credit Just open a new eBay Mastercard account and spend $150+ on eBay within 30 days."]/android.widget.TextView[2]')

end
Then (/^the title in the top says "Saved" correctly$/) do

if Element.get(:id, 'title').text == "Saved"

  p "Success!"
end

end
