Given('We are able to launch Optus Website') do
  @browser.window.maximize
  log('Expected Title : Optus - Mobile Phones, nbn, Home Internet, Entertainment and Sports')
  log('Acctual Title : '+@browser.window.title.to_s)
end

Given('We are able to open Shop section from menu') do
  shop = @browser.span(class: 'cta-label')
  shop.click()
  log("Yes,We are able to open Shop section from menu")
end

Given('We are able to launch latest Phones section in Mobile') do
  latest_phone = @browser.link(text: 'Latest Phones')
  latest_phone.click()
  log('Expected Title : Mobile Phones | Optus')
  log('Acctual Title : '+@browser.window.title.to_s)
end

When('We Apply filter on Brand as {string}') do |data|
  brand = @browser.span(text: 'All Brands')
  brand.click()
  @browser.label(for: 'brand-'+data).click()
  brand = @browser.span(text: data)
  brand.click()
  log("Filter Applied Brand Name as "+data)
end

When('We Apply filter on Internal Memory as {string}') do |data|
  brand = @browser.span(text: 'All Internal Memory')
  brand.click()
  label = @browser.label(text: data)
  label.click
  brand.click()
  log("Filter Applied Internal Memory as "+data)
end

When('We Apply filter on Network Speed as {string}') do |data|
  brand = @browser.span(text: 'All Network Speed')
  brand.click()
  label = @browser.label(text: data)
  label.click()
  brand.click()
  log("Filter Applied Network Speed as "+data)
end

When('We Apply filter on sort as {string}') do |data|
  brand = @browser.span(text: 'All Sort')
  brand.click()
  label = @browser.label(text: data)
  label.click()
  log("Filter Applied sort as "+data)
end

Then('We are able to retrieve at least 3 phones') do
  # brandName1 = @browser.element(class: ['sc-gYhigD', 'gdlclw'], index: 0)
  # modelName1 = @browser.element(class: ['sc-bGqQkm', 'jyZRYv'], index: 0)
  # temp1 = @browser.element(class: ['sc-cjHJEj', 'gziIod', 'MobileDevicestyle__PriceDetail'], index: 0)
  # brandName2 = @browser.element(class: ['sc-gYhigD', 'gdlclw'], index: 1)
  # modelName2 = @browser.element(class: ['sc-bGqQkm', 'jyZRYv'], index: 1)
  # temp2 = @browser.element(class: ['sc-cjHJEj', 'gziIod', 'MobileDevicestyle__PriceDetail'], index: 1)
  # brandName3 = @browser.element(class: ['sc-gYhigD', 'gdlclw'], index: 2)
  # modelName3 = @browser.element(class: ['sc-bGqQkm', 'jyZRYv'], index: 2)
  # temp3 = @browser.element(class: ['sc-cjHJEj', 'gziIod', 'MobileDevicestyle__PriceDetail'], index: 2)
  # log(brandName1.text)
  # log(modelName1.text)
  # log(temp1.text)
  # log(brandName2.text)
  # log(modelName2.text)
  # log(temp2.text)
  # log(brandName3.text)
  # log(modelName3.text)
  # log(temp3.text)
  @browser.button(text: "SELECT DEVICE", index:0).click
  temp1 = @browser.div(class: 'total-price').text
  title1 = @browser.window.title.to_s
  @browser.back
  @browser.button(text: "SELECT DEVICE", index:1).click
  temp2 = @browser.div(class: 'total-price').text
  title2 = @browser.window.title.to_s
  @browser.back
  @browser.button(text: "SELECT DEVICE", index:2).click
  temp3 = @browser.div(class: 'total-price').text
  title3 = @browser.window.title.to_s
  @browser.back
  title1.slice! "Buy the "
  title1.slice! " on a plan | Optus"
  title2.slice! "Buy the "
  title2.slice! " on a plan | Optus"
  title3.slice! "Buy the "
  title3.slice! " on a plan | Optus"
  log("Phone 1 is")
  log(title1)
  log(temp1)
  log("Phone 2 is")
  log(title2)
  log(temp2)
  log("Phone 3 is")
  log(title3)
  log(temp3)
end
