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
# DONT COPY THIS! you have your own desired capabilities :)
=begin
desired_capabilities = {
  "deviceName" => "somename",
  "platformName" => "Android",
  "app" => "//Users/summerschool/Desktop/ebay_app.apk"
}
=end

app_path = "/Users/summerschool/Desktop/ebay_app.apk" # change path to your ebay app

opts = {
  caps: { # change capabilities to your

    platformName:  'Android',
    deviceName:    'somename',
    app:           app_path,
    avd: 'Pixel_2_API_26'
  },
  appium_lib: {
    server_url: "http://localhost:4750/wd/hub"
  }
}




$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level = :error
$driver.start_driver

# register button on home screen
get_element(:id, 'button_register').click

# simple registration with email button
get_element(:id, 'button_classic').click

# email field
email = Faker::Games::Pokemon.name.downcase
email2 = Faker::Color.color_name.downcase
get_element(:xpath, '//*[@text="Email"]').send_keys("#{email}#{email2}xd@gmail.com")
$driver.hide_keyboard

# first name field
get_element(:xpath, '//*[@text="First name"]').send_keys("Janis")
$driver.hide_keyboard

# last name field
get_element(:xpath, '//*[@text="Last name"]').send_keys("Berzins")
$driver.hide_keyboard

# continue button (click)
get_element(:xpath, '//*[@text="CONTINUE"]').click

# password field
get_element(:id, 'et_temp').send_keys("Parole123")
$driver.hide_keyboard

# create account button
get_element(:id, 'bt_create_your_account').click

# fingerprint - maybe later button (NOT APPEARING ON EMULATORS!!)
#get_element(:id, 'bt_maybe_later').click
