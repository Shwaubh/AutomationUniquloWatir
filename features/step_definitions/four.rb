When ('We choose a Mobile {string}') do |data|
  but = @browser.button(aria_label: 'Select Device '+data)
  but.click
end

When ('We add an Add-On {string} and proceed to cart') do |data|
  @browser.div(aria_label: "I'm new to Optus radio button").click()
  @browser.span(text: "Proceed to checkout as a new customer").click()
  @browser.button(aria_label: 'Add '+data).wait_while(&:obscured?).click
  @browser.button(text: 'Proceed to Cart').wait_while(&:obscured?).click
end

When('We choose a MSN Number') do
  @browser.element(text: 'Get a new number').click
  @browser.button(text: 'Next').wait_while(&:obscured?).click
end
