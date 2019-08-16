When (/^i start registration with an email$/) do
  Element.click(:id, "button_register")
  Element.click(:id, "button_classic")
  email = Faker::Internet.email
  Element.set(:xpath, '//*[@text="Email"]', email)
end

And (/^i input personal data$/) do
  name = Faker::Games::Pokemon.name
  Element.set(:xpath, '//*[@text="First name"]', name)
  lname = Faker::Games::Pokemon.name
  Element.set(:xpath, '//*[@text="Last name"]', lname)
end

And (/^i press continue$/) do
  Element.click(:xpath, '//*[@text="CONTINUE"]')
end

And(/^i choose my password$/) do
  Element.set(:id, "et_temp", "finland228")
end

And(/^i finish registration$/) do
  Element.click(:id, "bt_create_your_account")
end

Then (/^i have successfully signed up$/) do
  Element.get(:id, 'search_box')
  Element.validate_if_invisible(:id, 'button_register')
  Element.validate_if_invisible(:id, 'button_sign_in')

  Element.click(:id, 'home')
  Element.click(:id, 'menuitem_home')
  Element.validate_if_invisible(:id, 'textview_sign_out_status')
end
