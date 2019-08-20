
When(/^I start registration with an email$/) do
  # register button on home screen
  Element.click(:id, 'button_register')

  # simple registration with email button
  Element.click(:id, 'button_classic')
end

And(/^I input personal data$/) do
  email = Faker::Internet.email
  Element.set(:xpath, '//*[@text="Email"]', email)

  # first name field
  first_name = Faker::Name.first_name
  Element.set(:xpath, '//*[@text="First name"]', first_name)

  # last name field
  last_name = Faker::Name.last_name
  Element.set(:xpath, '//*[@text="Last name"]', last_name)
end

And(/^I press continue$/) do
  # continue button (click)
  Element.click(:xpath, '//*[@text="CONTINUE"]')
end

And(/^I choose my password$/) do
  # password field
  Element.set(:id, 'et_temp', "Parole123")
end

And(/^I finish registration$/) do
  # create account button
  Element.click(:id, 'bt_create_your_account')

  # click "Accept" button
  $driver.alert_accept
end

Then(/^I have successfully signed up$/) do
  Element.get(:id, 'search_box')
  Element.validate_if_invisible(:id, 'button_register')
  Element.validate_if_invisible(:id, 'button_sign_in')

  Element.click(:id, 'home')
  Element.get(:id, 'menuitem_home')
  Element.validate_if_invisible(:id, 'textview_sign_out_status')
end
