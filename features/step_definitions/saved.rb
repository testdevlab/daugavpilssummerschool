When (/^I open the left side section$/) do
  Element.click(:id, 'home')
end

And (/^open "Saved" section/) do
  Element.click(:xpath, '//*[@text="Saved"]')
end
#//*[@content-desc="Saved button"]

Then (/^the title in the top says "Saved" correctly/) do
  title_text = Element.get(:xpath, '//*[@text="Saved"]').text
  if title_text == "Saved"
    puts "Ok"
  else
    raise "Failed to find element, type: #{type}, value: #{button_saved}"
  end
end
