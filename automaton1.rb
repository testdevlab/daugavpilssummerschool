require 'appium_lib'
require 'faker'

def get_element(type, value)
  start=Time.new
  while Time.new - start <30
    begin
      el = $driver.find_element(type, value)
     return el
    rescue
      p "Retrying, type: #{type}, value: #{value}"
  end
  end
raise "failed to find element, type: #{type}, value: #{value}"
end

# desired_capabilities = {
#   "avd" => "Pixel_2_API_26",
#   "platformName" => "Android",
#   "deviceName" => "some_name",
#   "app" =>"/Users/summerschool/Downloads/ebay_app.apk"
# }

app_path = "/Users/summerschool/Downloads/ebay_app.apk" # change path to your ebay app
opts = {
  caps: { # change capabilities to yours
    platformName:  'Android',
    deviceName:    'some_name',
    avd: 'Pixel_2_API_26',
    app:           app_path
  },
  appium_lib: {
    server_url: "http://localhost:4750/wd/hub"
  }
}

$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level = :error
$driver.start_driver

get_element(:id, "button_classic").click

email = Faker::Internet.email
get_element(:xpath, '//*[@text="Email"]').send_keys("#{email}")
$driver.hide_keyboard

name = Faker::Games::Pokemon.name
get_element(:xpath, '//*[@text="First name"]').send_keys("#{name}")
$driver.hide_keyboard

surname = Faker::Games::Pokemon.name
get_element(:xpath, '//*[@text="Last name"]').send_keys("#{surname}")
$driver.hide_keyboard

get_element(:xpath, '//*[@text="CONTINUE"]').click

# password field
pass = Faker::Games::Pokemon.name
get_element(:id, 'et_temp').send_keys("#{pass}")
$driver.hide_keyboard

# create account button
get_element(:id, 'bt_create_your_account').click

$driver.alert_accept

get_element(:id, 'home').click

Then(/^I have successfully signed up$/) do
  get_element(:id, 'search_box')
  validate_if_invisible(:id, 'button_register')
  validate_if_invisible(:id, 'button_sign_in')

  get_element(:id, 'home').click
  get_element(:id, 'menuitem_home')
  validate_if_invisible(:id, 'textview_sign_out_status')
end

$driver.driver_quit
