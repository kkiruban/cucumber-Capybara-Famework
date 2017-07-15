
#step definition to verify the content in a web page that specified in an feature step
Then(/^I should see content "([^"]*)"$/) do |content|
  sleep 5
  if page.has_content? content
    puts "#{content} content is present"
  else
    writeFailure "#{content} content is not present"
  end
end


Then(/^I select "([^"]*)" from "([^"]*)" field$/) do |value, locator|
  if page.has_select? locator
    select(value, :from => locator,match: :prefer_exact)
  else
    writeFailure " #{locator} is not visible"
  end
end

Then(/^I should see "([^"]*)" field with read and write permission$/) do |value|
  if page.has_field?(value)
    puts "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    writeFailure "#{value} field is visible with readable permission"
  else
    writeFailure "#{value} field is not visible"
  end
end

Then(/^I should see "([^"]*)" field with read only permission$/) do |value|
  if page.has_content?(value)
    puts "#{value} field is visible with read only permission"
  else
    writeFailure "#{value} field is not visible"
  end
end


Then(/^I should see "([^"]*)" field with read and write permission for all except salesops user$/) do |value|
  if (ENV['UserRole'] == "SalesOperationSit") || (ENV['UserRole'] == "SalesOperationProd")
    if page.has_field?(value)
      writeFailure "#{value} field is visible with editable permission"
    elsif page.has_content?(value)
      puts "#{value} field is visible with readable permission"
    else
      writeFailure "#{value} field is not visible"
    end
  else
    if page.has_field?(value)
      puts "#{value} field is visible with editable permission"
    elsif page.has_content?(value)
      writeFailure "#{value} field is visible with readable permission"
    else
      writeFailure "#{value} field is not visible"
    end
  end
end

Then(/^I should see "([^"]*)" field with read only permission for all users$/) do |value|
  if page.has_content?(value)
    puts "#{value} field is visible with read only permission"
  else
    writeFailure "#{value} field is not visible"
  end
end

Then(/^I should not see "([^"]*)" field$/) do |value|
  if page.has_field?(value)
    writeFailure "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    writeFailure "#{value} field is visible with readable permission"
  else
    puts "#{value} field is not visible"
  end
end

When(/^I click on all tabs view button$/) do
  find(:xpath,"//img[@title='All Tabs']").click
  sleep 5
end

Given(/^I should navigate to Home tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 15
end

Then(/^I should not see "([^"]*)" list$/) do |layout|
  sleep 5
  if page.has_content? layout
    writeFailure "#{layout} list is present"
  else
    puts "#{layout} list is not present"
  end
end

When(/^I click on New Renewable Line Item button$/) do
  find(:xpath,"//input[@title='New Renewable Line Item']").click
  sleep 5
end

#step definition to click on bottom row button
When(/^I click on "([^"]*)" button from bottom row$/) do |val|
  within(:id,'bottomButtonRow') do
    if find(:button, val).visible?
      click_on val
      sleep 5
    end
  end
end

#step definition to verify the link in a web page that specified in an feature step
Then(/^I should see "([^"]*)" link$/) do |link|
  if page.find_link(link).visible?
    puts "#{link} link is visible"
  else
    fail(ArgumentError.new(link + ' link is not visible'))
  end
end

#step definition to click the particular link in a web page that specified in an feature step
When(/^I follow "([^"]*)" link$/) do |link|
  find_link(link).visible?
  click_link(link)
end

#step definition to wait for time we mention in a method
When(/^I wait for (\d+) seconds$/) do |seconds|
  sleep(seconds.to_i)
end

#step definition to click on button under top button row
When(/^I click on "([^"]*)" button on top button row$/) do |button_name|
  sleep 5
  within all('.pbButton')[0] do
    click_on button_name
  end
end

#step definition to select a value from drop down
When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, locator|
  sleep 10
  if page.has_select? locator
    select(value, :from => locator)
  else
    fail(ArgumentError.new(value + ' is not editable for current user '))
  end
end

#Step to click on new button
When(/^I follow on "([^"]*)" button$/) do |button_name|
  if find_button(button_name).visible?
    click_on button_name
  else
    fail(ArgumentError.new(+button_name+ ' button is not visible'))
  end
  sleep 5
end


#step definition to click on edit,save,cancel Button in the opened Quotes page
When(/^I click on "([^"]*)" button from top row$/) do |val|
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, val).visible?
      click_on val
    end
  end
  sleep 2
  if page.has_content?("Error: Invalid Data. ")
    fail(ArgumentError.new('Not'+val+ 'd successfully due to Invalid Data. '))
  else
    puts val + "d successfully"
  end
  sleep 2
end

#step definition to click on go button
When(/^I follow go button$/) do
  within('.bFilterView') do
    click_on("Go!", match: :first)
    sleep 5
  end
end

#step definition to verify the field is visible or not
Then(/^I should see "([^"]*)" field is visible$/) do |label_name|
  if find_field(label_name).visible?
    puts label_name + " field is present"
  else
    fail(ArgumentError.new(label_name + 'field is not present'))
  end
end

#Step definition to verify the field is select type
Then(/^I verify "([^"]*)" field is of type select$/) do |select_type|
  if page.has_select?(select_type)
    puts "The #{select_type} is of type select"
  else
    fail(ArgumentError.new('The' + select_type + 'is not of type select'))
  end
end

#Step definition to enter date in date field
And(/^I entered todays date in "([^"]*)" field$/) do |field_name|
  currentTime=Time.now.strftime("%m/%d/%Y")
  page.find_field(field_name).set(currentTime)
end

#step definition to navigate to particular tab
When(/^I navigate to "([^"]*)" tab$/) do |tab|
  sleep 5
  click_link(tab)
end

#step definition to verify button under top row
Then(/^I should see "([^"]*)" button in top row$/) do |button_value|
  within(:id,'topButtonRow') do
    if find_button(button_value).visible?
      puts button_value + "button is visible"
    else
      fail(ArgumentError.new(button_value + 'button is not visible'))
    end
  end
end

When(/^I click on "([^"]*)" tab$/) do |tab|
  click_on(tab)
end


Then(/^I should see the error message "([^"]*)"$/) do |error_msg|
  sleep 5
  if has_text?(error_msg)
    puts "The error message --  #{error_msg} -- is present over the page"
  else
    writeFailure "The error message --  #{error_msg} -- is not present over the page"
  end
end

Then(/^I select "([^"]*)" from "([^"]*)" picklist$/) do |option, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select').select option
    puts "The option -- #{option} -- is selected from -- #{field_name} -- dropdown"
  else
    writeFailure "Fail to enter data in --- #{field_name} -- dropdown "
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*)[1]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  elsif page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//a)[1]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  elsif page.has_xpath?('(//*[text()="'"#{field_name}"'"]/following-sibling::td[1][contains(@class,"inlineEditWrite")])[1]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  else
    writeFailure "The field  - #{field_name} - is not present with - RW - permission"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end


Then(/^I should see "([^"]*)" column under "([^"]*)" section$/) do |column_name, section_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h3[text()="'"#{section_name}"'"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="'"#{column_name}"'"]')
    puts "The coulmn name - #{column_name} - is present under section - #{section_name} -"
  else
    writeFailure "The coulmn name - #{column_name} - is - NOT -present under section - #{section_name} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in left column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[1]//*[text()="'"#{field_name}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')==true
    #if page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - left - column"
  else
    writeFailure"The given - #{field_name} - field is not present in the - left - column"
    #fail(ArgumentError.new('Fail'))
  end
end


# Verify if the field is present under account detail section
Then(/^I should see the field "([^"]*)" under Account Detail section$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h2[text()="Account Detail"]/ancestor::div[1]/following-sibling::div[1]/div[3]//td[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is present under account detail section"
  else
    writeFailure "The field  - #{field_name} - is not present under account detail section"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with - RW - permission$/) do |field_name|

  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =10
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  else
    writeFailure "The field  - #{field_name} - is not present with - RW - permission"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end
# Verify if the field is appearing with Read only permission
Then(/^I should see the field "([^"]*)" with - Read Only - permission$/) do |field_name|
  sleep 5

  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
    writeFailure "The field  - #{field_name} - is not present with - READ ONLY - permission"
    #fail(ArgumentError.new('Fail'))
  else
    puts "The field  - #{field_name} - is present with - READ ONLY - permission"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is first field in the right column under given section
Then(/^I should see the field "([^"]*)" as the first item in the right column$/) do |dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]/preceding-sibling::td[3]')
    writeFailure "The field  - #{dropdown_name} - is not the first item in the right column"
    #fail(ArgumentError.new('Fail'))
  else
    puts "The field  - #{dropdown_name} - is the first item in the right column"
  end
  Capybara.default_wait_time =30
end

# Verify options not present under given dropdown
Then(/^I should not see the option "([^"]*)" under "([^"]*)" dropdown$/) do |option, dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
    writeFailure "The option - #{option} - is present under - #{dropdown_name} - dropdown"
    #fail(ArgumentError.new('Fail'))
  else
    if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
      writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
      #fail(ArgumentError.new('Fail'))
    else
      puts "The option - #{option} - is NOT present under - #{dropdown_name} - dropdown"
    end
    Capybara.default_wait_time =30
  end
end

# Verify the section over the page
Then(/^I should see the "([^"]*)" section under "([^"]*)" section$/) do |section_name1, sectionName_2|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{sectionName_2}"'"]/ancestor::div[@class="bRelatedList"]/following-sibling::div[1]//h3[text()="'"#{section_name1}"'"]')
    puts "The section - #{section_name1} - is present under - #{sectionName_2} - section"
    sleep 5
  else
    writeFailure "The section - #{section_name1} - is NOT present under - #{sectionName_2} - section"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify the section over the page
Then(/^I should see "([^"]*)" section over "([^"]*)" detail page$/) do |section_name, pageName|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_name}"'"]')
    puts "The section - #{section_name} - is present over the #{pageName} detail page"
    sleep 5
  else
    writeFailure "The section - #{section_name} - is NOT present over the #{pageName} detail page"
    #fail(ArgumentError.new('Fail'))
  end
end

Then(/^I should see the "([^"]*)" as picklist type$/) do |picklist_name|

  sleep 5
  if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/span/select')
    if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/table')
      writeFailure "The field - #{picklist_name} - is multiple selection dropdown field"
    else
      puts "The field - #{picklist_name} - is single selection dropdown field"
    end
  else
    writeFailure "The section - #{picklist_name} - is NOT present as picklist type"
    #fail(ArgumentError.new('fail'))
  end

end

# Verify a section over page
Then(/^I should see the "([^"]*)" as multiselect picklist$/) do |picklist_name|

  sleep 5
  #if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/span/select[@multiple="multiple"]')
  if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/table')
    puts "The field - #{picklist_name} - is multiple selection dropdown field"
  elsif page.has_xpath?('//td[text()="'"#{picklist_name}"'"]')
    writeFailure "The MultiSelectPicklist - #{picklist_name} -is appearing with - R Permission -"
  else
    writeFailure "The picklist - #{picklist_name} - is NOT present as multiselect picklist"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end

end

# Verify the table column under given section
Then(/^I should see the "([^"]*)" column in "([^"]*)" section$/) do |column_name, section_name|
  sleep 5
  if page.has_xpath?('//th[text()="'"#{column_name}"'"]/ancestor::div[1]/preceding-sibling::div[1]//h3[text()="'"#{section_name}"'"]')
    puts "The column - #{column_name} - is present over the page under #{section_name} section"
    sleep 5
  else
    writeFailure "The column - #{column_name} - is NOT present over the page under #{section_name} section"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

# Verify a section over page
Then(/^I should see the "([^"]*)" section over the page$/) do |section_Name|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
    puts "The section - #{section_Name} - is present over the page"
    sleep 5
  else
    writeFailure "The section - #{section_Name} - is NOT present over the page"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

# Clicking Save button
Then(/^I click Cancel button from top button row$/) do
  sleep 5
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Cancel"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Cancel"]').click
    next
    sleep 5
  else
    writeFailure "Fail to click Cancel buttton"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end


#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field MultiSelectPicklist options$/) do |select_field|
  sleep 5
  begin
    step 'I click Edit button from top button row'
    arg=getDetails "CommonData"
    resultArray=[]
    expectedArrayOption=[]
    actualArrayOption=[]
    #  if page.has_xpath?('//td[text()="'"#{select_field}"'"]')
    #     writeFailure "The MultiSelectPicklist - #{select_field} - is appearing with - R Permission -"
    #     next
    #  end
    #  if page.has_no_xpath?('//td[text()="'"#{select_field}"'"]') and page.has_no_xpath?('//select[contains(@title,"'"#{select_field +" - Available"}"'")]')
    #     writeFailure "The MultiSelect Picklist - #{select_field} - is NOT present over the page"
    #     next
    #  end
    expectedArrayOption=arg[select_field]
    if page.has_xpath?('//select[contains(@title,"'"#{select_field +" - Available"}"'")]')
      actualArrayOption=find(:xpath, '//select[contains(@title,"'"#{select_field +" - Available"}"'")]').all('option').collect(&:text)
    elsif  page.has_xpath?('//td[text()="'"#{select_field}"'"]')
      writeFailure "The MultiSelectPicklist - #{select_field} - is appearing with - R Permission -"
      step 'I click Save button from top button row'
      next
    elsif page.has_no_xpath?('//td[text()="'"#{select_field}"'"]') and page.has_no_xpath?('//label[text()="'"#{select_field}"'"]')
      writeFailure "The MultiSelect Picklist - #{select_field} - is NOT present over the page"
      step 'I click Save button from top button row'
      next
    end
    #puts "Actual options are : #{actualArrayOption}"
    #puts "Expected Options are : #{expectedArrayOption}"

    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the dropdown - #{select_field} - is present"
    else
      writeFailure "The following options are not present in the dropdown"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra option are appearing in the dropdown"
      writeFailure resultArray
    end
    #  end
    step 'I click Save button from top button row'
    sleep 5
  rescue Exception => ex
    step 'I click Save button from top button row'
    writeFailure "Error while verifying - #{select_field} - MultiSelectPicklist option"
    writeFailure ex.message
  end
end

#Step definition to click a button
Then(/^I click "([^"]*)" button$/) do |buttonName|
  sleep 5
  if page.has_xpath?('//input[@title="'"#{buttonName}"'"]')
    find(:xpath, '//input[@title="'"#{buttonName}"'"]').click
    puts "The button - #{buttonName} - has been clicked"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The button - #{buttonName} - NOT found"
  end
end

#Step definition to verify date type field
Then(/^The field "([^"]*)" should be of date type$/) do |field_name|
  step 'I click Edit button from top button row'
  sleep 5
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/*[contains(@class,"dateInput")]')
    puts "The - #{field_name} - field is -  Date Type -"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The field - #{field_name} - is - Not Date Type  -"
  end
  #end
  step 'I click Save button from top button row'
end

#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in the right column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[3][text()="'"#{field_name}"'"]')
    puts "The field - #{field_name} - is present in the - right - column"
  elsif page.has_xpath?('//tr/td[3]/label[text()="'"#{field_name}"'"]')
    puts "The field - #{field_name} - is present in the - right - column"
  else
    writeFailure"The - #{field_name} - field is not present in the - right - column"
    #fail(ArgumentError.new('Fail'))
  end
end

#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in the left column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - left - column"
  elsif page.has_xpath?('//tr/td[1]/label[text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - left - column"
  else
    writeFailure"The given - #{field_name} - field is not present in the - left - column"
    #fail(ArgumentError.new('Fail'))
  end
end

#Step definition to verify if the field is present under a particular page section
Then(/^I should see the field "([^"]*)" is present under "([^"]*)" section$/) do |field_name, section|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h3[text()="'"#{section}"'"]')
    if page.has_xpath?('(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table//*[text()="'"#{field_name}"'"])[1]')
      puts "The field -#{field_name}- is present under #{section} section"
    else
      writeFailure"The field  - #{field_name} - is NOT present under #{section} section"
    end
  else
    writeFailure"The section - #{section} - is not present over the page"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I click Save button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
    puts "The Save button has been clicked"

  end
  Capybara.default_wait_time =30
end

# Clicking edit button
Then(/^I click Edit button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  #step 'I click Save button from top button row'
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Edit"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Edit"]').click
    puts "The Edit button has been clicked"

  end
  Capybara.default_wait_time =30
end

#Step definition for searching and selecting an account
Then(/^I select "(.*?)" account record$/) do |accout_Name|
  if page.has_xpath?('//input[@title="Search..."]')
    #The opportunity is of type "Opportunity Asset - Edit Books"
    find(:xpath, '//input[@title="Search..."]').set accout_Name
    sleep 2
    find(:xpath, '//input[@value="Search"]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"accountBlock")]')
    within(:xpath, '//div[contains(@class,"accountBlock")]')do
      if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
        puts "The record #{accout_Name} is accout is found and selected"
      else
        writeFailure "Fail to search given account record"
      end
    end
  end
end

#click on tab
When(/^I navigate to "([^"]*)" tab in the application$/) do |tab|
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

#click on tab
When(/^I navigate to "([^"]*)" tab in salesforce application$/) do |tab|
  step 'I enter the credentials to the Zenith application'
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

# Verify if the account record saves successfully
Then(/^The "([^"]*)" record should save seccessfully$/) do |record_type|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_content?("Error: Invalid Data.")
    writeFailure "-- #{record_type} record -- NOT saved successfully due to Invalid Data. "
  else
    puts "-- #{record_type} record -- created successfully"
  end

  Capybara.default_wait_time =30
end

#Step definition to verify field not present over the page
Then(/^I should not see the field "([^"]*)" over the page$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('//div[contains(@class,"EditBlock")]//*[text()="'"#{field_name}"'"]')==false
      puts "The - #{field_name} - is -NOT- present over account detail page"
    elsif page.has_xpath?('//div[contains(@class,"EditBlock")]//*[text()="'"#{field_name}"'"]')
      writeFailure"The - #{field_name} - is present over the page"
    else
      writeFailure "Method condition Fail"
    end
    #end
    Capybara.default_wait_time =30
  end
end

# Verify if the field is present as NOT required field
Then(/^I should see the field "([^"]*)" over the page as not required field$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/*[not(div)]')
    puts "The field - #{field_name} - is present over the page as not required field"
    puts "The field  - #{field_name} - is present with - RW - permission"
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//div[@class="requiredInput"]')
    writeFailure "The field - #{field_name} - is present over the page as required field"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is present with - R ONLY - permission"
  else
    writeFailure "The field - #{field_name} - is - NOT -present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is present as NOT required field
Then(/^I check the "([^"]*)" checkbox$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input').set(true)
    puts "The field  - #{field_name} - is checked"
  else
    writeFailure "FAIL to check the checkbox - #{field_name} -"
  end
  Capybara.default_wait_time =30
end

Then(/^I enter "([^"]*)" in "([^"]*)" textarea field$/) do |text, fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="Comments"]/parent::td/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Comments"]/parent::td/following-sibling::td[1]//textarea').set text
    puts "The data - #{text} - has been entered in - #{fieldName} - field"
    sleep 5
  else
    writeFailure "Fail to enter data in field - #{fieldName} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

Then(/^I search a perticuler product$/) do
  sleep 2
  if page.has_xpath?('//span[text()="By Keyword"]/following-sibling::input')
    #find(:xpath, '//span[text()="By Keyword"]/following-sibling::input').set "Smoke"
    find(:xpath, '//span[text()="By Keyword"]/following-sibling::input').set $prod_name
  else
    writeFailure "Fail to find product - #{$prod_name}"
  end
end

Then(/^I should see "([^"]*)" selected under "([^"]*)" drop down$/) do |text, fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1]/div[text()="'"#{text}"'"]')
    puts "The option  - #{text} - is appearing under  - #{fieldName} - drop down"
    sleep 5
  else
    writeFailure "Fail The option  - #{text} - is NOT appearing under  - #{fieldName} - drop down"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing as checkbox field
Then(/^I should see the field "([^"]*)" as checkbox type$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 10
  Capybara.default_wait_time =10
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]/input[@type="checkbox"]')
    puts "The field  - #{field_name} - is present as - CHECKBOX - field type"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field  - #{field_name} - is present with - R - permission"
  else
    writeFailure "The field  - #{field_name} - is - NOT - present as a - CHECKBOX - field type"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission except salesops$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if (ENV['UserRole'] == "SalesOperationSit")
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      puts "The field - #{field_name} - is present with - R Only - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      writeFailure "The field - #{field_name} - is present with - RW - Permission"
    end
  else
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      puts "The field - #{field_name} - is present with - RW - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      writeFailure "The field - #{field_name} - is present with - R Only - Permission"
    else
      writeFailure "The field is not present over the page"
    end
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

Then(/^I selected the first filter product$/) do
  sleep 30
  Capybara.default_wait_time =1
  if page.has_xpath?('(//td[contains(@class,"first")]//input[@class="checkbox"])[1]')
    find(:xpath, '(//td[contains(@class,"first")]//input[@class="checkbox"])[1]').set(true)
  else
    writeFailure "Fail to select the filter record"
  end
  Capybara.default_wait_time =30
end

Then(/^I enter Quantity over Quote Line Items page$/) do
  Capybara.default_wait_time =1
  date_val=Time.now.strftime("%m/%d/%Y")
  if page.has_xpath?('//input[contains(@id,"Quantity")]')
    find(:xpath, '//input[contains(@id,"Quantity")]').set "1"
  else
    writeFailure "Fail to enter data in -- Quantity"
  end
  Capybara.default_wait_time =30
end

Then(/^I enter Sales Price over Quote Line Items page$/) do
  date_val=Time.now.strftime("%m/%d/%Y")
  if page.has_xpath?('//input[contains(@id,"UnitPrice")]')
    find(:xpath, '//input[contains(@id,"UnitPrice")]').set "1"
  else
    writeFailure "Fail to enter data in -- Sales Price"
  end
end

#Step definition to verify if the button is present over the page
Then(/^I clicked save button present over quote line item page$/) do
  begin
    sleep 12
    Capybara.default_wait_time =2
    if page.has_xpath?('(//tbody/tr[1]/td//input[@title="Save"])[1]')
      find(:xpath, '(//tbody/tr[1]/td//input[@title="Save"])[1]').click
      puts "The Save button  is clicked"
    else
      writeFailure "The Save button - is - NOT - present over the page"
    end
    #end
    Capybara.default_wait_time =30
  end
end



#Step definition to verify if the button is present over the page
Then(/^I clicked the button "([^"]*)" over the page$/) do |field_name|
  begin
    sleep 12
    Capybara.default_wait_time =2
    if page.has_xpath?('(//input[@title="'"#{field_name}"'" and contains(@class,"btn")])[1]')
      find(:xpath, '(//input[@title="'"#{field_name}"'" and contains(@class,"btn")])[1]').click
      puts "The button - #{field_name} - is clicked"
    elsif page.has_xpath?('(//input[@class="btn" and @title="'"#{field_name}"'" or @value="'"#{field_name}"'"])[1]')
      find(:xpath, '(//input[@class="btn" and @title="'"#{field_name}"'" or @value="'"#{field_name}"'"])[1]').click
      puts "The button - #{field_name} - is clicked"
    else
      writeFailure "The button - #{field_name} - is - NOT - present over the page"
    end
    #end
    Capybara.default_wait_time =30
  end
end


Then(/^I should see the field "([^"]*)" under "([^"]*)" field$/) do |field1, field2|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//*[text()="'"#{field2}"'"]/ancestor::tr[1]/following-sibling::tr[1]//*[text()="'"#{field1}"'"]')
    if page.has_xpath?('//tr/td[1]//*[text()="'"#{field2}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{field2}"'"]')==true
      if page.has_xpath?('//tr/td[1]//*[text()="'"#{field1}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{field1}"'"]')==true
        puts "The field -#{field1} - is present under - #{field2}"
      end
    end
    if page.has_xpath?('//tr/td[2]//*[text()="'"#{field2}"'"]')==true or page.has_xpath?('//tr/td[2][text()="'"#{field2}"'"]')==true
      if page.has_xpath?('//tr/td[2]//*[text()="'"#{field1}"'"]')==true or page.has_xpath?('//tr/td[2][text()="'"#{field1}"'"]')==true
        puts "The field -#{field1} - is present under - #{field2}"
      end
    end
  else
    writeFailure "The field -#{field1} - is NOT present under - #{field2}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


#Step definition to verify if the button is present over the page
Then(/^I should see the field "([^"]*)" as numeric type$/) do |field_name|
  begin
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input').set "aaa"
      step 'I click Save button from top button row'
      if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//*[contains(text(),"Invalid number")]')
        puts "The field  - #{field_name} - is of type - Number -"
        find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input').set ""
      else
        writeFailure "The field  - #{field_name} - is NOT of type - Number -"
      end
    else
      writeFailure "The field  - #{field_name} - is NOT present over the page with RW permission"
    end
  end
end

# select option from user menu
Then(/^I selected "([^"]*)" from user menu$/) do |option|
  sleep 5
  if page.has_xpath?('//div[@id="userNav-arrow"]')
    find(:xpath, '//div[@id="userNav-arrow"]').click
    sleep 5
  else
    writeFailure "Fail to click user menu"
    #fail(ArgumentError.new('Fail'))
  end
  if page.has_xpath?('(//a[@title="'"#{option}"'"])[1]')
    find(:xpath, '(//a[@title="'"#{option}"'"])[1]').click
    sleep 5
  else
    writeFailure "Fail to select #{option} option from user menu"
    #fail(ArgumentError.new('Fail'))
  end
end


When(/^I create new "([^"]*)"$/) do |entity_name|

  sleep 5
  Capybara.default_wait_time =1
  temp=[]
  field_With_Permission=[]
  arg=getDataFrom_DataCreation_YmlFile entity_name
  field_With_Permission=arg["Field_Name_Array"]
  puts field_With_Permission
  field_With_Permission.each do |field|
    #    puts field
    #    puts arg[field]
    temp=arg[field]

    field_type=temp[0]
    case field_type
    when "text"

      Capybara.default_wait_time =1
      if page.has_xpath?('//label[text()="'"#{temp[1]}"'"]/parent::td/following-sibling::td[1]//input')
        find(:xpath, '//label[text()="'"#{temp[1]}"'"]/parent::td/following-sibling::td[1]//input').set temp[2]
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

    else
      puts "The field type - #{temp[0]} - is not defiend"

    end

  end
  sleep 20
end


#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field picklist options$/) do |select_field|
  begin
    if (ENV['UserRole'] == "Admin") or (ENV['UserRole'] == "OperationManagerSit")
      sleep 5
      arg=get_PickList_Options "PicklistOptions"
      resultArray=[]
      actualArrayOption=[]
      expectedArrayOption=[]

      if page.has_select?(select_field)
        actualArrayOption=find_field(select_field).all('option').collect(&:text)
      elsif page.has_xpath?('//td[text()="'"#{select_field}"'"]')
        writeFailure "The dropdown - #{select_field} - is appearing with - R Permission -"
      elsif page.has_xpath?('//*[text()="'"#{select_field}"'"]')==false
        writeFailure "The dropdown - #{select_field} - is not present over the page"
        next
      end
      expectedArrayOption=arg[select_field]
      resultArray=expectedArrayOption.sort-actualArrayOption.sort
      if resultArray.count==0
        puts "The expected options for the field - #{select_field} - is present"
      else
        writeFailure "The following options from - #{select_field} -  dropdown is missing"
        writeFailure resultArray
      end
      resultArray=actualArrayOption.sort-expectedArrayOption.sort
      if resultArray.count!=0
        writeFailure "The following extra options are appearing in  - #{select_field} -  dropdown"
        writeFailure resultArray
      end
      sleep 5

    end
  rescue Exception => ex
    writeFailure "Error while verifying - #{select_field} - picklist option"
    writeFailure ex.message
  end
end


#Step to verify the drop down options appearing against requirement
Then(/^I should verify "([^"]*)" entity picklist options$/) do |entity_name|
  begin
    if (ENV['UserRole'] == "Admin") or (ENV['UserRole'] == "OperationManagerSit") or (ENV['UserRole'] == "OperationRepSit")
      Capybara.default_wait_time =1
      temp=[]
      resultArray=[]
      actualArrayOption=[]
      field_With_Permission=[]
      arg=get_PickList_Options entity_name
      field_With_Permission=arg["Picklist_Field_Array"]

      field_With_Permission.each do |field|
        puts field
        if page.has_select?(field)
          actualArrayOption=find_field(field).all('option').collect(&:text)
        elsif page.has_xpath?('//td[text()="'"#{field}"'"]')
          writeFailure "The dropdown - #{field} - is appearing with - R Permission -"
        elsif page.has_xpath?('//*[text()="'"#{field}"'"]')==false
          writeFailure "The dropdown - #{field} - is not present over the page"
          next
        end
        expectedArrayOption=arg[field]
        resultArray=expectedArrayOption.sort-actualArrayOption.sort
        if resultArray.count==0
          puts "The expected options for the field - #{field} - is present"
        else
          writeFailure "The following options from - #{field} -  dropdown is missing"
          writeFailure resultArray
        end
        resultArray=actualArrayOption.sort-expectedArrayOption.sort
        if resultArray.count!=0
          writeFailure "The following extra options are appearing in  - #{field} -  dropdown"
          writeFailure resultArray
        end
      end
    end
  rescue Exception => ex
    writeFailure "Error appeared"
    writeFailure ex.message
  end
  puts "--------------------------------------------------------------------------------"
end


# Verify a section over page
Then(/^I should not see the "([^"]*)" section over the page$/) do |section_Name|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
    writeFailure "The section - #{section_Name} - is present over the page"
    sleep 5
  else
    puts "The section - #{section_Name} - is NOT present over the page"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

Then(/^I should see the following:$/) do |text|
  page.should have_content(text)
end


When(/^I open the opportunity created$/) do
  sleep 3

  find(:xpath, '//input[@title="Search..."]').set $Opportunity_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"opportunityBlock")]//a[text()="'"#{$Opportunity_name}"'"]')
    find(:xpath, '//div[contains(@class,"opportunityBlock")]//a[text()="'"#{$Opportunity_name}"'"]').click
    puts "The opportunity - #{$Opportunity_name} - has been clicked"
  elsif page.has_xpath?('//div[text()="No matches found"]') or page.has_xpath?('//div[contains(@class,"opportunityBlock")]//a[text()="'"#{opportunity_name}"'"]')==false
    writeFailure("Fail to find the opportuntiy - #{$Opportunity_name} -")
  end
  sleep 15
end

Then(/^I enter "([^"]*)" in "([^"]*)" field$/) do |field_value, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//input[@type="text"]')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//input[@type="text"]').set field_value
  else
    writeFailure "Fail to enter data in --- #{field_name} -- field "
  end
  Capybara.default_wait_time =30
end

Then(/^I should see the error message "([^"]*)" under field "([^"]*)"$/) do |error_msg, field_name|
  sleep 2
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//div[contains(text(),"'"#{error_msg}"'")]')
    puts "The error message - #{error_msg} -  is appearing under field - #{field_name}"
  else
    writeFailure "Fail The error message - #{error_msg} -  is not appearing under field - #{field_name}"
  end
end


#Step definition to verify if the button is present over the page
Then(/^I clicked on Start Sync button over the page$/) do
  begin
    sleep 5
    if page.has_xpath?('(//input[@title="Start Sync"])[1]')
      find(:xpath, '(//input[@title="Start Sync"])[1]').click
      puts "The button - Start Sync - is clicked"
    else
      writeFailure "The button - Start Sync - is - NOT - clicked"
    end
    #end
    Capybara.default_wait_time =30
  end
end

Then(/^I click on "([^"]*)" button$/) do |button_name|
  sleep 5
  main = page.driver.browser.window_handles.first
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
  within("div#syncQuoteOverlay_buttons") do #within("div#syncQuoteOverlay_buttons") --> id is used inside within
    sleep 5
    click_on(button_name)
    puts "The - #{button_name} - is clicked"

  end
  page.driver.browser.switch_to.window(main)
end

Then(/^I should see the syncing checkbox checked$/) do
  sleep 30
  if page.has_xpath?('//td[text()="Syncing"]/following-sibling::td[1]//img[@title="Checked"]')
    puts "The syncing checkbox is checked"
  else
    writeFailure "Fail The syncing checkbox is not checked"
  end
end


Then(/^I open the existing record "([^"]*)"$/) do |record_type|
  sleep 5
  find(:xpath, '//input[@title="Search..."]').set record_type
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  if page.has_xpath?('(//a[text()="'"#{record_type}"'"])[1]')
    find(:xpath, '(//a[text()="'"#{record_type}"'"])[1]').click
    puts "The record - #{record_type} - is found and selected"
  elsif page.has_xpath?('//div[text()="No matches found"]') or page.has_xpath?('//div[contains(@class,"accountBlock")]//a[text()="'"#{record_type}"'"]')==false
    writeFailure "Fail to find the record - #{record_type}"

  end

  Capybara.default_wait_time =30
end

Then(/^I should see "([^"]*)" button under "([^"]*)" section for "([^"]*)" roles only$/) do |button_name, section_Name, role|
  sleep 30
  $currentRole=""
  $currentRole=ENV['UserRole']
  #$currentRole.slice! "Sit"
  #$currentRole=$currentRole.strip
  if role.include? $currentRole
    if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
      if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]/ancestor::div[1]//*[@title="'"#{button_name}"'" and @type="button"]')
        puts "The button -#{button_name}- is present under #{section_Name} section"
      else
        writeFailure"The button  - #{button_name} - is NOT present under #{section_Name} section"
        #fail(ArgumentError.new('Fail'))
      end
    else
      writeFailure "Fail to find the section - #{section_Name} over the page"
    end
  else
    if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
      if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]/ancestor::div[1]//*[@title="'"#{button_name}"'" and @type="button"]')==false
        puts "The button -#{button_name}- is NOT present under #{section_Name} section"
      else
        writeFailure"The button  - #{button_name} - is present under #{section_Name} section"
        #fail(ArgumentError.new('Fail'))
      end
    else
      writeFailure "Fail to find the section - #{section_Name} over the page"
    end
  end
end


And(/^I click on the "([^"]*)" button$/) do |button_text|
  begin
    sleep 3
    if page.has_button?(button_text)
      click_on button_text
      sleep 2
      puts "Successfully click the #{button_text} button"
    else
      raise "Failed to see the #{button_text} button"
    end
  rescue Exception => ex
    raise "Error occurred while clicking on #{button_text} button"
  end
end


When(/^I click on the "([^"]*)" tab$/) do |tab|
  begin
    sleep 5
    first(:link, tab).click
    sleep 10
    puts "Successfully navigated to #{tab} tab"
  rescue Exception => ex
    putstr "Error occurred while navigate to the #{tab} tab"
  end
end


When(/^I click on "([^"]*)" link$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} link"
      click_on name
    else
      raise "Failed to see the #{name} link"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{name} link"
  end
end


When(/^I select the "([^"]*)" from "([^"]*)" pickList field$/) do |option, field|
  sleep 3
  if page.has_content?(field)
    puts "Successfully see the #{field} field"
    if page.has_css?("#p3")
      puts "Successfully see the #{field} pickList"
      sleep 2
      result = false
      find("#p3").all('option').each do |record_type|

        if record_type.text.to_s == option.to_s
          puts "Successfully see the #{field} pickList value: #{option}"
          result = true
          sleep 3
          find("#p3").send_keys option
        end
      end
      raise "Failed to see the #{field} pickList value: #{option}" unless result
      sleep 3
    else
      putstr "Failed to see the #{field} pickList"
    end
  else
    putstr "Failed to see the #{field} field"
  end
end


When(/^I click on "([^"]*)" link from user menu$/) do |setup|
  begin
    sleep 2
    find("#userNavButton").click
    sleep 2
    within("#userNav-menuItems") do
      click_on setup
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{setup} link"
  end
end

And(/^I click on "([^"]*)" button from new "([^"]*)" page$/) do |save, context|
  begin
    sleep 4
    within("#topButtonRow") do
      if page.has_button? save
        puts "Successfully see the #{save} button from #{context} page"
        click_on save
        sleep 4
      else
        putstr "Failed to see the #{save} button from #{context} page"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{save} button from #{context} page"
  end
end


Then(/^I able to see the "([^"]*)" page$/) do |content|
  begin
    sleep 6
    if page.has_content? content
      puts "Successfully see the the #{content} page"
    else
      putstr "Failed to see the #{content} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{content} page"
  end
end

Then(/^I able to see the "([^"]*)" name$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} name"
    else
      putstr "Failed to see the #{name} name"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} name"
  end
end


And(/^I select the "([^"]*)" is "([^"]*)"$/) do |priority, state|
  begin
    sleep 3
    within all(".pbSubsection")[0] do

      $priority_status = state

      if page.has_select?(priority)
        select(state, :from => priority)
      end
      puts "Successfully selected the #{priority} is #{state}"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{priority} is #{state}"
  end
end


When(/^I select the "([^"]*)" filter$/) do |filter_name|
  begin
    sleep 4
    if page.has_css?("#fcf")
      find('#fcf').select filter_name
      sleep 4
      puts "Successfully selected the opportunity filter: #{filter_name}"
    else
      putstr "Failed to selected the opportunity filter: #{filter_name}"
    end

    if page.has_css?(".fBody")
      within (".fBody") do
        click_button 'Go!'
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the opportunity filter: #{filter_name}"
  end
end


And(/^I should not able to see the "([^"]*)" button$/) do |button|
  begin
    sleep 3
    unless page.has_content?(button)
      puts "Unable to see the #{button} button"

      unless page.has_button?(button)
        puts "#{button} button is not visible"
      else
        putstr "#{button} button is visible"
      end
    else
      putstr "Able to see the #{button} button"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{button} button"
  end
end


When(/^I click on the "([^"]*)" button from "([^"]*)" page$/) do |save, product_edit|
  begin
    sleep 3
    within("#topButtonRow") do
      if page.has_button? save
        puts "Successfully see the #{save} button from #{product_edit} page"
        click_on save
      else
        putstr "Failed to see the #{save} button from #{product_edit} page"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{save} button from #{product_edit} page"
  end
end


When(/^I search the "([^"]*)" name$/) do |opportunity|
  begin
    sleep 5
    arg = getDetails 'NewOpportunitiesInformation'

    if page.has_css?("#phSearchInput")
      puts "Successfully see the search text box"
      sleep 4
      find("#phSearchInput").send_keys arg["OpportunityNameValue"]
      sleep 4
      puts "Successfully fill the Opportunity name: #{arg["OpportunityNameValue"]}"

      within("#searchButtonContainer") do
        first("#phSearchButton").click
        puts "Successfully clicked the Search button"
      end
    else
      putstr "Failed to see the search text box"
    end
  rescue Exception => ex
    putstr "Error occurred while searching the #{opportunity} name"
  end
end


Then(/^I able to see the "([^"]*)" search results$/) do |opportunity|
  begin
    sleep 3
    arg = getDetails 'NewOpportunitiesInformation'

    unless page.has_content? arg["NoOpportunitiesMessage"]
      if page.has_css?("#secondSearchButton")
        puts "Successfully see the #{opportunity} search button"
        sleep 3
        if page.has_css?("#Opportunity")
          puts "Successfully see the #{opportunity} search results"
          sleep 3
        else
          putstr "Failed to see the #{opportunity} search results"
        end
      else
        putstr "Failed to see the #{opportunity} search button"
      end
    else
      putstr "No #{opportunity} results records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity} record"
  end
end


When(/^I click the "([^"]*)" record$/) do |opportunity|
  begin
    sleep 5
    arg = getDetails 'NewOpportunitiesInformation'

    unless page.has_content? arg["NoOpportunitiesMessage"]
      if page.has_css?("#Opportunity")
        puts "Successfully see the #{opportunity} search results"
        sleep 4

        within(".listRelatedObject.opportunityBlock") do
          within("#Opportunity_body") do
            tr = first("tbody").all(".dataRow")
            sleep 3
            result = false
            tr.each do |row|
              if row.first("th").first("a").text.include? arg["OpportunityNameValue"]
                puts "Successfully see the #{opportunity} record"
                row.first("th").first("a").click
                sleep 5
                puts "Successfully clicked the #{opportunity} record"
                result = true
                break
              end
            end
            putstr "Failed to see the #{opportunity} record" unless result
            sleep 3
          end
        end
      else
        putstr "Failed to see the #{opportunity} search record"
      end
    else
      putstr "No #{opportunity} results records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity} record"
  end
end


When(/^I click on "([^"]*)" link under "([^"]*)" section$/) do |opportunities, customize|
  begin
    sleep 3
    if page.has_content? customize
      puts "Successfully see the the #{customize} section"

      if page.has_css?("#Opportunity_font")
        puts "Successfully see the #{opportunities} link under #{customize} section"

        find("#Opportunity_font").click
        sleep 4
        puts "Successfully clicked the #{opportunities} link under #{customize} section"

      else
        putstr "Failed to see the #{opportunities} link under #{customize} section"
      end

    else
      putstr "Failed to see the #{customize} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{opportunities} link under #{customize} section"
  end
end



When(/^I click on "([^"]*)" button from "([^"]*)" page$/) do |name, currency|
  begin
    sleep 3
    if page.has_button? name
      puts "Successfully see the #{name} button"
      find(:xpath,"//input[@title='#{name}']").click
      sleep 2
      puts "Successfully click the #{name} button"
    else
      putstr "Failed to see the #{name} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{name} button from #{currency} page"
  end
end


