When(/^I start registration with an email$/) do
  # register button on home screen
  Element.click(:id, 'button_register')
  #raise "Just checking the report and screenshort"

  # simple registration with email button
  Element.click(:id, 'button_classic')
end

And(/^I input personal data$/) do
  # email field
  email = Faker::Internet.email
  Element.get(:xpath, '//*[@text="Email"]').send_keys(email)
  $driver.hide_keyboard


  # first name field
  first_name = Faker::Name.first_name
  Element.get(:xpath, '//*[@text="First name"]').send_keys(first_name)

  # last name field
  last_name = Faker::Name.last_name
  Element.get(:xpath, '//*[@text="Last name"]').send_keys(last_name)
  $driver.hide_keyboard

end

And(/^I press continue$/) do
  # continue button (click)
  Element.click(:xpath, '//*[@text="CONTINUE"]')

end

And(/^I choose my password$/) do
  # password field
  Element.get(:id, 'et_temp').send_keys("Parole123")
  $driver.hide_keyboard

end

And(/^I finish registration$/) do
  # create account button
  Element.get(:id, 'bt_create_your_account').click

end

# Then(/^I have successfully signed up$/) do
#   my_account_name = get_element(:id, 'textview_sign_in_status').text
#   expected_name = email[0..5]
#   p my_account_name
#   unless my_account_name.include? expected_name
#     raise "Incorrect account name!!! Expected: #{expected_name}, got: #{my_account_name}"
#   end
# end


Then(/^I have successfully signed up$/) do
  Element.get(:id, 'search_box')
  Element.validate_if_invisible(:id, 'button_register')

  Element.validate_if_invisible(:id, 'button_sign_in')

  Element.get(:id, 'home').click
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




# sign in button in sidebar
