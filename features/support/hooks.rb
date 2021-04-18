require 'watir'

Before do |scen|
  @browser = Watir::Browser.new :chrome, driver_path: File.join(File.dirname(__FILE__),"chromedriver")
  @browser.goto('https://www.optus.com.au')
  @step = 0
  @name = scen.source_tag_names[0].to_s
end

After do
  @browser.close()
end

AfterStep do
  @step = @step + 1
  @browser.screenshot.save 'scenario/'+@name+@step.to_s+'.png'
end
