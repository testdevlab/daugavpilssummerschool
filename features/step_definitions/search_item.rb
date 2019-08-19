

  


And (/^I click on the "Search for anything" field$/) do
  Element.click(:id, 'search_box')
end

And(/^I input "(.+)" in the search field$/) do |input_text|
  @input_text = input_text
  Element.set(:id, 'search_src_text', @input_text)
end


When (/^I choose the first option in the list$/) do
  #Element.click(:id, 'search_box')
  Element.click(:xpath, '//*[@text="hockey stick tape"]')
end

Then(/^all offers include searched keywords$/) do
  error_list = []
  option_list = Element.get_list(:xpath, '//*[@text="hockey stick tape"]')
  option_list.each do |option|
    unless option.text.include? @input_text
      error_list << "Option does not have the keywords, expected: #{@input_text}, got: #{option.text}"
    end
  end
  raise error_list.to_s.tr(',',"\n") unless error_list.empty?
end
