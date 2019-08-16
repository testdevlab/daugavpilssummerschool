Given (/^I have sign in$/) do
  step 'I start registration with an email'
  step 'I input personal data'
  step 'I press continue'
  step 'I choose my password'
  step 'I finish registration'
end

When (/^I open the left side section$/) do
Element.click(:id, 'home')
end

And (/^open "Saved" section$/) do
Element.click(:xpath, '//*[@text="Saved"]')
end

And (/^I open the categories$/) do
Element.click(:xpath, '//*[@text="CATEGORIES"]')
end

And (/^I choose Antiques category$/) do
Element.click(:xpath, '//*[@text="Antiques"]')
end

And (/^I choose Antiquities subcategory$/) do
Element.click(:xpath, '//*[@text="Antiquities"]')
end

And (/^I choose Byzantine category option$/) do
Element.click(:xpath, '//*[@text="Byzantine"]')
end

Then (/^the title in the top says "Saved" correctly$/) do
  error_list = []
  save="Saved"
  saved = Element.get_list(:id, 'title')
  saved.each do |item|
    unless item.text.include? save
      error_list << "Item does not have the keywords, expected: Saved, got: #{item.text}"
    end
  end
  raise error_list.to_s.tr(',',"\n") unless error_list.empty?
  end

# I haven't idea how to do this step :(
  Then (/^the correct list of materials are shown$/) do
    expected_names = ["Bronze", "Gold", "Lead", "Glass", "Copper", "Iron", "Wood", "Paper", "Stone", "Brass", "Pottery", "Terracota"]
    error_list = []
    tab_name_list = Element.get_list(:xpath, '//android.widget.LinearLayout[1]/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.FrameLayout')
    counter=0
    tab_name_list.each do |name|
    unless name.text == expected_names[counter]
      error_list << "Wrong tab name, expected: #{expected_names[counter]}, got: #{name.text}"
    end
    counter+=1
    end
    raise error_list.to_s.tr(',',"\n") unless error_list.empty?
  end
