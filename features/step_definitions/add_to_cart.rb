When (/^I click on the "Search for anything" field$/) do
  Element.click(:id, 'search_box')
end

And (/^I input "(.+)" in the search field/) do |input_text|
  @input_text = input_text
  Element.set(:id, 'search_src_text', @input_text)
end

And (/^I select white shoes mens/) do
  Element.set(:xpath, '//*[@text="white shoes men"]')
end

And (/^I select first item/) do
  Element.set()
end

# When(/^I start registration with an email$/) do
#   # register button on home screen
#   Element.click(:id, 'button_register')
#   #raise "Just checking the report and screenshort"
#
#   # simple registration with email button
#   Element.click(:id, 'button_classic')
# end
#
# And(/^I input personal data$/) do
#   # email field
#   email = Faker::Internet.email
#   get_element(:xpath, '//*[@text="Email"]').send_keys(email)
#   $driver.hide_keyboard
#
#
#   # first name field
#   name = Faker::Games::Pokemon.name
#   Element.get(:xpath, '//*[@text="First name"]')
#
#   # last name field
#   surname = Faker::Games::Pokemon.name
#   get_element(:xpath, '//*[@text="Last name"]').send_keys(surname)
#   $driver.hide_keyboard
#
# end
#
# And(/^I press continue$/) do
#   # continue button (click)
#   Element.click(:xpath, '//*[@text="CONTINUE"]')
#
# end
#
# And(/^I choose my password$/) do
#   # password field
#   get_element(:id, 'et_temp').send_keys("Parole123")
#   $driver.hide_keyboard
#
# end
#
# And(/^I finish registration$/) do
#   # create account button
#   get_element(:id, 'bt_create_your_account').click
#
# end
#
# # Then(/^I have successfully signed up$/) do
# #   my_account_name = get_element(:id, 'textview_sign_in_status').text
# #   expected_name = email[0..5]
# #   p my_account_name
# #   unless my_account_name.include? expected_name
# #     raise "Incorrect account name!!! Expected: #{expected_name}, got: #{my_account_name}"
# #   end
# # end
#
#
# Then(/^I have successfully signed up$/) do
#   get_element(:id, 'search_box')
#   validate_if_invisible(:id, 'button_register')
#
#   Element.validate_if_invisible(:id, 'button_sign_in')
#
#   get_element(:id, 'home').click
#   get_element(:id, 'menuitem_home')
#   validate_if_invisible(:id, 'textview_sign_out_status')
# end
#
# When(/^I print stuff$/) do
#   puts "stuff"
# end
#
# And(/^I print specific stuff: "(.+)"$/) do |stuff|
#   puts stuff
# end
#
# And(/^I am a (user|admin) who wants to print my name$/) do |thing|
#   case thing
#   when "user"
#     puts "do user specific things"
#   when "admin"
#     puts "do admin specific things"
#   end
# end
