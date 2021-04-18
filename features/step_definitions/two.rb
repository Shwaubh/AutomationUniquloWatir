Given ('We are able to launch Data SIMs section in Home Internet & nbn') do
  dataSim = @browser.link(text: 'Data SIMs')
  dataSim.click
end

When('We choose a plan {string}') do |data|
  if data.start_with?('Small')
    @browser.button(text: 'BUY NOW', index: 0).click()
  elsif data.start_with?('Medium')
    @browser.button(text: 'BUY NOW', index: 1).click()
  else
    @browser.button(text: 'BUY NOW', index: 2).click()
  end
end

When ('We proceed to cart') do
  @browser.div(aria_label: "I'm new to Optus radio button").click()
  @browser.span(text: "Proceed to checkout as a new customer").click()
  @browser.button(text: 'Proceed to Cart').wait_while(&:obscured?).click
end

When ('We do checkout') do
  @browser.button(text: 'CHECKOUT').click()
end

When (/^We fill our personal details (.*) (.*)$/) do |emailId, phoneNum|
  @browser.input(id: 'emailAddress').send_keys(emailId)
  @browser.input(id: 'emailAddressConfirmation').send_keys(emailId)
  @browser.button(text: 'Continue').click
  @browser.input(id: 'primaryContactNumber').send_keys(phoneNum)
  @browser.select_list(id: 'title').select_value('Mr')
  @browser.select_list(id: 'gender').select_value('Male')
  @browser.input(id: 'firstName').send_keys('Invalid')
  @browser.input(id: 'lastName').send_keys('Invalid')
  @browser.select_list(id: 'dobDay').select_value('05')
  @browser.select_list(id: 'dobMonth').select_value('Jun')
  @browser.input(id: 'dobYear').send_keys('1995')
  @browser.button(text: 'Next').click
  @browser.element(for: 'checkboxiduxPrimaryAddressDetails').click()
  @browser.input(id: 'uxPrimaryAddressDetailsappNo').send_keys('1')
  @browser.input(id: 'uxPrimaryAddressDetailsstreetNo').send_keys('7')
  @browser.input(id: 'uxPrimaryAddressDetailsstreetName').send_keys('LyonPark Rd')
  @browser.input(id: 'uxPrimaryAddressDetailssuburb').send_keys('Macquaire Park')
  @browser.input(id: 'uxPrimaryAddressDetailspostcode').send_keys('2170')
  @browser.select_list(id: 'addressType-uxPrimaryAddressDetails').select_value('Flat')
  @browser.select_list(id: 'uxPrimaryAddressDetailsstate').select_value('NSW')
  @browser.select_list(id: 'uxPrimaryAddressDetailsstreetType').select_value('Close')
  @browser.select_list(id: 'residentialStatus').select_value('Owns')
  @browser.select_list(id: 'yearLivedAtAddress').select_value('5')
  @browser.select_list(id: 'monthLivedAtAddress').select_value('5')
  @browser.link(aria_label: 'Next').click
  @browser.select_list(id: 'occupation').select_value('Administration')
  @browser.input(id: 'employerName').send_keys('Emp')
  @browser.select_list(id: 'employmentStatus').select_value('Casual/Seasonal')
  @browser.select_list(id: 'typeOfIndustry').select_value('CommunicationServices')
  @browser.select_list(id: 'howLongHereYear').select_value('4')
  @browser.select_list(id: 'howLongHereMonth').select_value('4')
  @browser.button(text: 'Next').click
  @browser.span(text: "Australian driver's licence").click
  @browser.select_list(id: 'stateOfIssue').select_value('NSW')
  @browser.select_list(id: 'expiryMonth').select_value('Jan')
  @browser.select_list(id: 'expiryYear').select_value('2022')
  @browser.input(id: 'driversLicenseNumber').send_keys('DL'+rand(10000000..90000000).to_s)
end

# When('We choose a MSN Number') do
#   pending
# end

When('We fill the Shipment delivery address') do
  @browser.element(text: 'I agree to Optus to share my personal information with credit reporting bodies for a credit check and to confirm my identity with the issuer or official record holder of my identity documents via third party systems.').click()
  log("came here1")
  @browser.button(text: 'Next').click()
  log("came here2")
  @browser.element(text: 'Have a question or need help?').wait_until(&:present?)
  log("came here3")
  @browser.button(text: 'Next').click()
  log("came here4")
  @browser.element(text: 'Your Billing Address').wait_until(&:present?)
  log("came here5")
  @browser.button(text: 'Next').wait_while(&:obscured?).click()
  log("came here6")
  @browser.span(text: 'No direct debit - Make manual payments').click()
  log("came here7")
  @browser.button(text: 'Next').wait_while(&:obscured?).click()
end

Then('We verify the items in order summary page as same as selected') do
  mobileName = @browser.element(class: ['title', 'v-normal-bottom'], index:0).text
  log("mobileName "+mobileName)
  desc = @browser.element(class: ['description', 'size6'], index:0).text
  log("description "+desc)
  mobilePrice = @browser.element(class: ['value', 'size7'], index:0).text
  log("mobileName "+mobilePrice)
  total = @browser.element(class: ['total', 'price'], index:0).text
  log("mobileName "+total)
  bilAcc = @browser.element(class: ['columns', 'small-7', 'align-right'], index:0).text
  log("mobileName "+bilAcc)
end
