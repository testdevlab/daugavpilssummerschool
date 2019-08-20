  Given (/^I have signed up$/)do

    Element.click(:id, 'button_sign_in')

    Element.click(:id, 'button_classic')

    email = "stepanas@inbox.lv"
    Element.set(:xpath, '//*[@text="Email or username"]', email)
    password = "ananas123"
    Element.set(:xpath, '//*[@text="Password"]', password)

    Element.click(:xpath, '//*[@text="SIGN IN"]')

    Element.click(:xpath, '//*[@text="Accept"]')

  end

  When (/^I click on "Search for anything"$/)do
  Element.click(:id, 'search_box')
  end

  And (/^I search "hockey stick tape" in the search field$/)do
  item = "hockey stick tape"
  Element.set(:id, 'search_src_text',item)
  $driver.hide_keyboard
  end

  And (/^I choose the first option in the suggestion list$/)do
  Element.click(:xpath, '(//*[@resource-id="com.ebay.mobile:id/suggestionList"]//android.widget.TextView)[1]')
  end

  Then (/^this item has the searched keywords in the title$/)do
  Element.get(:xpath, "//*[@content-desc=#{item}]")
  # šeit pēc @content-desc= "X", X vietā jābūt item name
  # (item - tas, ko mēs ievadām iekšā, kad meklējam. šajā gadījumā - hockey stick tape)
  # šo līniju jāmaina, kad mainās item name. nezinu kā lai noformē, lai tas notiek automatizēti.
  end
