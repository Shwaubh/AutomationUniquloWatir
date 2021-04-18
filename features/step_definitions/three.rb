Given ('We are able to launch iPads & Tablets in Mobile') do
  tabl = @browser.link(text: 'iPads & Tablets')
  tabl.click
end

When ('We choose a Tablet {string}') do |data|
  but = @browser.button(aria_label: 'Select Device '+data)
  but.click
end

When ('We Select a plan {string}') do |data|
  but = @browser.button(aria_label: 'Select Plan '+data)
  but.wait_while(&:obscured?).click
  but = @browser.button(text: 'Continue')
  but.click
end
