#Step to verify the drop down options appearing against requirement
Then(/^I should see the "([^"]*)" related option under "([^"]*)" picklist$/) do |select_field, renewal_Status|
  begin
    sleep 5
    resultArray=[]
    expectedArrayOption=[]
    actualArrayOption=[]
    if select_field== "House Account"
      expectedArrayOption=["--None--","HA - Bad Data - BDT","HA - Cancelled - CNL","HA - Covered - COV","HA - Duplicate - DUP","HA - End Of Support - EOL","HA - Evergreen Billing - EVG","HA - International - INT","HA - Lease - LEA","HA - OEM Customer - OEM","HA - Other - OTH","HA - Product Return - PRT","HA - Sales Pull Back - SPB"]
    elsif select_field== "No Service"
      expectedArrayOption=["--None--","NS - Client Product Replacement - PTR","NS - Competitive DVAR - SCV","NS - Competitive Product Replacement - PCP","NS - Competitive Service Loss Other - SCS","NS - Customer Cost-Benefit Decision - SCB","NS - Customer No Longer Exists - RNE","NS - Customer Satisfaction Driven - SSD","NS - End of Service Life - PEL","NS - Other Data Management - RDM","NS - Product Decommissioned - PPD","NS - Third Party Maintenance - SPM","NS - Unresponsive End User - REU","NS - Unresponsive VAR - RUV","NS - VAR No Service - RVN"]
    elsif select_field== "Closed Sale"
      expectedArrayOption=["--None--","CS - Renewed at Par - R@P","CS - Backdated - BKD","CS - Co-term Long - CTL","CS - Co-term Short - CTS","CS - Discount - DIS","CS - Multi-year Advance - MYA","CS - Pricing Change - PRC","CS - Re-Cert Fee Included - RCT","CS - Service Downgrade - DNG","CS - Service Upgrade - UPG","CS - Uncovered - UNC"]
    end    

    if page.has_select?("Renewal Status")
      actualArrayOption=find_field("Renewal Status").all('option').collect(&:text)
    elsif page.has_xpath?('//td[text()="Renewal Status"]')
      writeFailure "The dropdown - Renewal Status - is appearing with - R Permission -"
      next
    elsif page.has_xpath?('//th[text()="Renewal Status"]')
      writeFailure "The dropdown - Renewal Status - is appearing with - R Permission -"
      next
    end
    temp_Array=actualArrayOption.find_all { |e| actualArrayOption.count(e) > 1 }
    if temp_Array.count>0
      writeFailure "Following are the duplicate option appearing in dropdown  -- Renewal Status"
      writeFailure temp_Array
    end
    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the field - Renewal Status - is present"
    else
      writeFailure "The following options from - Renewal Status -  dropdown is missing"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra options are appearing in  - Renewal Status -  dropdown"
      writeFailure resultArray
    end
    sleep 5
  rescue Exception => ex
    writeFailure "Error while verifying - Renewal Status - picklist option"
    writeFailure ex.message
  end
end

When(/^I enter data in all the required field over "([^"]*)" edit page$/) do |case_type|
  sleep 20
  case case_type
    
  when "Quote Request"
    step 'I create new "Quote Request"'
  when "Booking Request"    
    step 'I create new "Booking Request"'
  when "Lead Submission"
    step 'I create new "Lead Submission"'
  when "Data Update Request"
    step 'I create new "Data Update Request"'
  when "Review Request"
    step 'I create new "Review Request"'
  when "Reporting Request"
    step 'I create new "Reporting Request"'
  when "Data Processing Request"
    step 'I create new "Data Processing Request"'
  else
    writeFailure "The cases type - #{case_type} - is not defiend"
  end

end

# Verify the section over the page
Then(/^I should see "([^"]*)" in Case Milestones section$/) do |text|
  sleep 10
  
  #  if ENV['UserRole'].include? 'EMEA'
  #
  #  elsif ENV['UserRole'].include? 'APAC'
  #
  #  else
  #
  #  end
  if page.has_xpath?('//div[contains(@class,"caseBlock")]//a[contains(text(),"'"#{text}"'")]')
    puts "The section - Case Milestones - is showing - #{text} -"    
  else
    writeFailure "The section - Case Milestones - is NOT showing - #{text} - under it"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify the section over the page
Then(/^I change the Case Owner$/) do 
  sleep 10
  if page.has_xpath?('//td[text()="Case Owner"]/following-sibling::td[1]//a[text()="[Change]"]')
    find(:xpath, '//td[text()="Case Owner"]/following-sibling::td[1]//a[text()="[Change]"]').click
    sleep 10
    find(:xpath, '//input[@title="Owner name"]').set "DSIntegration Admin"
    find(:xpath, '(//input[@title="Save"])[1]').click
    puts "Entered - DSIntegration Admin- in Owner name field"

  else
    writeFailure "The section - Case Milestones - is NOT showing - #{text} - under it"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify the section over the page
Then(/^I capture the test case number$/) do
  sleep 20
  if page.has_xpath?('//div[contains(@class,"PageTitle")]//h2')
    $caseNumber=find(:xpath, '//div[contains(@class,"PageTitle")]//h2').text
    puts "Case number is - #{$caseNumber}"
  else
    writeFailure "FAIL to capture the case number "
  end
  
end

#Step to verify the drop down options appearing against requirement
Then(/^I verified Renewal Status field for "([^"]*)" option$/) do |select_field|
  begin
    sleep 5
    arg=getGeneralDetails "CommonData"
    resultArray=[]
    if select_field== "Closed Sale"
      expectedArrayOption=["--None--","CS - Backdated - BKD","CS - Co-term Long - CTL","CS - Co-term Short - CTS","CS - Discount - DIS","CS - Multi-year Advance - MYA","CS - Multi-year Annual - MYY","CS - Pricing Change - PRC","CS - Re-Cert Fee Included - RCT","CS - Renewed at Par - R@P","CS - Service Downgrade - DNG","CS - Service Upgrade - UPG","CS - Uncovered - UNC"]
    elsif select_field== "House Account"
      expectedArrayOption=["--None--","HA - Bad Data - BDT","HA - Cancelled - CNL","HA - Covered - COV","HA - Duplicate - DUP","HA - End of Life - EOL","HA - Other - OTH","HA - Product Return - PRT","HA - Sales Pull Back - SPB","HA - Client Product Replacement - CPR","HA - System Relocation - SRL"]
    elsif select_field== "No Service"
      expectedArrayOption=["--None--","NS - Competitive Product Replacement - PCP","NS - Competitive Service Loss Other - SCS","NS - Customer No Longer Exists - RNE","NS - Customer Satisfaction Driven - SSD","NS - Product Decommissioned - PPD","NS - Unresponsive End User - REU","NS - Cost Benefit/Budget - CBB","NS - Cost Benefit/Value - CBV","NS - Instrument Low Usage - ILU","NS - In-House Service Provider - ISP","NS - Time and Materials - TNM"]
    end
    actualArrayOption=[]


    if page.has_select?("Renewal Status")
      actualArrayOption=find_field("Renewal Status").all('option').collect(&:text)
    elsif page.has_xpath?('//td[text()="'"#{Renewal Status}"'"]')
      writeFailure "The dropdown - Renewal Status - is appearing with - R Permission -"
      next
    elsif page.has_xpath?('//th[text()="'"#{Renewal Status}"'"]')
      writeFailure "The dropdown - Renewal Status - is appearing with - R Permission -"
      next
    end
    temp_Array=actualArrayOption.find_all { |e| actualArrayOption.count(e) > 1 }
    if temp_Array.count>0
      writeFailure "Following are the duplicate option appearing in dropdown  -- Renewal Status"
      writeFailure temp_Array
    end
    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the field - Renewal Status - is present"
    else
      writeFailure "The following options from - Renewal Status -  dropdown is missing"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra options are appearing in  - Renewal Status -  dropdown"
      writeFailure resultArray
    end
    sleep 5
  rescue Exception => ex
    writeFailure "Error while verifying - Renewal Status - picklist option"
    writeFailure ex.message
  end
end

Then(/^I select "([^"]*)" option from "([^"]*)" picklist$/) do |option_val, field_val|
  sleep 5
  Capybara.default_wait_time =1
  Capybara.exact = true
  if page.has_content?(field_name)
    if page.has_field?(field_name)
      find_field(field_name).select option
      sleep 10
      puts "The option - #{option} - is selected from field -#{field_name} "
    else
      writeFailure "The field - #{field_name} - is present with - R Only - Permission"
    end
  else
    writeFailure "The field - #{field_name} - is not present over the page"
  end
  Capybara.default_wait_time =30
end


When(/^I enter the mandatory field values under new case for data update request$/) do
  sleep 5
  if page.has_xpath?('//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Description -- field"
    #  else
    #    writeFailure "Fail to enter data in -- Description -- field "
  end
  Capybara.default_wait_time =30
end

When(/^I search the case number created$/) do
  sleep 3
  find(:xpath, '//input[@title="Search..."]').set $caseNumber
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  if page.has_xpath?('//div[contains(@class,"caseBlock")]//a[text()="'"#{$caseNumber}"'"]')
    find(:xpath, '//div[contains(@class,"caseBlock")]//a[text()="'"#{$caseNumber}"'"]').click
    puts "The case number - #{$caseNumber} - is found and clicked"
  else
    writeFailure "FAIL to find the case number - #{$caseNumber} -"
  end
end


When(/^I clicked the case number from Items to Approve section$/) do
  if page.has_xpath?('//a[text()="Approve / Reject"]/parent::td/following-sibling::th/a[text()="'"#{$caseNumber}"'"]')
    find(:xpath, '//a[text()="Approve / Reject"]/parent::td/following-sibling::th/a[text()="'"#{$caseNumber}"'"]').click
    puts "The case number - #{$caseNumber} - is found and clicked"
  else
    writeFailure "FAIL to find the case number - #{$caseNumber} -"
  end
end

#Step definition to verify if the field is present under a particular page section
Then(/^I clicked the link "([^"]*)" from "([^"]*)" section$/) do |field_name, section|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//h3[text()="'"#{section}"'"]/ancestor::div[1]/following-sibling::div[1]//a[text()="'"#{field_name}"'"])[1]')
    find(:xpath, '(//h3[text()="'"#{section}"'"]/ancestor::div[1]/following-sibling::div[1]//a[text()="'"#{field_name}"'"])[1]').click
    puts "The link - #{field_name} - is clicked from - #{section} - section"
  else
    writeFailure"FAIL tto click the link - #{field_name} - from #{section} section"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

When(/^I should not see lock icon next to edit button$/) do
  sleep 5
  if page.has_xpath?('//img[@title="Locked"]/following-sibling::input[@title="Edit"]')
    writeFailure "FAIL - The - Lock Icon - is appearing next to - Edit - button"
  else
    puts "The - Lock Icon - is NOT appearing next to - Edit - button"
  end
  Capybara.default_wait_time =30
end


#step definition to navigate to particular tab
When(/^Navigate to "([^"]*)" tab$/) do |tab|
  sleep 5
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
end

When(/^I select "([^"]*)" from record type of new record$/) do |arg1|
  sleep 10
  if page.has_xpath?('//option[text()="'"#{arg1}"'"]')
    find(:xpath, '//option[text()="'"#{arg1}"'"]').select_option
    if find(:button,'Continue').visible?
      sleep 2
      click_on('Continue')
      puts "clicked on continue button"
    else
      writeFailure "Continue button is not available for this user"
    end
  else
    
    writeFailure "Fail to select the option - #{arg1}"
  end
  



  #  if page.has_xpath?('//option[@selected="selected" and text()="'"#{arg1}"'"]')
  #    if find(:button,'Continue').visible?
  #      sleep 2
  #      click_on('Continue')
  #      puts "clicked on continue button"
  #    else
  #      puts "Continue button is not available for this user"
  #    end
  #  else
  #    select arg1, :from => "Record Type of new record"
  #    sleep 3
  #    if find(:button,'Continue').visible?
  #      sleep 2
  #      click_on('Continue')
  #      puts "clicked on continue button"
  #    else
  #      puts "Continue button is not available for this user"
  #    end
  #  end
end

When(/^I select the existing opportunity "([^"]*)"$/) do |opportunity_name|
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set opportunity_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 5

  if page.has_xpath?('//div[contains(@class,"opportunityBlock")]')
    #    within(:xpath, '//div[contains(@class,"opportunityBlock")]')do
    if page.has_xpath?('//div[contains(@class,"opportunityBlock")]//a[text()="'"#{opportunity_name}"'"]')
      find(:xpath, '//div[contains(@class,"opportunityBlock")]//a[text()="'"#{opportunity_name}"'"]').click
      puts "The opprtunity record -- #{opportunity_name} --- is found and selected"
    end
    #    end
  elsif page.has_xpath?('//div[text()="No matches found"]')
    writeFailure "The opportunity record  - #{opportunity_name} - is - NOT - found"
  end
  sleep 5
end

# Verify ptions under drop down
Then(/^I should see Normal as default option under Priority picklist$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//script[contains(text(),"Normal")]')
    puts "The option -  Normal - is appearing as default value under Priority picklist"
  else
    writeFailure "FAIL - The option -  Normal - is NOT appearing as default value under Priority picklist"
  end
end



# Verify ptions under drop down
Then(/^I should see the option "([^"]*)" under "([^"]*)" dropdown$/) do |option, dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
    puts "The option - #{option} - is present under under - #{dropdown_name} - dropdown"
  else
    if page.has_xpath?('(//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//select)[1]')
      writeFailure "The option - #{option} - is NOT present under - #{dropdown_name} - dropdown"
      #fail(ArgumentError.new('Fail'))
    else
      if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
        writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
        #fail(ArgumentError.new('Fail'))
      elsif page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]')
        writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
        #fail(ArgumentError.new('Fail'))
      else
        writeFailure "The DROPDOWN - #{dropdown_name} - is NOT present over the page"
        #fail(ArgumentError.new('Fail'))
      end
    end
  end
  Capybara.default_wait_time =30
end


Then(/^I should see the HA NS meets approval criteria check box checked$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="HA/ NS meets approval criteria"]/following-sibling::td[1]//img[@title="Checked"]')
    puts "The HA NS meets approval criteria check box is checked"
    sleep 5
  else
    writeFailure "The HA NS meets approval criteria check box is NOT checked"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Click the button
Then(/^I clicked "([^"]*)" button over the page$/) do |button_name|
  sleep 5
  Capybara.default_wait_time =1
  Capybara.exact = true
  if page.has_button?(button_name)
    click_button(button_name)
    puts "The button -- #{button_name} -- has been clicked"
  else
    writeFailure "Fail to click the button -- #{button_name} --"
  end
  Capybara.default_wait_time =30
end

When(/^I should see the specific case type option for individual role$/) do
  begin
    sleep 5
    actualArrayOption=[]
    expectedArrayOption=[]
    
    if (ENV['UserRole'].include? "Admin")
      expectedArrayOption=["Quote Request","Booking Request","Data Processing Request","Review Request","Reporting Request","Data Update Request"]
    elsif (ENV['UserRole'].include? "SalesRep")
      expectedArrayOption=["Quote Request","Booking Request","Data Processing Request","Review Request","Reporting Request","Data Update Request"]
    elsif (ENV['UserRole'].include? "SalesManager")
      expectedArrayOption=["Quote Request","Booking Request","Data Processing Request","Review Request","Reporting Request","Data Update Request"]
    elsif (ENV['UserRole'].include? "OperationManager")
      expectedArrayOption=["Quote Request","Booking Request","Data Processing Request","Review Request","Reporting Request","Data Update Request"]
    elsif (ENV['UserRole'].include? "OperationRep")
      expectedArrayOption=["Quote Request","Booking Request","Data Processing Request","Review Request","Reporting Request","Data Update Request"]
    elsif (ENV['UserRole'].include? "SalesOperation")
      expectedArrayOption=["Quote Request","Booking Request","Data Processing Request","Review Request","Reporting Request","Data Update Request"]
    end
    puts "expectedArrayOption option ----------"
    puts expectedArrayOption
    if page.has_xpath?('//label[text()="Record Type of new record"]/parent::td[1]/following-sibling::td[1]//select')
      actualArrayOption=find(:xpath, '//label[text()="Record Type of new record"]/parent::td[1]/following-sibling::td[1]//select').all('option').collect(&:text)
      puts "actualArrayOption  --  #{actualArrayOption}  - "
    else
      writeFailure "FAIL to find - Record Type of new record - drop down"
    end

    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the field - Record Type of new record - is present"
    else
      writeFailure "The following options from - Record Type of new record -  dropdown is missing"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra options are appearing in  - Record Type of new record -  dropdown"
      writeFailure resultArray
    end
  end
end

# Verify if the check box is enabled for the fields
Then(/^I should see checkbox "([^"]*)" is present with Read Only permission$/) do |fieldName|
  sleep 5
  if page.has_xpath?('//td[text()="Request Escalation"]/following-sibling::td[1]//input[@type="hidden"]]')
    puts "The checkbox - #{fieldName} is present with Read Only permission over the page"
    sleep 5
  else
    writeFailure "Fail The checkbox - #{fieldName} is NOT present with Read Only permission over the page"
    #fail(ArgumentError.new('Fail'))
  end
end

When(/^I should see lock icon next to edit button$/) do
  sleep 5
  if page.has_xpath?('//img[@title="Locked"]/following-sibling::input[@title="Edit"]')
    puts "The - Lock Icon - is appearing next to - Edit - button"
  else
    writeFailure "FAIL -  The - Lock Icon - is NOT appearing next to - Edit - button"
  end
  Capybara.default_wait_time =30
end

When(/^I verify that the Target Date value under Case Milestones and Target Date value under Case Management are same$/) do
  sleep 5
  if page.has_xpath?('//h3[text()="Case Management"]/parent::div[1]/following-sibling::div[1]//table//td[text()="Target Date"]/following-sibling::td[1]/div')
    targetDate_CaseMnt=find(:xpath, '//h3[text()="Case Management"]/parent::div[1]/following-sibling::div[1]//table//td[text()="Target Date"]/following-sibling::td[1]/div').text
    puts "Target Date value present under Case Management is - #{targetDate_CaseMnt}"
  else
    writeFailure "FAIL -  to capture target date value from Case Management section"
  end
  if page.has_xpath?('//h3[text()="Case Milestones"]/ancestor::div[contains(@class,"caseBlock")]//tr[2]//td[3]')
    targetDate_CaseMilestones=find(:xpath, '//h3[text()="Case Milestones"]/ancestor::div[contains(@class,"caseBlock")]//tr[2]//td[3]').text
    puts "Target Date value present under Case Milestones is - #{targetDate_CaseMnt}"
  else
    writeFailure "FAIL -  to capture target date value from Case Milestones section"
  end

  if targetDate_CaseMnt.strip==targetDate_CaseMilestones.strip
    puts "The target date value present under case milstone and case management section are same"
  else
    writeFailure "FAIL -- The target date value present under case milstone and case management section are NOT same"
  end
  Capybara.default_wait_time =30
end

# Verify if the check box is enabled for the fields
Then(/^I should see the checkbox checked for "([^"]*)" field$/) do |fieldName|
  sleep 5
  if page.has_xpath?('//td[text()="'"#{fieldName}"'"]/following-sibling::td//img[@title="Checked"]')
    puts "The checkbox #{fieldName} - is checked"
    sleep 5
  else
    writeFailure "Fail to check the checkbox #{fieldName} -"
    #fail(ArgumentError.new('Fail'))
    sleep 5  
  end
end

When(/^I click the "([^"]*)" link for the case number capture in previous step$/) do |linkText|
  sleep 5
  if page.has_xpath?('//a[text()="'"#{@caseNumber}"'"]/ancestor::tr[1]//a[text()="'"#{linkText}"'"]')
    find(:xpath, '//a[text()="'"#{@caseNumber}"'"]/ancestor::tr[1]//a[text()="'"#{linkText}"'"]').click
    puts "The link - #{linkText} - has been clicked for the case number - #{@caseNumber}"
  else
    writeFailure "Fail to click the link - #{linkText} - for the case number - #{@caseNumber}"
  end
end

When(/^I should see Overall Status as "([^"]*)"$/) do |expected_text|
  sleep 5
  if page.has_xpath?('//h3[text()="Approval History"]/ancestor::div[contains(@class,"secondaryPalette")]//span[text()="Pending"]')
    puts "Overrall Status is appearing as - #{expected_text}"
  else
    writeFailure "Fail Overrall Status is NOT appearing as - #{expected_text}"
  end
end

When(/^Assigned To column should show "([^"]*)"$/) do |expected_text|
  sleep 5
  if page.has_xpath?('//h3[text()="Approval History"]/ancestor::div[contains(@class,"secondaryPalette")]//td[3]/a[text()="Sales & Ops Manager Queue"]')
    puts "The column  - Assigned To - is showing - #{expected_text} "
  else
    writeFailure "Fail The column  - Assigned To - is NOT showing - #{expected_text} "
  end
end


# Select options from drop down
Then(/^I select first option from "([^"]*)" dropdown$/) do |dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//select')
    if find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[1]').text == "--None--"
      find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[2]').select_option
      puts "Selected second option from the - #{dropdown_name} - dropdown"
    elsif find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[1]').text != "--None--"
      find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[1]').select_option
      puts "Selected first option from the - #{dropdown_name} - dropdown"
    else
      writeFailure "FAIL to select any option from field - #{dropdown_name} -"
    end
  else
    if page.has_xpath?('//*[text()="'"#{dropdown_name}"'"]')
      if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//select')==false
        writeFailure "The field - #{dropdown_name} - is NOT appearing as - DROPDOWN - field"
      end
    else
      writeFailure "The field - #{dropdown_name} - is NOT present over the page"
      #fail(ArgumentError.new('Fail'))
    end
  end
  Capybara.default_wait_time =30
end