require 'appium_lib'
require 'faker'
require 'cucumber'

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

$driver = Appium::Driver.new(opts, true)
Selenium::WebDriver.logger.level = :error

Before do
  $driver.start_driver
end

After do |scenario|
  p scenario.methods
  add_screenshot(scenario.name) if scenario.failed?
  $driver.quit_driver
end

def add_screenshot(scenario_name)
  scenarioname.tr!(" ", "")
  local_name = "reports/#{scenario_name}.png"
  $driver.screenshot(local_name)
  embed(local_name, 'image/png', "SCREENSHOT")
end
