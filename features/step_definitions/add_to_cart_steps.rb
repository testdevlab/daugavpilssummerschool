
When (/^I choose the first item in goods list$/)do
Element.click(:xpath, '//android.widget.RelativeLayout[1]/android.widget.LinearLayout[1]')
end

And (/^I choose the model and color$/) do
# color. there are no other options rirht now
  Element.click(:xpath, '//android.widget.Spinner[@content-desc="Hockey Tape Color,No selection"]')
  Element.click(:xpath, '//android.widget.FrameLayout[2]')
end

And (/^I add the item to the cart$/) do
  Element.click(:id, 'button_bin')
end

Then (/^I am asked to input my credit card credentials$/) do
  Element.click(:id, 'android:id/button1')
  Element.get(:xpath, '//android.view.View[@content-desc="Provide your contact info"]')
end
