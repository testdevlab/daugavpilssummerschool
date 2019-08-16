require 'appium_lib'
#require 'faker'
require 'cucumber'

app_path = "/Users/summerschool/Downloads/ebay_app.apk"
opts = {
  caps: {
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

Before do
  $driver.start_driver
end

After do
  $driver.driver_quit
end

After do |scenario|
  #p scenario.methods
  add_screenshot(scenario.name) if scenario.failed?
  $driver.quit_driver
end

def add_screenshot(scenario_name)
  scenario_name.tr!(" ", "_")
  local_name = "reports/#{scenario_name}.png"
  $driver.screenshot(local_name)
  embed(local_name, 'image/png', "SCREENSHOT")
end
