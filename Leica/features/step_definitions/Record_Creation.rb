#  Code to create new opportunity
When(/^I should create new opportunity record "([^"]*)" as test data$/) do |opportunity_name|
  sleep 5
  Capybara.default_wait_time = 3
  flag=0
  step 'I login as BA'
  find(:xpath, '//input[@title="Search..."]').set opportunity_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  
  if page.has_xpath?('(//a[text()="'"#{opportunity_name}"'"])[1]')
    flag=0
  else
    if page.has_xpath?('(//a[text()="Search All"])[1]')
      find(:xpath, '(//a[text()="Search All"])[1]').click
      sleep 5      
    end
    if page.has_xpath?('(//a[text()="'"#{opportunity_name}"'"])[1]')
      flag=0
    elsif page.has_xpath?('//div[text()="No matches found"]') or page.has_xpath?('(//a[text()="'"#{opportunity_name}"'"])[1]')==false
      flag=1
    end
  end


  if flag==1

    step 'I navigate to "Opportunities" tab in the application'
    step 'I click "New" button'
    step 'I click "Continue" button'


    if page.has_xpath?('//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input').set opportunity_name
      puts "Entered -- opportunity_name -- in Opportunity name field"
    else
      writeFailure "Fail to enter data in - Opportunity Name - field "
    end


    step 'I create new "Opportunity"'

    step 'I click Save button from top button row'
    step 'The "Opportunity" record should save seccessfully'
    step 'I selected "Logout" from user menu'
  end
  Capybara.default_wait_time = 30
end

#  Code to create new opportunity
When(/^I should create new opportunity record with random number$/) do
  sleep 5
  Capybara.default_wait_time = 3
  $Opportunity_name = "Smoke_test_Opportunity_"+ Random.new.rand(1..20000).to_s
  puts $Opportunity_name
  flag=0
  step 'I login as BA'
  step 'I navigate to "Opportunities" tab in the application'
  step 'I click "New" button'
  step 'I click "Continue" button'

  if page.has_xpath?('//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input').set $Opportunity_name
    puts "Entered -- opportunity_name -- in Opportunity name field"
  else
    writeFailure "Fail to enter data in - Opportunity Name - field "
  end

  step 'I create new "Opportunity"'

  step 'I click Save button from top button row'
  step 'The "Opportunity" record should save seccessfully'
  step 'I selected "Logout" from user menu'
  Capybara.default_wait_time = 30
end



#Code to create new Account

When(/^I should create new account record "([^"]*)" as test data$/) do |account_name|
  sleep 5
  Capybara.default_wait_time = 3
  flag=0
  Capybara.default_wait_time = 10
  step 'I login as BA'
  find(:xpath, '//input[@title="Search..."]').set account_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('(//a[text()="'"#{account_name}"'"])[1]')
    flag=0
  else
    if page.has_xpath?('(//a[text()="Search All"])[1]')
      find(:xpath, '(//a[text()="Search All"])[1]').click
      sleep 5
    end
    if page.has_xpath?('(//a[text()="'"#{account_name}"'"])[1]')
      flag=0
    elsif page.has_xpath?('//div[text()="No matches found"]') or page.has_xpath?('(//a[text()="'"#{account_name}"'"])[1]')==false
      flag=1
    end
  end


  if flag==1
    step 'I navigate to "Accounts" tab in the application'
    step 'I click "New" button'

    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set account_name
      puts "Enter - #{$account_name} - in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end

    step 'I create new "Account"'

    step 'I click Save button from top button row'
    step 'The "Account" record should save seccessfully'
    step 'I selected "Logout" from user menu'

  end
  Capybara.default_wait_time = 30
end

When(/^I should create new asset record "([^"]*)" as test data$/) do |asset_name|
  sleep 5
  Capybara.default_wait_time = 3
  flag=0
  step 'I login as BA'
  find(:xpath, '//input[@title="Search..."]').set asset_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('(//a[text()="'"#{asset_name}"'"])[1]')
    flag=0
  else
    if page.has_xpath?('(//a[text()="Search All"])[1]')
      find(:xpath, '(//a[text()="Search All"])[1]').click
      sleep 5
    end
    if page.has_xpath?('(//a[text()="'"#{asset_name}"'"])[1]')
      flag=0
    elsif page.has_xpath?('//div[text()="No matches found"]') or page.has_xpath?('(//a[text()="'"#{asset_name}"'"])[1]')==false
      flag=1
    end
  end


  if flag==1
    step 'I navigate to "Assets" tab in the application'
    step 'I click "New" button'

    if page.has_xpath?('//label[text()="Asset Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Asset Name"]/parent::td[1]/following-sibling::td[1]//input').set asset_name
      puts "Enter - #{asset_name} - in account name field"
    else
      writeFailure "Fail to enter data in - Asset Name - field "
    end

    step 'I create new "Assets"'

    step 'I click Save button from top button row'
    step 'The "Assets" record should save seccessfully'
    step 'I selected "Logout" from user menu'

  end
  Capybara.default_wait_time = 30
end

#I enter data in all the required field over new contact page

When(/^I enter data in all the required field over new contact page$/) do 
  sleep 5
  $Contact_name = "Smoke_test_Contact_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set $Contact_name
    puts "Entered -- #{$Contact_name} -- in last name field"
  else
    writeFailure "Fail to enter data in last name field"
  end

  step 'I create new "Contacts"'  

Capybara.default_wait_time = 30
end

#Create new Contact

When(/^I should create new contact record "([^"]*)" as test data$/) do |contact_name|
sleep 5
Capybara.default_wait_time = 3
flag=0
step 'I login as BA'
find(:xpath, '//input[@title="Search..."]').set contact_name
sleep 5
find(:xpath, '//input[@value="Search"]').click
sleep 10

if page.has_xpath?('(//a[text()="'"#{contact_name}"'"])[1]')
  flag=0
else
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  if page.has_xpath?('(//a[text()="'"#{contact_name}"'"])[1]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]') or page.has_xpath?('(//a[text()="'"#{contact_name}"'"])[1]')==false
    flag=1
  end
end

if flag==1
  step 'I navigate to "Contacts" tab in the application'
  step 'I click "New" button'


  if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set contact_name
    puts "Entered -- #{contact_name} -- in last name field"
  else
    writeFailure "Fail to enter data in last name field"
  end

  step 'I create new "Contacts"'

  step 'I click Save button from top button row'
  step 'The "Contacts" record should save seccessfully'
  step 'I selected "Logout" from user menu'
end
Capybara.default_wait_time = 30
end


When(/^I enter data in all the required fields over Account edit page$/) do
sleep 10
$Account_name = "Smoke_test_Account_"+ Random.new.rand(1..20000).to_s

if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
  find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set $Account_name
  puts "Entered -- #{$Account_name} -- in Account Name field"
else
  writeFailure "Fail to enter data in - Account Name - field"
end
end

When(/^I enter data in all the required fields over Service Contracts edit page$/) do
sleep 10


$service_Contracts = "Smoke_test_ServiceContract_Avi_"+ Random.new.rand(1..20000).to_s

if page.has_xpath?('//label[text()="F5 Contract Number"]/parent::td[1]/following-sibling::td[1]//input')
  find(:xpath, '//label[text()="F5 Contract Number"]/parent::td[1]/following-sibling::td[1]//input').set $service_Contracts
  puts "Entered -- #{$service_Contracts} -- in -F5 Contract Number- field"
else
  writeFailure "Fail to enter data in - F5 Contract Number - field"
end

step 'I create new "Service Contracts"'

end


When(/^I enter data to all the mandatory fields for "([^"]*)" task type$/) do |task_type|
sleep 20

$task = "Smoke_test_subject_Avi_"+ Random.new.rand(1..20000).to_s

if page.has_xpath?('//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input')
  find(:xpath, '//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input').set $task
  puts "Entered -- #{$task} -- in -Subject- field"
else
  writeFailure "Fail to enter data in - Subject - field"
end


case task_type
when "Task - Standard"
  step 'I create new "Task - Standard"'
when "Task - Email"
  step 'I create new "Task - Email"'
when "Task - Fax"
  step 'I create new "Task - Fax"'
when "Task - Phone Calls"
  step 'I create new "Task - Phone Calls"'
when "Task - Health Check"
  step 'I create new "Task - Health Check"'
else
  writeFailure "The cases type - #{task_type} - is not defiend"
end

end



When(/^I should create new product record "([^"]*)" as test data$/) do |record_Name|
sleep 5
Capybara.default_wait_time = 3
$prod_name=record_Name

step 'I login as BA'

find(:xpath, '//input[@title="Search..."]').set record_Name
sleep 5
find(:xpath, '//input[@value="Search"]').click
sleep 10

if page.has_xpath?('(//a[text()="'"#{record_Name}"'"])[1]')
  flag=0
else
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  if page.has_xpath?('(//a[text()="'"#{record_Name}"'"])[1]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]') or page.has_xpath?('(//a[text()="'"#{record_Name}"'"])[1]')==false
    flag=1
  end
end

if flag==1
  step 'I navigate to "Products" tab in the application'
  step 'I click "New" button'
  if page.has_xpath?('//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input')
    find(:xpath, '//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input').set record_Name
    puts "Entered -- #{$prod_name}  -- in product name field"
  else
    writeFailure "Fail to enter data in - product Name - field "
  end

  if page.has_xpath?('//label[text()="Active"]/parent::td[1]/following-sibling::td[1]/input')
    find(:xpath, '//label[text()="Active"]/parent::td[1]/following-sibling::td[1]/input').set(true)
    puts "Check the checkbox -- Active"
  else
    writeFailure "Fail to check the checkbox -- Active "
  end

  step 'I click Save button from top button row'
  step 'The "Product" record should save seccessfully'
  step 'I click "Add" button'
  if page.has_xpath?('//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input')
    find(:xpath, '//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input').set "1"
    puts "Data has been entered into --  USD - U.S. Dollar  --  field"
  else
    writeFailure "Fail to enter data in -- USD - U.S. Dollar -- field "
  end
  if page.has_xpath?('(//input[@title="Save"])[1]')
    find(:xpath, '(//input[@title="Save"])[1]').click
    puts "- Save -  button has been clicked"
  else
    writeFailure "Fail to click - Save - button "
  end

end

step 'I selected "Logout" from user menu'
Capybara.default_wait_time = 30
end

When(/^I should create new product record to test multi currency$/) do
sleep 5
Capybara.default_wait_time = 3
step 'I login as BA'
step 'I navigate to "Products" tab in the application'
step 'I click "New" button'

$prod_name = "Smoke_test_prod_"+ Random.new.rand(1..20000).to_s
if page.has_xpath?('//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input')
  find(:xpath, '//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input').set $prod_name
  puts "Entered -- #{$prod_name}  -- in product name field"
else
  writeFailure "Fail to enter data in - product Name - field "
end

if page.has_xpath?('//label[text()="Active"]/parent::td[1]/following-sibling::td[1]/input')
  find(:xpath, '//label[text()="Active"]/parent::td[1]/following-sibling::td[1]/input').set(true)
  puts "Check the checkbox -- Active"
else
  writeFailure "Fail to check the checkbox -- Active "
end

step 'I click Save button from top button row'
step 'The "Product" record should save seccessfully'
step 'I click "Add" button'
if page.has_xpath?('//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input')
  find(:xpath, '//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input').set "1"
  puts "Data has been entered into --  USD - U.S. Dollar  --  field"
else
  writeFailure "Fail to enter data in -- USD - U.S. Dollar -- field "
end
if page.has_xpath?('(//input[@title="Save"])[1]')
  find(:xpath, '(//input[@title="Save"])[1]').click
  puts "- Save -  button has been clicked"
else
  writeFailure "Fail to click - Save - button "
end

step 'I selected "Logout" from user menu'
Capybara.default_wait_time = 30
end

When(/^I should enter data in all the required fields over quote detail page$/) do
sleep 5
Capybara.default_wait_time = 3
$quoteName="Smoke_test_Quotename_"+Random.new.rand(111..9999).to_s

if page.has_xpath?('//label[text()="Quote Name"]/parent::td[1]/following-sibling::td[1]//input')
  find(:xpath, '//label[text()="Quote Name"]/parent::td[1]/following-sibling::td[1]//input').set $quoteName
  puts "Entered -- #{$quoteName} -- in Quote Name field"
else
  writeFailure "Fail to enter data in - Quote Name - field "
end

if page.has_xpath?('//label[text()="Quote Type"]/parent::td[1]/following-sibling::td[1]//select')
  find(:xpath, '//label[text()="Quote Type"]/parent::td[1]/following-sibling::td[1]//select').select "Direct"
  puts "Entered -- Direct -- in -- Quote Type -- field"
else
  writeFailure "Fail to enter data in -- Quote Type -- field "
end

if page.has_xpath?('//label[text()="Quote Type Year"]/parent::td[1]/following-sibling::td[1]//select')
  find(:xpath, '//label[text()="Quote Type Year"]/parent::td[1]/following-sibling::td[1]//select').select "1"
  puts "Entered -- 1 -- in -- Quote Type Year -- field"
else
  writeFailure "Fail to enter data in -- Quote Type Year -- field "
end
Capybara.default_wait_time = 30
end


When(/^I create new "([^"]*)"$/) do |entity_name|
sleep 5
Capybara.default_wait_time =10
temp=[]
field_With_Permission=[]
puts entity_name
arg=getDataFrom_DataCreation_YmlFile entity_name
field_With_Permission=arg["Field_Name_Array"]
puts field_With_Permission
field_With_Permission.each do |field|
  temp=arg[field]
  # puts "temp"
  puts temp
  field_type=temp[0]
  case field_type
  when "text"

    Capybara.default_wait_time =1
    if page.has_xpath?('//label[text()="'"#{temp[1]}"'"]/ancestor::td[1]/following-sibling::td[1]//input')
      puts "The data - #{temp[2]} - has been entered in - #{temp[1]} - field"
      find(:xpath, '//label[text()="'"#{temp[1]}"'"]/ancestor::td[1]/following-sibling::td[1]//input').set temp[2]
      puts "The data - #{temp[2]} - has been entered in - #{temp[1]} - field"
      sleep 5
    else
      writeFailure "Fail to enter data in field - #{temp[1]} -"
      #fail(ArgumentError.new('Fail'))
    end
    Capybara.default_wait_time =30
  when "lookup"

    if page.has_xpath?('//label[text()="'"#{temp[1]}"'"]/parent::td[1]/following-sibling::td[1]//img[@class="lookupIcon"]')
      main = page.driver.browser.window_handles.first
      find(:xpath, '//label[text()="'"#{temp[1]}"'"]/parent::td[1]/following-sibling::td[1]//img[@class="lookupIcon"]').click
      sleep 5
      popup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.window(popup)
      within_frame('searchFrame')do
        find(:xpath, '//input[@name="lksrch"]').set temp[2]
        click_button('Go!')
        sleep 5
      end
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        table=all("tbody")[0]
        table.all("tr")[1].all("th")[0].find('a').click
        puts "The record - #{temp[2]} - has been selected"
      end
      page.driver.browser.switch_to.window(main)
      sleep 5
    else
      writeFailure "Fail -#{temp[1]}- Name field is present with R Only permission "
    end


  when "picklist"
    Capybara.default_wait_time =1
    if page.has_xpath?('//label[text()="'"#{temp[1]}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{temp[2]}"'"]')
      find(:xpath, '//label[text()="'"#{temp[1]}"'"]/ancestor::td[1]/following-sibling::td[1]//select').select temp[2]
      puts "The option - #{temp[2]} - is selected from - #{temp[1]} - dropdown"
    else
      if page.has_xpath?('(//label[text()="'"#{temp[1]}"'"]/ancestor::td[1]/following-sibling::td[1]//select)[1]')
        writeFailure "The option - #{temp[2]} - is NOT present under - #{temp[1]} - dropdown"
        #fail(ArgumentError.new('Fail'))
      else
        if page.has_xpath?('//td[text()="'"#{temp[1]}"'"]')
          writeFailure "The DROPDOWN - #{temp[1]} - is present over the page with - READ ONLY - permission"
          #fail(ArgumentError.new('Fail'))
        elsif page.has_xpath?('//label[text()="'"#{temp[1]}"'"]')
          writeFailure "The DROPDOWN - #{temp[1]} - is present over the page with - READ ONLY - permission"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "The DROPDOWN - #{temp[1]} - is NOT present over the page"
          #fail(ArgumentError.new('Fail'))
        end
      end
    end
    Capybara.default_wait_time =30
  when "date"
    Capybara.default_wait_time =1
    if page.has_xpath?('//label[text()="'"#{temp[1]}"'"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
      find(:xpath, '//label[text()="'"#{temp[1]}"'"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
      puts "The date has been entered in the field #{temp[1]}"
      sleep 5
    else
      writeFailure "Fail to find field - #{temp[1]} -"
      #fail(ArgumentError.new('Fail'))
    end
    Capybara.default_wait_time =30

  when "textarea"
    if page.has_xpath?('//label[text()="'"#{temp[1]}"'"]/ancestor::td[1]/following-sibling::td[1]//textarea[@type="text"]')
      find(:xpath, '//label[text()="'"#{temp[1]}"'"]/ancestor::td[1]/following-sibling::td[1]//textarea[@type="text"]').set temp[2]
      puts "The data - #{temp[2]} - has been entered in the field - #{temp[1]}"
    else
      writeFailure "FAIL to enter data in - #{temp[1]} - field"
    end
  else
    puts "The field type - #{temp[0]} - is not defiend"
  end

end
Capybara.default_wait_time = 30
end

def getDataFrom_DataCreation_YmlFile(yamlInfo)
yamlinput = "./config/DataCreation.yml"
myoptions = YAML.load_file(yamlinput)
myoptions[yamlInfo]
end

