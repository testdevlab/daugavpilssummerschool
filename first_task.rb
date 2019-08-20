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


app_path = "/Users/summerschool/Downloads/ebay_app.apk"
opts = {
  caps: { # change capabilities to yours
    avd: 'Pixel_2_API_26',
    platformName:  'Android',
    deviceName:    'some_name',
    app:           app_path
  },
  appium_lib: {
    server_url: "http://localhost:4750/wd/hub"
  }
}

$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level = :error
#$driver = Appium::Driver.new(caps: desired_capabilities, appium_lib: { server_url: "http://localhost:4750/wd/hub" })
$driver.start_driver

# register button on home screen
get_element(:id, 'button_register').click

# simple registration with email button
get_element(:id, 'button_classic').click

# email field
email = Faker::Internet.email
get_element(:xpath, '//*[@text="Email"]').send_keys(email)
$driver.hide_keyboard

# first name field
first_name = Faker::Name.first_name
get_element(:xpath, '//*[@text="First name"]').send_keys(first_name)
$driver.hide_keyboard

# last name field
last_name = Faker::Name.last_name
get_element(:xpath, '//*[@text="Last name"]').send_keys(last_name)
$driver.hide_keyboard

# continue button (click)
get_element(:xpath, '//*[@text="CONTINUE"]').click

# password field
get_element(:id, 'et_temp').send_keys("Parole123")
$driver.hide_keyboard

# create account button
get_element(:id, 'bt_create_your_account').click

# VALIDATE THAT LOGGED IN (registered)

# click "Accept" button
$driver.alert_accept

# home button to open side bar
get_element(:id, 'home').click

# my account name (to validate)
my_account_name = get_element(:id, 'textview_sign_in_status').text
expected_name = email[0..4]
p my_account_name
unless my_account_name.include? expected_name
  raise "Incorrect account name!!! Expected: #{expected_name}, got: #{my_account_name}"
end

$driver.driver_quit
