When(/^I start registration with an email$/) do
  # get_element(:id, "button_register").click
  Element.click(:id, "button_register")
  # raise "Error: 0001"
  # get_element(:id, "button_classic").click
  Element.click(:id, "button_classic")
end

And(/^I input personal data$/) do
  email = Faker::Internet.email
  # get_element(:xpath, '//*[@text="Email"]').send_keys(email)
  Element.set(:xpath, '//*[@text="Email"]', email)
  # $driver.hide_keyboard
  puts "Email : #{email}"

  name = Faker::Science.element
  surname = Faker::Verb.base
  # get_element(:xpath, '//*[@text="First name"]').send_keys(name)
  Element.set(:xpath, '//*[@text="First name"]',name)
  # $driver.hide_keyboard
  puts "Name : #{name}"

  # get_element(:xpath, '//*[@text="Last name"]').send_keys(surname)
  Element.set(:xpath, '//*[@text="Last name"]',surname)
  # $driver.hide_keyboard
  puts "Surname : #{surname}"
end

And(/^I press continue$/) do
  # get_element(:xpath, '//*[@text="CONTINUE"]').click
  Element.click(:xpath, '//*[@text="CONTINUE"]')
end

And(/^I input my password$/) do
  o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
  str = (0...10).map { o[rand(o.length)] }.join
  passwd = str + "261"
  # get_element(:id, "et_temp").send_keys(passwd)
  Element.set(:id, "et_temp",passwd)
  # $driver.hide_keyboard
  puts "Password : #{passwd}"
end

And(/^I finish registration$/) do
  # get_element(:id, 'bt_create_your_account').click
  Element.click(:id, 'bt_create_your_account')
  $driver.alert_accept
end

Then(/^I have successfully signed up$/) do
  # get_element(:id, 'search_box')
  Element.get(:id, 'search_box')
  # validate_if_invisible(:id, 'button_register')
  Element.validate_if_invisible(:id, 'button_register')
  # validate_if_invisible(:id, 'button_sign_in')
  Element.validate_if_invisible(:id, 'button_sign_in')

  # get_element(:id, 'home').click
  Element.click(:id, 'home')
  # get_element(:id, 'menuitem_home')
  Element.get(:id, 'menuitem_home')
  # validate_if_invisible(:id, 'textview_sign_out_status')
  Element.validate_if_invisible(:id, 'textview_sign_out_status')
end
