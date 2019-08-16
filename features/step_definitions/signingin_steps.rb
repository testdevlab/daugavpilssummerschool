# Sign in button is with id: button_sign_in
#
# USE EMAIL OR USERNAME
#
# Email or username
#
# Password
#
#
# SIGN IN

When(/^I start signing in with "(.+)"$/) do |user|
  $user = user
  Element.click(:id, "button_sign_in")
  # Element.click(:xpath, '//*[@text="USE EMAIL OR USERNAME"]')
  Element.click(:id, "button_classic")

end


And(/^I input "(.+)", "(.+)"$/) do |email, passwd|
  Element.set(:xpath, '//*[@text="Email or username"]', email)
  Element.set(:xpath, '//*[@text="Password"]', passwd)

end


And(/^I press sign in button$/) do
  Element.click(:xpath, '//*[@text="SIGN IN"]')
  # $driver.alert_accept
  Element.click(:id, "gdpr_consent")

end


Then(/^I am signed in$/) do
  puts "Cool, bunny is signed in!"
  $driver.alert_accept

end
