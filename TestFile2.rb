require 'appium_lib'

def get_element(type, value)
  start = Time.new
  while Time.now - start < 10
    begin
      el = $driver.find_element(type, value)
      return el
    rescue
      p "?=> Retrying #{value}"
      sleep(0.5)
    end
  end
  raise "!=> Failed #{type}: #{value}"
end

app_path = "/Users/summerschool/Downloads/ebay_app.apk" # change path to your ebay app
opts = {
  caps: { # change capabilities to yours
    platformName:  'Android',
    deviceName:    'emulator-5554',
    avd:           'Pixel_3_API_25',
    app:            app_path
  },
  appium_lib: {
    server_url: "http://localhost:4723/wd/hub"
  }
}

$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level = :error
$driver.start_driver
#code start
$driver.alert_accept
#get_element(:id, "button_register").click
#get_element(:xpath, '//android.widget.TextView[@text="Black"]').send_keys("something")

get_element(:id, "button_sign_in").click
get_element(:id, "button_classic").click
get_element(:xpath, "//*[@text='Email or username']").send_keys("Marvic-lv")
$driver.hide_keyboard
get_element(:xpath, "//*[@text='Password']").send_keys("Neverseen1")
$driver.hide_keyboard
get_element(:xpath, "//*[@text='SIGN IN']").click

get_element(:id, "search_box").click
get_element(:id, "search_src_text").send_keys("Bike wheel")
get_element(:xpath, "//android.widget.RelativeLayout[1]/android.widget.TextView").click

#p $driver.methods #print all driver methods
sleep(5)
#code end
$driver.driver_quit
