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


app_path = "/Users/summerschool/Downloads/ebay_app.apk" # change path to your ebay app
opts = {
  caps: { # change capabilities to yours
    avd: 'Pixel_2_API_26',
    platformName:  'Android',
    deviceName:    'somename',
    app:           app_path
  },
  appium_lib: {
    server_url: "http://localhost:4750/wd/hub"
  }
}


#desired_capabilities = {
# "avd": "Pixel_2_API_26",
#  "platformName" => "Android",
#  "deviceName" => "somename",
#  "app" => "/Users/summerschool/Downloads/ebay_app.apk"
#}

# $driver = Appium::Driver.new(caps: desired_capabilities, appium_lib: { server_url: "http://localhost:4750/wd/hub" })
$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level = :error
$driver.start_driver

sleep(2)

get_element(:id, "button_register").click

get_element(:id, "button_classic").click

email = Faker::Internet.email
get_element(:xpath, '//*[@text="Email"]').send_keys(email)
name = Faker::Games::Pokemon.name
get_element(:xpath, '//*[@text="First name"]').send_keys(name)
lname = Faker::Games::Pokemon.name
get_element(:xpath, '//*[@text="Last name"]').send_keys(lname)
$driver.hide_keyboard
get_element(:xpath, '//*[@text="CONTINUE"]').click
get_element(:id, "et_temp").send_keys("finland")
$driver.hide_keyboard
get_element(:id, "bt_create_your_account").click

sleep(2)

$driver.driver_quit
