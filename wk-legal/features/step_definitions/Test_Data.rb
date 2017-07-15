Given(/^I should navigate to "Accounts" tab in emea application$/) do
  sleep 5
  step 'I enter the credentials to the Zenith application'
  puts "Accounts tab is clicked"
  click_on "Accounts"
end

Given(/^I should navigate to "([^"]*)" tab in saleforce application$/) do |tab|
  step 'I enter the crI enter data to required fields under new opportunity sectionedentials to the Zenith application'
  sleep 10
  click_link(tab)
  sleep 10
end

Given(/^I should navigate to Assets tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 10
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,".//a[@class='listRelatedObject assetBlock title']").click
  sleep 5
end

When(/^I click on "([^"]*)" button under select opportunity record type$/) do |arg1|
  within('#bottomButtonRow') do
    find(:xpath,"//*[@id='bottomButtonRow']/input[1]").click
  end
end

#step definition to create a new quote
When(/^I fill value for all mandatory field to create quote$/) do
  begin
    arg = getquotedetails "create_New_quote"
    sleep 2
    within all('.pbSubsection')[0] do
      table = all("tbody")[0]
      sleep 2
      find(:id, "00N61000004D5gr").select(arg["Quote_Type"])
      sleep 2
      find(:id, "00N61000004D5gq").select(arg["Quote_Type_Year"])
      sleep 2
    end
    within all('.pbSubsection')[1] do
      table = all("tbody")[0]
      sleep 2
      find_field("Earliest New Start Date").set(arg["Earliest_New_Start_Date"])
      sleep 2
      find_field("Latest New End Date").set(arg["Latest_New_End_Date"])
      sleep 2
      find_field("Transaction Amount").set(arg["Transaction_Amount"])
      sleep 2
    end
    sleep 2

    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-opportunity-")
    sleep 5
    find_button('Go!').click
    sleep 4
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10
  end
end

Given(/^I should navigate to Accounts tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 5
  find(:xpath,"//*[@id='Account_Tab']/a").click
  sleep 5
end

When(/^I fill account name as "([^"]*)"$/) do |accname|
  within all('.pbSubsection')[0] do
    randomvalue=('0001'..'9999').to_a.sample
    accountname= "#{accname}#{randomvalue}"
    fill_in("Account Name", :with => accountname)
  end
end

When(/^I fill contact name as "([^"]*)"$/) do |contactname|
  randomvalue=('aaaaa'..'zzzzz').to_a.sample
  contactvalue = contactname + randomvalue
  fill_in("Last Name", :with => contactvalue)
  sleep 5
end

When(/^I fill all mandatory fields to create a random new contact$/) do
  sleep 10
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='con4_lkwgt']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-account-")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
#  select("Client", :from => "Type")
  sleep 5
end

When(/^I enter value "([^"]*)" in currency field$/) do |arg1|
  arg2 = getquotecurrency "currency_value"
  within all('.pbSubsection')[1] do
    arg2.each do |key,value|
      k = key
      v = value
      if k==arg1
        find_field("Currency").select(v)
        sleep 2
        puts v
        sleep 3
      end
    end
  end
end

When(/^I select "([^"]*)" from record type of new record picklist$/) do |value|
  select(value, :from => 'Record Type of new record')
end

When(/^I fill opportunity name as "([^"]*)"$/) do |opportunityname|
  randomvalue=('aaaaa'..'zzzzz').to_a.sample
  oppvalue = opportunityname + randomvalue
  sleep 5
  fill_in("Opportunity Name", :with=>"")
  fill_in("Opportunity Name", :with => oppvalue)
  puts "i fill the opportunity name as #{randomvalue}"
  sleep 5
end

Given(/^I should navigate to "([^"]*)" tab$/) do |tab|
  sleep 5
  click_link(tab)
  sleep 5
end



When(/^I click on new button$/) do
  sleep 5
  within('.bRelatedList') do
    sleep 3
    within('.pbHeader') do
      click_on " New "
      puts "clicked on new button"
    end
  end
end

When(/^I enter data to reqired fields under new contacts section$/) do
  sleep 3
  within all('.pbSubsection')[0] do
    if page.has_field?("name_salutationcon2")
      $fist_name = "Smoke_test_contacts_"+ Random.new.rand(1..20000).to_s
      $last_name = "01"
      fill_in "name_firstcon2",:with => $fist_name
      fill_in "name_lastcon2",:with => $last_name
      puts "contact name is entered"
    end
  end
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke_test_accounts")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end


Then(/^I select opportunity edit from record type of new record$/) do
  within('.pbSubsection') do
    select("Opportunity - Edit", :from => "Record Type of new record")
  end
  within('.pbBottomButtons') do
    if find(:button, "Continue").visible?
      click_on "Continue"
    else
      puts "Continue button is not visible"
    end
  end
end

Then(/^I enter data to required fields under new opportunity section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $opp_name = "Smoke-test-opportinity-"+ Random.new.rand(1..20000).to_s
    fill_in("Opportunity Name", :with=> $opp_name)
    puts "opportunity name is: #{$opp_name}"
    sleep 2
    if page.has_field?("opp11")
      select("Contacted", :from => "opp11")
      puts "value for stage field is selected"
    else
      puts "stage field is not available"
    end
    sleep 2
    if page.has_field?("opp9")
      fill_in("opp9",:with => "5/17/2017")
      puts "value for close date field is entered"
    else
      puts "close date field is not available"
    end
  end
  if page.has_field?("Opportunity Type")
    select("Enterprise", :from => "Opportunity Type")
    puts "value for Opportunity Type field is selected"
  else
    puts "Opportunity Type field is not available"
  end
  if page.has_field?("Business Line")
    select("Core", :from => "Business Line")
    puts "value for Business Line field is selected"
  else
    puts "Business Line field is not available"
  end
#  if page.has_field?("00N4100000E1rEb")
#    select("Direct", :from => "00N4100000E1rEb")
#    puts "value for direct channel field is selected"
#  else
#    puts "direct channel field is not available"
#  end
  if page.has_field?("Client Territory")
    select("BEIJING", :from => "Client Territory")
    puts "value for Client Territory field is selected"
  else
    puts "Client Territory field is not available"
  end
  if page.has_field?("Client Region")
    select("ANZ", :from => "Client Region")
    puts "value for Client Region field is selected"
  else
    puts "Client Region field is not available"
  end
  if page.has_field?("Direct/Channel")
    select("Direct", :from => "Direct/Channel")
    puts "value for direct channel field is selected"
  else
    puts "direct channel field is not available"
  end
  if page.has_field?("Country")
    select("United States", :from => "Country")
    puts "value for Country field is selected"
  else
    puts "Country field is not available"
  end
  if page.has_field?("SSI Theatre")
    select("NALA", :from => "SSI Theatre")
    puts "value for SSI Theatre field is selected"
  else
    puts "SSI Theatre field is not available"
  end
#  if page.has_field?("Engagement Type")
#    select("SREV", :from => "Engagement Type")
#    puts "value for Engagement Type field is selected"
#  else
#    puts "Engagement Type field is not available"
#  end
#  if page.has_field?("opp16")
#    select("USD - U.S. Dollar", :from => "opp16")
#    puts "value for Opportunity Currency field is selected"
#  else
#    puts "Opportunity Currency field is not available"
#  end
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-accounts-")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)

  sleep 3
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Price Book Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "standard")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

Given(/^I enter value to all the mandatory field under new account section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $account_name = "Smoke_test_accounts_"+ Random.new.rand(1..20000).to_s
    fill_in "acc2",:with => $account_name
    puts $account_name
    puts "account name is: #{$account_name}"
  end
  if page.has_field?("Account Currency")
    select("USD - U.S. Dollar", :from => "Account Currency")
    puts "value for Account Currency is selected"
  else
    writeFailure "Account Currency field is not available"
  end
end

Then(/^I click on the just created account name$/) do
  within('.pbHelp') do
    sleep 2
    select("Recently Created", :from => "hotlist_mode")
    puts "Recently created accounts are selected"
  end
  within('.pbBody') do
    sleep 2
    find_link($account_name).click
    puts "#{$account_name} is selected"
  end
end

Then(/^I note the contact name created above$/) do
  within all('.pbSubsection')[0] do
    table= all("tbody")[0]
    $contact_name = all('tr')[0].all('td')[1].all('div')[0].text
    puts $contact_name
  end
end

And(/^I enter data to reqired fields under new location address section$/) do
  if page.has_field?("Location Address Name")
    $location_address = "Smoke_test_"+ Random.new.rand(100..30000).to_s
    fill_in("Location Address Name",:with=> $location_address)
    puts "Location Address Name field is available"
  else
    writeFailure "Location Address Name field is not available"
  end
end

And(/^I enter data to reqired fields under new product section$/) do
  if page.has_field?("Name")
    $product_name = "smoke_test_product_"+ Random.new.rand(1..30000).to_s
    fill_in("Name", :with=> $product_name)
  end
  if page.has_field?("Product Currency")
    select("USD - U.S. Dollar", :from => "Product Currency")
    puts "value for Product Currency is selected"
  end
  if page.has_field?("IsActive")
    find(:id, "IsActive").click
    puts "Active checkbox is checked"
  end
end

Then(/^I clik on "([^"]*)" button under standard price$/) do |arg1|
  sleep 3
   within all('.pbHeader')[1] do
    click_on arg1
    sleep 2
  end
end

And(/^I enter value to standard price$/) do
  sleep 2
  if page.has_xpath?(".//td[contains(text(), 'USD - U.S. Dollar')]/following-sibling::td/input[@title='Unit Price']")
    find(:xpath, ".//td[contains(text(), 'USD - U.S. Dollar')]/following-sibling::td/input[@title='Unit Price']").set("10")
  end
  sleep 2
end

And(/^I click on save button under add standard price$/) do
  sleep 2
  click_on("Save", match: :first)
end


Given(/^I navigate to "([^"]*)" tab in the salesforce application$/) do |tab|
  step 'I enter the credentials to the Zenith application'
  sleep 10
  if page.has_xpath?('//li/a[text()="'"#{tab}"'"]')
    find(:xpath, '//li/a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  elsif page.has_xpath?('//img[@title="All Tabs"]')
    find(:xpath, '//img[@title="All Tabs"]').click
    sleep 3
    find(:xpath, '//a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  else
    writeFailure "Fail to find tab - #{tab} -"
    #fail(ArgumentError.new('Fail to find tab - '+ tab))
  end
  sleep 10
end

When(/^I should create new account record "([^"]*)" as test data$/) do |account_name|
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set account_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('//div[contains(@class,"accountBlock")]//a[text()="'"#{account_name}"'"]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'Navigate to "Accounts" tab'
    step 'I click "New" button'

    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set account_name
      puts "Enter - #{$account_name} - in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end
    if page.has_xpath?('//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input').set "1234"
      puts "Enter - 1234 - in account Number field"
    else
      writeFailure "Fail to enter - 1234 - in account Number field "
    end
    if page.has_xpath?('//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select').select "USD - U.S. Dollar"
      puts "The option -- USD - U.S. Dollar -- is selected from -- Account Currency -- dropdown"
    end

    step 'I click Save button from top button row'
    step 'The "Account" record should save seccessfully'
    step 'I selected "Logout" from user menu'

  end
end

When(/^I should create new opportunity record "([^"]*)" as test data$/) do |opportunity_name|
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set opportunity_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('//div[contains(@class,"opportunityBlock")]')
    within(:xpath, '//div[contains(@class,"opportunityBlock")]')do
      #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
      if page.has_xpath?('//a[text()="'"#{opportunity_name}"'"]')
        sleep 1
        flag=0
      end
    end
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'Navigate to "Opportunities" tab'
    step 'I click "New" button'
    #step 'I select "Opportunity - Edit" from "Record Type of new record" dropdown'
    step 'I clicked "Continue" button over the page'
    if page.has_xpath?('//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input').set opportunity_name
      puts "Entered -- opportunity_name -- in Opportunity name field"
    else
      writeFailure "Fail to enter data in - Opportunity Name - field "
    end
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke_test_accounts_cases"
      puts "Entered -- Smoke_test_accounts_avi -- in Account Name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end

    if page.has_xpath?('//label[text()="Renewal Target"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Renewal Target"]/parent::td[1]/following-sibling::td[1]//input').set "1"
      puts "Entered -- 1 -- in Renewal Target field"
      #    else
      #      writeFailure "Fail to enter data in - Renewal Target - field "
    end

    if page.has_xpath?('//label[text()="Amount"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Amount"]/parent::td[1]/following-sibling::td[1]//input').set "1"
      puts "Entered -- 1 -- in Amount field"
    else
      writeFailure "Fail to enter data in - Amount - field "
    end

    if page.has_xpath?('//label[text()="Close Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
      find(:xpath, '//label[text()="Close Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
      puts "Entered current date in field -- Close Date"
      sleep 5
    else
      writeFailure "Fail to enter date in field - Close Date -"
      #fail(ArgumentError.new('Fail'))
    end

    if page.has_xpath?('//label[text()="Business Line"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Business Line"]/parent::td[1]/following-sibling::td[1]//select').select "Renewals Team"
      puts "Entered -- Core -- in -- Business Line -- field"
    else
      writeFailure "Fail to enter data in -- Business Line -- field "
    end

    if page.has_xpath?('//label[text()="Direct/Channel"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Direct/Channel"]/parent::td[1]/following-sibling::td[1]//select').select "Direct"
      puts "Entered -- Direct -- in -- Direct/Channel -- field"
    else
      writeFailure "Fail to enter data in -- Direct/Channel -- field "
    end

    if page.has_xpath?('//label[text()="Price Book"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Price Book"]/parent::td[1]/following-sibling::td[1]//input').set "Standard Price Book"
      puts "Entered -- Standard Price Book -- in -- Price Book -- field"
    else
      writeFailure "Fail to enter data in -- Price Book -- field "
    end

    if page.has_xpath?('//label[text()="Opportunity Type"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Opportunity Type"]/parent::td[1]/following-sibling::td[1]//select').select "Enterprise"
      puts "Entered -- Enterprise -- in -- Opportunity Type -- field"
    else
      writeFailure "Fail to enter data in -- Opportunity Type -- field "
    end

    if page.has_xpath?('//label[text()="Client Territory"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Client Territory"]/parent::td[1]/following-sibling::td[1]//select').select "ANZ"
      puts "Entered -- Central -- in -- Client Territory -- field"
    else
      writeFailure "Fail to enter data in -- Client Territory -- field "
    end
    if page.has_xpath?('//label[text()="Stage"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Stage"]/parent::td[1]/following-sibling::td[1]//select').select "Contacted"
      puts "Entered -- Contacted -- in -- Stage -- field"
    else
      writeFailure "Fail to enter data in -- Stage -- field "
    end
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "APAC"
      puts "Entered -- NALA -- in -- Client Region -- field"
    else
      writeFailure "Fail to enter data in -- Client Region -- field "
    end
    if page.has_xpath?('//label[text()="Country"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Country"]/parent::td[1]/following-sibling::td[1]//select').select "American Samoa"
      puts "Entered -- American Samoa -- in -- Country -- field"
    else
      writeFailure "Fail to enter data in -- Country -- field "
    end
    if page.has_xpath?('//label[text()="SSI Theatre"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="SSI Theatre"]/parent::td[1]/following-sibling::td[1]//select').select "APJ"
      puts "Entered -- APJ -- in -- SSI Theatre -- field"
    else
      writeFailure "Fail to enter data in -- SSI Theatre -- field "
    end
    step 'I click Save button from top button row'
    step 'The "Opportunity" record should save seccessfully'
    step 'I selected "Logout" from user menu'
  end

end

When(/^I should create new contact record "([^"]*)" as test data$/) do |contact_name|
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set contact_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('//div[contains(@class,"contactBlock")]')
    within(:xpath, '//div[contains(@class,"contactBlock")]')do
      #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
      if page.has_xpath?('//a[text()="'"#{contact_name}"'"]')
        sleep 1
        flag=0
      end
    end
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'Navigate to "Contacts" tab'
    step 'I click "New" button'

    #$last_name = "Smoke_test_contacts_Avi"
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke_test_accounts_cases"
      puts "Entered -- Smoke_test_accounts_avi -- in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end
    if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set contact_name
      puts "Entered -- #{contact_name} -- in last name field"
    else
      writeFailure "Fail to enter data in last name field"
    end
    step 'I click Save button from top button row'
    step 'The "Contacts" record should save seccessfully'
    step 'I selected "Logout" from user menu'
  end

  #  if page.has_xpath?('//label[text()="First Name"]/parent::td[1]/following-sibling::td[1]//input')
  #    find(:xpath, '//label[text()="First Name"]/parent::td[1]/following-sibling::td[1]//input').set $fist_name
  #    puts "Entered -- #{$fist_name} -- in First Name field"
  #  else
  #    writeFailure "Fail to enter data in First Name field"
  #  end
end

Given(/^I enter value to all the mandatory field over Location Address edit page$/) do
  $lastName = "Smoke_test_Location_Address_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Location Address Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Location Address Name"]/parent::td[1]/following-sibling::td[1]//input').set $lastName
    puts "Entered data - #{$lastName} - in - Location Address Name - field"
  else
    writeFailure "Fail to enter data in - Location Address Name - field "
  end
#  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
#    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke_test_accounts_cases"
#    puts "Enter data in Account Name"
#  else
#    writeFailure "Fail to enter data in - Account Name - field "
#  end
end

Given(/^I enter value to all the mandatory field over new account page$/) do
  $account_name = "Smoke_test_accounts_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set $account_name
    puts "New account record - #{$account_name} is created"
  else
    writeFailure "Fail to enter data in - Account Name - field "
  end
  if page.has_xpath?('//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input').set "123"
    puts "Enter - 1234 - in Account Number field"
    #  else
    #    writeFailure "Fail to enter data in - Account Number - field "
  end
  if page.has_xpath?('//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select').select "USD - U.S. Dollar"
    puts "The option -- USD - U.S. Dollar -- is selected from -- Account Currency -- dropdown"
  end
end