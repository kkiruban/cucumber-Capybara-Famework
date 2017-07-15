require 'win32ole'
When(/^I click on "([^"]*)" button under currency$/) do |arg1|
  within('.lbBodyDescription') do
    sleep 2
    click_on "Manage Currencies"
    sleep 2
  end
end

When(/^I check that "([^"]*)" currency code is available$/) do |currency_code|
  within('.pbBody') do
    if page.has_content?(currency_code)
      puts "#{currency_code} is available"
    else
      writeFailure "#{currency_code} is not available"
    end
  end
end

Then(/^I check that "([^"]*)" is visible$/) do |val|
   within('.pbBody') do
    if page.has_content?(val)
      puts "#{val} is visible"
    else
      writeFailure "#{val} is not visible"
    end
  end
end

Then(/^I verify the Business Hours details$/) do
  expected_time_zone = "(GMT-05:00) Central Daylight Time (America/Chicago)".to_s
  within('.pbSubsection') do
    table = all("tbody")[0]
    sleep 2
		actual_time_zone = table.all('tr')[0].all('td')[3].text.to_s
    puts "Expectes Time Zone: #{expected_time_zone}"
    puts "Actual Time Zone: #{actual_time_zone}"
    if expected_time_zone == actual_time_zone
      puts "Expectes Time Zone value and Actual Time Zone value are equal"
      puts "Time Zone is verified"
    else
      writeFailure "Expectes Time Zone value and Actual Time Zone value are not equal"
    end

    expected_sunday_value = "No Hours"
    actual_sunday_value = table.all('tr')[1].all('td')[1].all('tr')[0].all('td')[1].text
    puts "Expected sunday value: #{expected_sunday_value}"
    puts "Actual sunday value: #{actual_sunday_value}"
    if expected_sunday_value == actual_sunday_value
      puts "Expectes Business Hours for Sunday and Actual Business Hours for Sunday are equal"
      puts "Business Hours for Sunday is verified"
    else
      writeFailure "Expectes Business Hours for Sunday and Actual Business Hours for Sunday are not equal"
    end

    expected_monday_value = "8:00 AM to 12:00 AM".to_s
    actual_monday_value_1 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[1].text.to_s
    actual_monday_value_2 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[2].text.to_s
    actual_monday_value_3 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[3].text.to_s
#    puts actual_monday_value_1
#    puts actual_monday_value_2
#    puts actual_monday_value_3
    actual_monday_value = actual_monday_value_1 + " " + actual_monday_value_2+ " " + actual_monday_value_3
    actual_monday_value = actual_monday_value.to_s
    puts "Expected monday value: #{expected_monday_value}"
    puts "Actual monday value: #{actual_monday_value}"
    if expected_monday_value == actual_monday_value
      puts "Expectes Business Hours for Monday and Actual Business Hours for Monday are equal"
      puts "Business Hours for Monday is verified"
    else
      writeFailure "Expectes Business Hours for Monday and Actual Business Hours for Monday are not equal"
    end

    expected_tuesday_value = "24 Hours"
    actual_tuesday_value = table.all('tr')[1].all('td')[1].all('tr')[2].all('td')[1].text.to_s
    puts "Expected tuesday value: #{expected_tuesday_value}"
    puts "Actual tuesday value: #{actual_tuesday_value}"
    if expected_tuesday_value == actual_tuesday_value
      puts "Expectes Business Hours for Tuesday and Actual Business Hours for Tuesday are equal"
      puts "Business Hours for Tuesday is verified"
    else
      writeFailure "Expectes Business Hours for Tuesday and Actual Business Hours for Tuesday are not equal"
    end

    expected_wednesday_value = "24 Hours"
    actual_wednesday_value = table.all('tr')[1].all('td')[1].all('tr')[3].all('td')[1].text.to_s
    puts "Expected Wednesday value: #{expected_wednesday_value}"
    puts "Actual Wednesday value: #{actual_wednesday_value}"
    if expected_wednesday_value == actual_wednesday_value
      puts "Expectes Business Hours for Wednesday and Actual Business Hours for Wednesday are equal"
      puts "Business Hours for Wednesday is verified"
    else
      writeFailure "Expectes Business Hours for Wednesday and Actual Business Hours for Wednesday are not equal"
    end

    expected_thursday_value = "24 Hours"
    actual_thursday_value = table.all('tr')[1].all('td')[1].all('tr')[4].all('td')[1].text.to_s
    puts "Expected Thursday value: #{expected_thursday_value}"
    puts "Actual Thursday value: #{actual_thursday_value}"
    if expected_thursday_value == actual_thursday_value
      puts "Expectes Business Hours for Thursday and Actual Business Hours for Thursday are equal"
      puts "Business Hours for Thursday is verified"
    else
      writeFailure "Expectes Business Hours for Thursday and Actual Business Hours for Thursday are not equal"
    end

    expected_friday_value = "12:00 AM to 5:00 PM".to_s
    actual_friday_value_1 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[1].text.to_s
    actual_friday_value_2 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[2].text.to_s
    actual_friday_value_3 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[3].text.to_s
#    puts actual_friday_value_1
#    puts actual_friday_value_2
#    puts actual_friday_value_3
    actual_friday_value = actual_friday_value_1 + " " + actual_friday_value_2+ " " + actual_friday_value_3
    actual_friday_value = actual_friday_value.to_s
    puts "Expected monday value: #{expected_friday_value}"
    puts "Actual monday value: #{actual_friday_value}"
    if expected_friday_value == actual_friday_value
      puts "Expectes Business Hours for Friday and Actual Business Hours for Friday are equal"
      puts "Business Hours for Friday is verified"
    else
      writeFailure "Expectes Business Hours for Friday and Actual Business Hours for Friday are not equal"
    end

    expected_saturday_value = "No Hours"
    actual_saturday_value = table.all('tr')[1].all('td')[1].all('tr')[6].all('td')[1].text
    puts "Expected saturday value: #{expected_saturday_value}"
    puts "Actual saturday value: #{actual_saturday_value}"
    if expected_saturday_value == actual_saturday_value
      puts "Expectes Business Hours for Saturday and Actual Business Hours for Saturday are equal"
      puts "Business Hours for Saturday is verified"
    else
      writeFailure "Expectes Business Hours for Saturday and Actual Business Hours for Saturday are not equal"
    end
  end
end

Then(/^I should see year as "([^"]*)" start date as "([^"]*)" and end date as "([^"]*)"$/) do |year, startDate, endDate|
  sleep 5
  if page.has_xpath?('//a[text()="'"#{year}"'"]/ancestor::tr[1]//td[text()="'"#{startDate}"'"]/ancestor::tr[1]//td[text()="'"#{endDate}"'"]')
    puts "The year - #{year} - is appearing with start date as - #{startDate} - and end date as - #{endDate}"
  else
    writeFailure "FAIL - The year - #{year} - is NOT appearing with start date as - #{startDate} - and end date as - #{endDate}"
  end  
end

When(/^I expand Accounts link$/) do
  sleep 2
  page.find(:id, "Account_icon").click
  sleep 2
end

When(/^I expand Fields link$/) do
  sleep 2
  page.find(:id, "AccountFields_font").click
  sleep 2
end

Then(/^I verify implementation status reason history tracking$/) do
  within all('.pbBody')[1] do
    if page.has_xpath?('//td[contains(text(), "SSI_ZTH__Account_Picklist_2__c")]')
      puts "Implementation Status Reason is visible"
      if page.has_xpath?('//td[contains(text(), "SSI_ZTH__Account_Picklist_2__c")]/following-sibling::td[6]/img[@title="Checked"]')
        puts "Track History checkbox is checked for Implementation Status Reason"
      end
    end
  end
end

Then(/^I verify health status reason history tracking$/) do
   within all('.pbBody')[1] do
    if page.has_xpath?('//td[contains(text(), "SSI_ZTH__Account_Picklist_4__c ")]')
      puts "Health Status Reason is visible"
      if page.has_xpath?('//td[contains(text(), "SSI_ZTH__Account_Picklist_4__c ")]/following-sibling::td[6]/img[@title="Checked"]')
        puts "Track History checkbox is checked for Health Status Reason"
      end
    end
  end
end

Then(/^I verify business value history tracking$/) do
   within all('.pbBody')[1] do
    if page.has_xpath?('//td[contains(text(), "Business_Value__c ")]')
      puts "Business Value is visible"
      if page.has_xpath?('//td[contains(text(), "Business_Value__c ")]/following-sibling::td[6]/img[@title="Checked"]')
        puts "Track History checkbox is checked for Business Value"
      end
    end
  end
end

Then(/^I click on users link$/) do
  sleep 2
  page.find(:id, "ManageUsers_font").click
  sleep 2
end

Then(/^I verify users profile$/) do
 begin
   excelsheet = WIN32OLE.new('excel.application')
   wrkbook= excelsheet.Workbooks.Open("D:\\cucumber-projects\\McAfee\\mcafee\\McAfee_1P_Config_Workbook_v1.2.xlsx")
   wrksheet= wrkbook.Worksheets(15)
   wrksheet.Select
    sleep 3
    if page.has_css?(".fewerMore")
      within(".fewerMore") do
        if page.has_content?("more")
          click_on 'more'
          sleep 4
          puts "Successfully navigate to the all pagination page"
        end
      end
    end

    sleep 2
    within(".list") do
      if first("tbody").all(".dataRow").count > 0
        tr = first("tbody").all(".dataRow")
        $full_name = []
        sleep 3
        tr.each do |row|
          $full_name << row.first("th").first("a").text          
        end
#        puts $full_name
        sleep 2
        users_actions = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[1]/input')
        users_alias = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[2]/a')
        user_name = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[3]/a')
        user_role = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[6]/a')
        user_profile = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[8]/a')
        $active_users = []
        sleep 3
        users_actions.each_with_index do |user , i|
          $active_users << {
              'users_actions' => users_actions[i],
              'users_alias' => users_alias[i].text,
              'user_name' => user_name[i].text,
              'user_role' => user_role[i],
              'user_profile' => user_profile[i].text,
          }
        end
        $active_users
      else
        putstr "Failed to see the all users"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while reading the users information"
  end
end


And(/^I check that "([^"]*)" matches "([^"]*)" tab in config guid$/) do |user_profile, users|
    sleep 5
    counter = 0
    arg = getGeneralDetails 'AdminUsers'
    excel = WIN32OLE.new('Excel.Application')
    excel.visible = true
    dir_path = Dir.pwd.gsub('/','\\')
    file_path = "#{dir_path}#{arg["File_Path"]}"
    workbook = excel.Workbooks.Open(file_path)
    worksheet = workbook.WorkSheets(arg["SheetName"])
    worksheet.select

    i = arg["Start_Row"]
    Capybara.default_max_wait_time = 5

    for counter in i..worksheet.UsedRange.Rows.Count
#      puts "#{i} is i value"

      lastName = arg["LastName"]+i.to_s
#      puts "#{lastName} is arg[lastname]"
      lastName=worksheet.Range(lastName).Value
#      puts "#{lastName} is worksheet lastname"

      if lastName.nil?
        putstr "Last Name is not found under cell: #{arg["LastName"]+i.to_s}"
      else
        lastName=lastName.strip
#        puts "#{lastName} is lastname.strip value"
      end

      firstName=arg["FirstName"]+i.to_s
      firstName=worksheet.Range(firstName).Value

      if firstName.nil?
        putstr "First Name is not found under cell: #{arg["FirstName"]+i.to_s}"
      else
        firstName=firstName.strip
      end

      userName=arg["UserName"]+i.to_s
      userName=worksheet.Range(userName).Value

      if userName.nil?
        putstr "User Name is not found under cell: #{arg["UserName"]+i.to_s}"
      else
        userName=userName.strip
      end

      persona=arg["Persona"]+i.to_s
      persona=worksheet.Range(persona).Value

      if persona.nil? == false
        persona=persona.strip
      end

      profile=arg["Profile"]+i.to_s
      profile=worksheet.Range(profile).Value

      if profile.nil?
        putstr "Profile is not found under cell: #{arg["Profile"]+i.to_s}"
      else
        profile=profile.strip
      end

      excel_full_name = "#{lastName}, #{firstName}"


      if $full_name.include? excel_full_name
        puts "Successfully see the Full Name: #{excel_full_name}"
      else
        putstr "Failed to see the Full Name: #{excel_full_name}"
      end

      user_name = "#{userName}#{arg["UserRefer"]}"

      result = false
      $active_users.each do |product|
        if product['user_name'] == user_name
          result = true
          puts "Successfully see the User Name: #{user_name}"
#          unless profile.nil?
#            if product['profile'] == profile
#              puts "Successfully see the User Profile: #{profile}"
#            else
#              putstr "Failed to see the User Profile: #{profile}"
#            end
#          else
#            putstr "User Profile is not found under cell: #{arg["Profile"]+i.to_s}"
#          end
         end
       end
       putstr "Failed to see the User Name: #{user_name}" unless result
       sleep 3

      i=i+1
    end
    excel.Quit();
    sleep 3
#  rescue Exception => ex
#    putstr "Error occurred while verifying #{user_profile} the #{users} config data"
#  end
end

Given(/^I click on username in the top right corner then select setup$/) do
  sleep 4
  page.find(:id, "userNavLabel").click
  sleep 10
  within all('.mbrMenuItems')[0] do
    click_on 'Setup'
    sleep 2
  end
end


When(/^I click "([^"]*)" link$/) do |arg1|
  sleep 7
  click_on arg1
  sleep 2
end

When(/^I expand "([^"]*)" from administration setup$/) do |arg1|
  sleep 7
  click_on arg1
  sleep 2
end

When(/^I expand "([^"]*)" from app setup$/) do |arg1|
  sleep 3
  click_on arg1
  sleep 2
end

Given(/^I expand "([^"]*)" link under customize$/) do |arg1|
  sleep 4
  within all('.parent')[7] do
    sleep 4
#    puts "found link"
    find_link(arg1, :match => :prefer_exact).click
    puts "cliked on #{arg1}"
  end
end

When(/^I click on the "([^"]*)" link$/) do |arg1|
  sleep 4
  within('.pbBody') do
    if find_link(arg1, :match => :prefer_exact).visible?
      find_link(arg1, :match => :prefer_exact).click
    else
      writeFailure "#{arg1} link is not visible"
    end
  end
end

When(/^I check that currency shows USD and CAD$/) do
  within all('.pbBody')[0] do
    table = all("tbody")[0]
    sleep 2
		currency_code_1 = table.all('tr')[1].all('th')[0].text.to_s
#    puts currency_code_1
    if currency_code_1 == "CAD"
      puts "CAD is visible under Active Currencies"
    else
      writeFailure "CAD is not visible under Active Currencies"
    end
    currency_code_2 = table.all('tr')[2].all('th')[0].text.to_s
#    puts currency_code_2
    if currency_code_2 == "USD"
      puts "USD is visible under Active Currencies"
    else
      writeFailure "USD is not visible under Active Currencies"
    end
  end
end

 Then (/^I check the available currency code$/) do
 within all('.pbBody')[0] do
    table = all("tbody")[0]
    sleep 2
		currency_code_1 = table.all('tr')[1].all('th')[0].text.to_s
    if currency_code_1 == "CAD"
      puts "CAD is visible under Active Currencies"
    else
      writeFailure "CAD is not visible under Active Currencies"
    end
    currency_code_2 = table.all('tr')[2].all('th')[0].text.to_s
    if currency_code_2 == "EUR"
      puts "EUR is visible under Active Currencies"
    else
      writeFailure "EUR is not visible under Active Currencies"
    end
    currency_code_3 = table.all('tr')[3].all('th')[0].text.to_s
    if currency_code_3 == "GBP"
      puts "GBP is visible under Active Currencies"
    else
      writeFailure "GBP is not visible under Active Currencies"
    end
        currency_code_4 = table.all('tr')[4].all('th')[0].text.to_s
    if currency_code_4 == "UAH"
      puts "UAH is visible under Active Currencies"
    else
      writeFailure "UAH is not visible under Active Currencies"
    end
    currency_code_4 = table.all('tr')[5].all('th')[0].text.to_s
    if currency_code_4 == "USD"
      puts "USD is visible under Active Currencies"
    else
      writeFailure "USD is not visible under Active Currencies"
    end
  end
end

When(/^I click on all tabs$/) do
  sleep 3
  page.find(".allTabsArrow").click
  sleep 2
end

When(/^I click on proactive rules$/) do
  sleep 3
  within('.pbBody') do
    click_on "Proactive Rules"
  end
  sleep 2
end

When(/^I click on "([^"]*)"$/) do |arg1|
  within('.pbHelp') do
    sleep 2
    select("Recently Created", :from => "hotlist_mode")
    puts "Recently created opportunities are selected"
  end
  within('.pbBody') do
    sleep 2
    find_link(arg1).click
    puts "#{arg1} is clicked"
  end
end

When(/^I verify that proactive rule is not active$/) do
  sleep 3
  if page.has_xpath?('.//*[@id="j_id0:j_id1:ProRule:j_id8:j_id13"]/img[@title="Not Checked"]')
    puts " proactive rule is not active"
  else
     writeFailure " proactive rule is active"
 end
  sleep 2
end

When(/^I click on servicesource setup$/) do
  sleep 3
  within('.pbBody') do
    click_on("ServiceSource Setup", :match => :prefer_exact)
  sleep 2
  end
end

When(/^I click on mappings$/) do
  sleep 3
  if page.has_xpath?('//*[@id="AdminPageId:frmCustomerSuccessAdminId:REN_RenewalMappings"]')
    find(:xpath, '//*[@id="AdminPageId:frmCustomerSuccessAdminId:REN_RenewalMappings"]').click
    puts "clicked on mappings"
  else
    writeFailure "mappings link is not available"
  end
end

When(/^I clik on link "([^"]*)" under mappings$/) do |link_name|
 click_link(link_name)
end

When(/^I select "([^"]*)" under Choose a mapping to edit/) do |link_name|
  if page.has_field?("j_id0:j_id9:j_id49:j_id50:j_id83:j_id88:j_id89:ren_mappings")
    select(link_name, :from => "j_id0:j_id9:j_id49:j_id50:j_id83:j_id88:j_id89:ren_mappings")
    puts "value is selected"
    sleep 5
    within all('.pbSubsection')[0] do
      within all('.data2Col')[0] do
        click_on "Go"
      end
    end
  else
    writeFailure "link_name is not available"
  end
end

When(/^I should see "([^"]*)" as "([^"]*)" and Action as "([^"]*)" and Opportunity Product Line Field as "([^"]*)" and Renewal Relationship Field as "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  sleep 3
  if page.has_xpath?("//*[@id='j_id0:j_id9:j_id49:j_id50:j_id83:generateMappingComp:0:j_id94:j_id95:opportunityFieldMappingSec:oppFieldMappingTable:0:j_id109']/preceding-sibling::td[span[text()='Required Field']]/following-sibling::td[2][text()='Quantity']/following-sibling::td[1]/select/option[@selected='selected' and text()='Quantity']")
  puts "I can see #{arg1} as #{arg2} and Action as #{arg3} and Opportunity Product Line Field as #{arg4} and Renewal Relationship Field as #{arg5} "
  else
    writeFailure "I cannot see #{arg1} as #{arg2} and Action as #{arg3} and Opportunity Product Line Field as #{arg4} and Renewal Relationship Field as #{arg5}"
  end
end

When(/^I check Opportunity Product Line fields based on Renewal Line Items$/) do
  sleep3
    if page.has_xpath?("//span[text() = 'Quantity']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Quantity, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[1][text() = 'Quantity']")
       puts "Internal name is Quantity, Opportunity Product Line Field field is Quantity"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Quantity']")
        puts "Internal name is Quantity, Renewal Relationship Field is Quantity"
    else
      writeFailure "Internal name and Renewal Relationship Field is not correct"
    end
end

When(/^I check that Opportunity and Opportunity Line Item fields are updated by the Quote and Quote Line Item fields$/) do
  sleep 3
  within all('.pbSubsection')[1] do
    if page.has_xpath?("//span[text() = 'Description']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Description, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[1][text() = 'Description']")
       puts "Internal name is Description, opportunity field is Description"
    else
      writeFailure "Internal name and opportunity field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Description']")
        puts "Internal name is Description, Quote field is Description"
    else
      writeFailure "Internal name and Quote field is not correct"
    end
  end

  within all('.pbSubsection')[2] do
    if page.has_xpath?("//span[text() = 'ServiceSource1__REN_Start_Date__c']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceSource1__REN_Start_Date__c, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSource1__REN_Start_Date__c']]/following-sibling::td[1][text() = 'Start Date']")
       puts "Internal name is ServiceSource1__REN_Start_Date__c, Opportunity Product Line Field field is Start Date"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSource1__REN_Start_Date__c']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Start Date']")
        puts "Internal name is ServiceSource1__REN_Start_Date__c, Quote Product Line Field is Start Date"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    

    if page.has_xpath?("//span[text() = 'ServiceDate']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceDate, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceDate']]/following-sibling::td[1][text() = 'Date']")
       puts "Internal name is ServiceDate, Opportunity Product Line Field field isDate"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceDate']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Date']")
        puts "Internal name is ServiceDate, Quote Product Line Field is Date"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end


    if page.has_xpath?("//span[text() = 'UnitPrice']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is UnitPrice, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'UnitPrice']]/following-sibling::td[1][text() = 'Sales Price']")
       puts "Internal name is UnitPrice, Opportunity Product Line Field field is Sales Price"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'UnitPrice']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Sales Price']")
        puts "Internal name is UnitPrice, Quote Product Line Field is Sales Price"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end


     if page.has_xpath?("//span[text() = 'ServiceSource1__REN_Is_CLM_Renewal__c']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceSource1__REN_Is_CLM_Renewal__c, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSource1__REN_Is_CLM_Renewal__c']]/following-sibling::td[1][text() = 'Renewal']")
       puts "Internal name is ServiceSource1__REN_Is_CLM_Renewal__c, Opportunity Product Line Field field is Renewal"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSource1__REN_Is_CLM_Renewal__c']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Opportunity Product Renewal Flag']")
        puts "Internal name is ServiceSource1__REN_Is_CLM_Renewal__c, Quote Product Line Field is Opportunity Product Renewal Flag"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end


     if page.has_xpath?("//span[text() = 'Quantity']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Quantity, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[1][text() = 'Quantity']")
       puts "Internal name is Quantity, Opportunity Product Line Field field is Quantity"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Quantity']")
        puts "Internal name is Quantity, Quote field is Quantity"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end


    if page.has_xpath?("//span[text() = 'Discount']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Discount, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Discount']]/following-sibling::td[1][text() = 'Discount']")
       puts "Internal name is Discount, Opportunity Product Line Field field is Discount"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Discount']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Discount']")
        puts "Internal name is Discount, Quote field is Discount"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end


    if page.has_xpath?("//span[text() = 'Description']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Description, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[1][text() = 'Line Description']")
       puts "Internal name is Description, Opportunity Product Line Field field is Line Description"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Line Item Description']")
        puts "Internal name is Description, Quote field is Line Item Description"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end



     if page.has_xpath?("//span[text() = 'ServiceSource1__REN_End_Date__c']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceSource1__REN_End_Date__c, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSource1__REN_End_Date__c']]/following-sibling::td[1][text() = 'End Date']")
       puts "Internal name is ServiceSource1__REN_End_Date__c, Opportunity Product Line Field field is End Date"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSource1__REN_End_Date__c']]/following-sibling::td[2]/select/option[@selected='selected' and text()='End Date']")
        puts "Internal name is ServiceSource1__REN_End_Date__c, Quote field is End Date"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end


     if page.has_xpath?("//span[text() = 'SSI_ZTH__Opportunity_Product_Picklist_20__c']/ancestor::td[1]/preceding-sibling::td/a[text() = 'Delete']")
      puts "Internal name is SSI_ZTH__Opportunity_Product_Picklist_20__c, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'SSI_ZTH__Opportunity_Product_Picklist_20__c']]/following-sibling::td[1][text() = 'Upsell/Cross-Sell']")
       puts "Internal name is SSI_ZTH__Opportunity_Product_Picklist_20__c, Opportunity Product Line Field field is Upsell/Cross-Sell"
    else
      writeFailure "Internal name and Opportunity Product Line Field field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'SSI_ZTH__Opportunity_Product_Picklist_20__c']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Upsell/Cross-Sell']")
        puts "Internal name is SSI_ZTH__Opportunity_Product_Picklist_20__c, Quote field is Upsell/Cross-Sell"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
  end
  end

When(/^I check that Quote and Quote Line Item fields are populated from the Opportunity and Opportunity Line Items$/) do
  within all('.pbSubsection')[1] do
     if page.has_xpath?("//span[text() = 'Description']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Description, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[1][text() = 'Line Item Description']")
       puts "Internal name is Description, Quote Product Line Field is Line Item Description"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Line Description']")
        puts "Internal name is Description, Opportunity Product Line Field is Line Description"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end


     if page.has_xpath?("//span[text() = 'ServiceSourceQ__CHL_Is_CLM_Renewal__c']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Description, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSourceQ__CHL_Is_CLM_Renewal__c']]/following-sibling::td[1][text() = 'Opportunity Product Renewal Flag']")
       puts "Internal name is Description, Quote Product Line Field is Opportunity Product Renewal Flag"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSourceQ__CHL_Is_CLM_Renewal__c']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Renewal']")
        puts "Internal name is Description,Opportunity Product Line Field is Renewal"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end


    if page.has_xpath?("//span[text() = 'ServiceDate']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceDate, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceDate']]/following-sibling::td[1][text() = 'Date']")
       puts "Internal name is ServiceDate, Quote Product Line Field is Date"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceDate']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Date']")
        puts "Internal name is ServiceDate, Opportunity Product Line Field is Date"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end


     if page.has_xpath?("//span[text() = 'UnitPrice']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceDate, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'UnitPrice']]/following-sibling::td[1][text() = 'Sales Price']")
       puts "Internal name is UnitPrice, Quote Product Line Field is Sales Price"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'UnitPrice']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Sales Price']")
        puts "Internal name is UnitPrice, Opportunity Product Line Field is Sales Price"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end


    if page.has_xpath?("//span[text() = 'ServiceSourceQ__CHL_End_Date__c']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceSourceQ__CHL_End_Date__c, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSourceQ__CHL_End_Date__c']]/following-sibling::td[1][text() = 'End Date']")
       puts "Internal name is ServiceSourceQ__CHL_End_Date__c, Quote Product Line Field is End Date"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSourceQ__CHL_End_Date__c']]/following-sibling::td[2]/select/option[@selected='selected' and text()='End Date']")
        puts "Internal name is ServiceSourceQ__CHL_End_Date__c, Opportunity Product Line Field is End Date"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end


     if page.has_xpath?("//span[text() = 'ServiceSourceQ__CHL_Start_Date__c']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceSourceQ__CHL_Start_Date__c, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSourceQ__CHL_Start_Date__c']]/following-sibling::td[1][text() = 'Start Date']")
       puts "Internal name is ServiceSourceQ__CHL_Start_Date__c, Quote Product Line Field is Start Date"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'ServiceSourceQ__CHL_Start_Date__c']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Start Date']")
        puts "Internal name is ServiceSourceQ__CHL_Start_Date__c, Opportunity Product Line Field is Start Date"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end


    if page.has_xpath?("//span[text() = 'Quantity']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Quantity, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[1][text() = 'Quantity']")
       puts "Internal name is Quantity, Quote Product Line Field is Quantity"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Quantity']")
        puts "Internal name is Quantity, Opportunity Product Line Field is Quantity"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end


    if page.has_xpath?("//span[text() = 'Discount']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Discount, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Discount']]/following-sibling::td[1][text() = 'Discount']")
       puts "Internal name is Discount, Quote Product Line Field is Discount"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Discount']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Discount']")
        puts "Internal name is Discount, Opportunity Product Line Field is Discount"
    else
      writeFailure "Internal name and Opportunity Product Line Field is not correct"
    end
  end
  within all('.pbSubsection') [2] do
    if page.has_xpath?("//span[text() = 'Description']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Description, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[1][text() = 'Description']")
       puts "Internal name is Description, Quote Field is Description"
    else
      writeFailure "Internal name and Quote Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Description']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Description']")
        puts "Internal name is Description, Opportunity Field is Description"
    else
      writeFailure "Internal name and Opportunity Field is not correct"
    end
  end
  end

 
When(/^I check that which fields are copied from reseller quote to distributor quote$/) do
  within all('.pbSubsection')[1] do
    if page.has_xpath?("//span[text() = 'Name']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Name, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Name']]/following-sibling::td[1][text() = 'Quote Name']")
       puts "Internal name is Name, Quote Field is Quote Name"
    else
      writeFailure "Internal name and Quote Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Name']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Quote Name']")
        puts "Internal name is Name, Source Quote Field is Quote Name"
    else
      writeFailure "Internal name and Source Quote Field is not correct"
    end
  end

  within all('.pbSubsection')[2] do
    if page.has_xpath?("//span[text() = 'Quantity']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is Quantity, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[1][text() = 'Quantity']")
       puts "Internal name is Quantity, Quote Product Line Field is Quantity"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'Quantity']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Quantity']")
        puts "Internal name is Quantity, Source Quote Product Line Field is Quantity"
    else
      writeFailure "Internal name and Source Quote Product Line Field is not correct"
    end

    if page.has_xpath?("//span[text() = 'UnitPrice']/ancestor::td[1]/preceding-sibling::td/span[text() = 'Required Field']")
      puts "Internal name is ServiceDate, Action is required field"
    else
      writeFailure "Internal name and Action is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'UnitPrice']]/following-sibling::td[1][text() = 'Sales Price']")
       puts "Internal name is UnitPrice, Quote Product Line Field is Start Date"
    else
      writeFailure "Internal name and Quote Product Line Field is not correct"
    end
    if page.has_xpath?("//td[span[text() = 'UnitPrice']]/following-sibling::td[2]/select/option[@selected='selected' and text()='Sales Price']")
        puts "Internal name is UnitPrice, Source Quote Product Line Field is Description"
    else
      writeFailure "Internal name and Source Quote Product Line Field is not correct"
    end
  end
end
