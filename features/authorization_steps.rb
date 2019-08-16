 require 'appium_lib'
 require 'faker'

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
  get_element(:id, 'button_register').click
  get_element(:id, 'button_classic').click

end

And(/^I input personal data$/) do
  email2 = Faker::Internet.email
  name = "#{email2}"
  Element.set(:xpath, '//*[@text="Email"]', name)
#  get_element(:xpath, '//*[@text="Email"]').send_keys("#{email}#{email2}xd@gmail.com")
  $driver.hide_keyboard
  Element.set(:xpath, '//*[@text="First name"]', "Janis")
  #get_element(:xpath, '//*[@text="First name"]').send_keys("Janis")
  $driver.hide_keyboard
  Element.set(:xpath, '//*[@text="Last name"]', "Rozentals")
  #get_element(:xpath, '//*[@text="Last name"]').send_keys("Berzins")
  $driver.hide_keyboard
end

And(/^I press continue$/) do
#get_element(:xpath, '//*[@text="CONTINUE"]').click
Element.click(:xpath, '//*[@text="CONTINUE"]')
end

And(/^I choose my password$/) do
  Element.set(:id, 'et_temp', "parilois123")
#  get_element(:id, 'et_temp').send_keys("Parole123")
  $driver.hide_keyboard
end

And(/^I finish registration$/) do
get_element(:id, 'bt_create_your_account').click
end

Then(/^I have successfully signed up$/) do
  get_element(:id, 'search_box')
  validate_if_invisible(:id, 'button_register')
  validate_if_invisible(:id, 'button_sign_in')

  get_element(:id, 'home').click
  get_element(:id, 'menuitem_home')
  validate_if_invisible(:id, 'textview_sign_out_status')
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
