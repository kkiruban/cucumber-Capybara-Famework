
When(/^I enter the credentials to the Zenith application$/) do
  sleep 5
  visit get_url
  sleep 5
  arg = getCredentialInfo
  sleep 5
  fill_in "Username",:with => arg["Username"]
  fill_in "Password",:with => arg["Password"]
  find(:id,"Login").click
  sleep 30
  puts "Logged in successfully"
  if page.has_xpath?('//div[@title="CRM"]//i')
    find(:xpath, '//div[@title="CRM"]//i').click
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  end
  sleep 3
end

#Step definition login as BA
When(/^I login as BA$/) do
  sleep 5
  visit get_url
  sleep 5
  arg = getCredentialInfo
  sleep 5
  arg = logIn_As_BA
  fill_in "Username",:with => arg["Username"]
  fill_in "Password",:with => arg["Password"]
  find(:id,"Login").click
  sleep 30
  if page.has_xpath?('//a[text()="Remind Me Later"]')
    find(:xpath, '//a[text()="Remind Me Later"]').click
  end
  puts "Logged in successfully"
  sleep 5
end


Given(/^I login to the "([^"]*)" application$/) do |application|
  begin
    sleep 5
    visit get_url
    sleep 5
    arg = getCredentialInfo
    sleep 5
    fill_in "Username",:with => arg["Username"]
    fill_in "Password",:with => arg["Password"]
    sleep 5
    find("#Login").click
    sleep 25
    puts "Successfully entered the #{application} user credentials"
    sleep 3
  rescue Exception => ex
    raise "Error occurred while entering #{application} user credentials"
  end
end


Then(/^I able to see the logged in to "([^"]*)" application$/) do |app|
  sleep 5
  if page.has_css?("#userNav")
    puts "Successfully logged in to #{app} application"
  else
    raise "Failed to logged in to #{app} application"
  end
end
