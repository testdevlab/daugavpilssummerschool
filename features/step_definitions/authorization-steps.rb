
When(/^I start registration with an email$/) do

  # register button on home screen
  Element.click(:id, 'button_register')

  # simple registration with email button
  Element.click(:id, 'button_classic')

end

And(/^I input personal data$/) do

  # email field
  email = Faker::Name.first_name.downcase + "_" + Faker::Name.last_name.downcase
  Element.set(:xpath, '//*[@text="Email"]', "#{email}@gmail.com")
  $driver.hide_keyboard

  # first name field
  name = Faker::Name.first_name
  Element.set(:xpath, '//*[@text="First name"]', name)
  $driver.hide_keyboard

  # last name field
  surname = Faker::Name.last_name
  Element.set(:xpath, '//*[@text="Last name"]', surname)
  $driver.hide_keyboard

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

  #$driver.alert_accept

end

Then(/^I have successfully signed up$/) do

  # my_account_name = get_element(:id, 'textview_sign_in_status').text
  # expected_name = email[0..5]
  # p my_account_name
  # unless my_account_name.include? expected_name
  #   raise "Incorrect account name!!! Expected: #{expected_name}, got: #{my_account_name}"
  # end

    Element.get(:id, 'search_box')
    Element.validate_if_invisible(:id, 'button_register')
    Element.validate_if_invisible(:id, 'button_sign_in')

    Element.click(:id, 'home')
    Element.get(:id, 'menuitem_home')
    Element.validate_if_invisible(:id, 'textview_sign_out_status')




end

When(/^I print stuff$/) do
  puts "stuff"
end

And(/^I print specific stuff: "(.+)"$/) do |stuff|
  puts stuff
end

And(/^I am a (user|admin) who wants to print my name$/) do |thing|
  case thing
  when "user"
    puts "do user specific things"
  when "admin"
    puts "do admin specific things"
  end
end
