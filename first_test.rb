require 'appium_lib'
require 'faker'

def get_element(type, value)
  start = Time.new
  while Time.new - start < 20
    begin
      el = $driver.find_element(type, value)
      p "Found type:#{type}, value: #{value}"
      return el
    rescue
      p "Retrying, type: #{type}, value #{value}"
      sleep(0.2)

    end
  end
  raise "failed to find elements, type: #{type}, value: #{value}"

end

# desired_capabilities = {
#   "avd" => "Pixel_2_API_27",
#   "platformName" => "Android",
#   "deviceName" => "some_name",
#   "app" => "/Users/summerschool/Downloads/ebay_app.apk"
# }

# $driver = Appium::Driver.new(caps: desired_capabilities, appium_lib: { server_url: "http://localhost:4750/wd/hub" })

app_path = "/Users/summerschool/Downloads/ebay_app.apk" # change path to your ebay app
opts = {
  caps: {
      "avd" => "Pixel_2_API_27",
      "platformName" => "Android",
      "deviceName" => "some_name",
      "app" => "/Users/summerschool/Downloads/ebay_app.apk"
  },
  appium_lib: {
    server_url: "http://localhost:4750/wd/hub"
  }
}

$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level = :error

$driver.start_driver


get_element(:id, "button_register").click
get_element(:id, "button_classic").click

email = Faker::Internet.email

name = Faker::Science.element
surname = Faker::Verb.base
o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
str = (0...10).map { o[rand(o.length)] }.join
passwd = str + "23266"


get_element(:xpath, '//*[@text="Email"]').send_keys(email)
$driver.hide_keyboard
puts "Email : #{email}"
get_element(:xpath, '//*[@text="First name"]').send_keys(name)
$driver.hide_keyboard
puts "Name : #{name}"
get_element(:xpath, '//*[@text="Last name"]').send_keys(surname)
$driver.hide_keyboard
puts "Surname : #{surname}"
get_element(:xpath, '//*[@text="CONTINUE"]').click
get_element(:id, "et_temp").send_keys(passwd)
$driver.hide_keyboard
puts "Password : #{passwd}"
get_element(:id, 'bt_create_your_account').click
# get_element(:id, 'bt_maybe_later').click

sleep(2)

# VALIDATE THAT LOGGED IN (registered)

# click "Accept" button
$driver.alert_accept

# home button to open side bar
get_element(:id, 'home').click

# my account name (to validate)
# my_account_name = get_element(:id, 'textview_sign_in_status').text
# expected_name = email[0..5]
# p my_account_name
# unless my_account_name.include? expected_name
#   raise "Incorrect account name!!! Expected: #{expected_name}, got: #{my_account_name}"
# end




$driver.driver_quit
