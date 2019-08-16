def get_element(type, value)
  start = Time.new
  while Time.new - start < 20
    begin
      el = $driver.find_element(type, value)
      p "Found, type: #{type}, value: #{value}"
      return el
    rescue
      p "Retrying, type: #{type}, value: #{value}"
      sleep(0.2)
    end
  end
  raise "Failed to find element, type: #{type}, value: #{value}"
end

def validate_if_invisible(type, value)
  start = Time.new
  while Time.new - start < 5
    begin
      $driver.find_element(type, value)
      p "Element still visible, type: #{type}, value: #{value}"
    rescue
      p "Element was not found, success! type: #{type}, value: #{value}"
      return
    end
    sleep(0.2)
  end
  raise "Element still visible, type: #{type}, value: #{value}"
end

When(/^I start registration with an email$/) do

  # register button on home screen
  Element.click(:id, 'button_register')

  # simple registration with email button
  Element.click(:id, 'button_classic')

end

And(/^I input personal data$/) do

  # email field
  email = Faker::Internet.email
  Element.set(:xpath, '//*[@text="Email"]', email)

  name = Faker::Games::Pokemon.name
  # first name field
  Element.set(:xpath, '//*[@text="First name"]', name)

  surname = Faker::Games::Pokemon.name
  # last name field
  Element.set(:xpath, '//*[@text="Last name"]', surname)

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

  # home button to open side bar
  #Element.click(:id, 'home')

end

Then(/^I have successfully signed up$/) do

=begin
  my account name (to validate)
  my_account_name = get_element(:id, 'textview_sign_in_status').text
  expected_name = email[0..5]
  p my_account_name
  unless my_account_name.include? expected_name
  raise "Incorrect account name!!! Expected: #{expected_name}, got: #{my_account_name}"
  end
=end

  Element.get(:id, 'search_box')
  Element.validate_if_invisible(:id, 'button_register')
  Element.validate_if_invisible(:id, 'button_sign_in')

  Element.click(:id, 'home')
  Element.validate_if_invisible(:id, 'menuitem_home')
  Element.validate_if_invisible(:id, 'textview_sign_out_status')

end

=begin
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
=end
