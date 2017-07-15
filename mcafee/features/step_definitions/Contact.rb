Given(/^I should navigate to Contact tab in saleforce application$/) do
  visit get_url
  sleep 15
  def getcredentialinfo
    yamlinput = "./features/config/Login.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[ENV['UserRole']]
  end
  value =getcredentialinfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 20
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 10
  find(:xpath,"//a[@class='listRelatedObject contactBlock title']").click
  sleep 15
end

Then(/^I should see contact page successfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Contacts: Home ~ Salesforce - Performance Edition"
    puts "succesfully visited home page"
  else
    fail(ArgumentError.new('Not visited home page successfully'))
  end
end

Then(/^I should see "([^"]*)" field with read only permission for all users$/) do |value|
  if page.has_field?(value)
    writeFailure "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    puts "#{value} field is visible with readable permission"
  else
    writeFailure "#{value} field is not visible"
  end
end

When(/^I enter all mandantory fields to create random new contact$/) do
  def getDetails(yamlInfo)
    yamlinput = "./features/config/Contact.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[yamlInfo]
  end
  Contactvalue = getDetails 'Testdata'
  randomvalue=('0000'..'9999').to_a.sample
  $newcontact = Contactvalue["ContactName"] + randomvalue
  sleep 5
  fill_in('Last Name', with=> $newcontact, match: :prefer_exact)
  sleep 10

  # to click on account
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='con4_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-")
  sleep 5
  find_button('Go!').click
  sleep 14
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

