require 'appium_lib'
require 'faker'

def get_element (type, value)
  start = Time.new
  while Time.new - start < 20
    begin
    el = $driver.find_element(type, value)
    p "Found type: #{type}, value: #{value}"
      return el
    rescue
      p "Retrying, type: #{type}, value: #{value}"
      sleep(0.2)
    end
  end
  raise "Faile to find element, type: #{type}, value: #{value}"
end

app_path = "/Users/summerschool/Downloads/ebay_app.apk"
opts = {
  caps: {
    avd: 'Pixel_2_API_26',
    platformName:  'Android',
    deviceName:    'randoom',
    app:           app_path
  },
  appium_lib: {
    server_url: "http://localhost:4750/wd/hub"
  }
}

$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level =:error
$driver.start_driver

get_element(:id, "com.ebay.mobile:id/button_register").click

get_element(:id, "com.ebay.mobile:id/button_classic").click

random_email = Faker::Internet.email

get_element(:xpath, '//*[@text="Email"]').send_keys(random_email)
$driver.hide_keyboard

name = Faker::Games::Pokemon.name
get_element(:xpath, '//*[@text="First name"]').send_keys(name)
$driver.hide_keyboard

surname = Faker::Games::Pokemon
get_element(:xpath, '//*[@text="Last name"]').send_keys(surname)
$driver.hide_keyboard

get_element(:xpath, '//*[@text="CONTINUE"]').click

get_element(:id, "com.ebay.mobile:id/et_temp").send_keys("qwerty1234")
$driver.hide_keyboard

get_element(:id, "com.ebay.mobile:id/bt_create_your_account").click



get_element(:id, "com.ebay.mobile:id/home").click

my_acc_name = get_element(:id, "textview_sign_in_status").text
expected_name = random_email[0..5]
p my_acc_name
  unless my_acc_name.include? expected_name
  raise "Incorrect account name!!! Expected: #{expected_name}, got: #{my_acc_name}"
end




$driver.driver_quit
