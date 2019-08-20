
When(/^I start registration with an email$/) do
  Element.click(:id, "button_register")
  Element.click(:id, "button_classic")
end

And(/^I input personal data$/) do

  email = Faker::Internet.email
  # get_element(:xpath, '//*[@text="Email"]').send_keys("#{email}")
    Element.set(:xpath, '//*[@text="Email"]', email)
  $driver.hide_keyboard

  name = Faker::Games::Pokemon.name
  # get_element(:xpath, '//*[@text="First name"]').send_keys("#{name}")
    Element.set(:xpath, '//*[@text="First name"]', name)
  $driver.hide_keyboard

  surname = Faker::Games::Pokemon.name
  # get_element(:xpath, '//*[@text="Last name"]').send_keys("#{surname}")
  Element.set(:xpath, '//*[@text="Last name"]', surname)
  $driver.hide_keyboard
end

And(/^I press continue$/) do
# get_element(:xpath, '//*[@text="CONTINUE"]').click
Element.click(:xpath, '//*[@text="CONTINUE"]')
end

And(/^I input my password$/) do
  # get_element(:id, 'et_temp').send_keys("Parole123")
  Element.set(:id, 'et_temp',"Parole123")

  $driver.hide_keyboard
end

And(/^I finish registration$/) do
  Element.click(:id, 'bt_create_your_account')

  $driver.alert_accept
end


Then(/^I have successfully signed up$/) do
  Element.get(:id, 'search_box')
  Element.validate_if_invisible(:id, 'button_register')
  Element.validate_if_invisible(:id, 'button_sign_in')
  Element.get(:id, 'home').click
  Element.get(:id, 'menuitem_home')
  Element.validate_if_invisible(:id, 'textview_sign_out_status')
end
