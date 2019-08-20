When (/^I open the categories$/)do
Element.click(:xpath, '//*[@text="CATEGORIES"]')
end

And (/^I choose Antiques category$/)do
Element.click(:xpath, '//*[@text="Antiques"]')
end

And (/^I choose Antiquities subcategory$/)do
Element.click(:xpath, '//*[@text="Antiquities"]')
end

And (/^I choose Byzantine category option$/)do
Element.click(:xpath, '//*[@text="Byzantine"]')
end

Then (/^the correct list of materials are shown$/)do
  # Element.get(:xpath, '//*[@text="Terracota"]')
  materials = ['Bronze', 'Gold', 'Lead', 'Glass', 'Copper', 'Iron', 'Wood', 'Paper','Stone', 'Brass', 'Pottery', 'Terracota']
  for a in materials
    Element.get(:xpath, "//*[@text='#{a}']")
    $driver.swipe(start_x: 400, start_y: 600, end_x: 0, end_y: 600, duration: 1000)
  end
end
