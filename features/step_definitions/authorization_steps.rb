When(/^I start registration with an email$/) do
  Element.click(:id, "com.ebay.mobile:id/button_register")

  Element.click(:id, "com.ebay.mobile:id/button_classic")

end

And(/^I input my personal data$/) do
  email = Faker::Internet.email
  Element.set(:xpath, '//*[@text="Email"]', email)

  name = Faker::Games::Pokemon.name
  Element.set(:xpath, '//*[@text="First name"]', name)

  surname = Faker::Games::Pokemon.name
  Element.set(:xpath, '//*[@text="Last name"]', surname)
end

And(/^I press CONTINUE$/) do
  Element.click(:xpath, '//*[@text="CONTINUE"]')
end

And(/^I input my password$/) do
  Element.set(:id, "com.ebay.mobile:id/et_temp", "qwerty1234")
end

And(/^I finish registration$/) do
  Element.click(:id, "com.ebay.mobile:id/bt_create_your_account")
end

Then(/^I have successfully signed up$/) do
  Element.get(:id, 'search_box')
  Element.validate_if_invisible(:id, 'com.ebay.mobile:id/button_register')
  Element.validate_if_invisible(:id, 'button_sign_in')

  Element.set(:id, 'home').click
  Element.get(:id, 'menuitem_home')
end
