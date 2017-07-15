Then(/^I should see Fiscal Year Start Month as "([^"]*)"$/) do |month_name|
  sleep 5
  if page.has_xpath?('//select[contains(@id,"start_month")]/option[@selected="selected" and text()="'"#{month_name}"'"]')
    puts "Fiscal Year Start Month is appeaering as - #{month_name}"
  else
    writeFailure"Fiscal Year Start Month is not appeaering as -#{month_name}"
    #fail(ArgumentError.new('Fail'))
  end
end

# click a link present under App Setup
Then(/^I should see only "([^"]*)" Currency Code as active currency$/) do |currency_Code|
  sleep 5
  #within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]//div')do
  if page.has_xpath?('//h3[text()="Active Currencies"]//ancestor::div[contains(@class,"listRelatedObject")]//th[text()="'"#{currency_Code}"'"]')
    puts "The Currency Code - #{currency_Code} - is appearing under Active Currencies section"
    #    temp=page.all(:xpath, '//th[text()="'"#{currency_Code}"'"]/ancestor::table[1]//tr').count
    #    puts temp
    actualArrayOption=find(:xpath, '//th[text()="'"#{currency_Code}"'"]/ancestor::table[1]').all('tr')
    puts actualArrayOption.count
    if actualArrayOption.count > 2
      puts "- #{currency_Code} - is the only Currency Code appearing in the Active Currencies section"
    else
      writeFailure "- #{currency_Code} - is not the only Currency Code appearing in the Active Currencies section"
    end
    sleep 5
  else
    writeFailure "The Currency Code - #{currency_Code} - is NOT appearing under Active Currencies section"
  end
end
#end

# click a link present under App Setup
Then(/^I clicked the "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
  sleep 5
  #within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div')do
  if page.has_xpath?('//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  else
    writeFailure "Fail to click - #{link_text} - link"
    #fail(ArgumentError.new('Fail'))
  end
end
#end

# click a link present under App Setup
Then(/^I click "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
  sleep 5
  #within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]//div')do
  if page.has_xpath?('//a[text()="'"#{header_name}"'"]/parent::div[1]//a[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{header_name}"'"]/parent::div[1]//a[text()="'"#{link_text}"'"]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  else
    writeFailure "Fail to click - #{link_text} - link"
  end
end
#end

# Verify if the checkbox is enabled for the fields
Then(/^I should see that track history has been enabled for "([^"]*)" field$/) do |fieldName|
  sleep 5
  if page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Checked"]')
    puts "The track history has been enabled for - #{fieldName} - field"
    sleep 5
  elsif page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Not Checked"]')
    writeFailure "The track history has - NOT - been enabled for - #{fieldName} - field"
    #fail(ArgumentError.new('Fail'))
    sleep 5
  else
    writeFailure "Fail to verify track history status for - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify error message over the page
Then(/^I click the button "([^"]*)" over the page$/) do |button_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//input[@class="btn" and @title="'"#{button_name}"'"]')
    find(:xpath, '//input[@class="btn" and @title="'"#{button_name}"'"]').click
    puts "The button - #{button_name} - has been clicked"
    sleep 7
  else
    writeFailure "The button - #{button_name} - is not present over the page"
  end
  Capybara.default_wait_time =30
end

Then(/^I enter "([^"]*)" in "([^"]*)" field$/) do |field_value, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]').set field_value
  else
    writeFailure "Fail to enter data in --- #{field_name} -- field "
  end
  Capybara.default_wait_time =30
end

Then(/^I enter data in "([^"]*)" field$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  data="smoke Test-Contact_"+Random.new.rand(111..9999).to_s
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]').set data
  else
    writeFailure "Fail to enter data in --- #{field_name} -- field "
  end
  Capybara.default_wait_time =30
end


# click a link present under App Setup
Then(/^I should see Currency Code "([^"]*)"$/) do |currency_Code|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//th[text()="Currency Code"]/parent::tr[1]/following-sibling::tr/th[text()="'"#{currency_Code}"'"]')
    puts "The Currency Code - #{currency_Code} - is presennt over the page"
    sleep 5
  else
    writeFailure "The Currency Code - #{currency_Code} - is not presennt over the page"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

When(/^I click "([^"]*)" in setup$/) do |link_name|
  if page.has_xpath?('//div/a[text()="'"#{link_name}"'"]')
    find(:xpath, '//div/a[text()="'"#{link_name}"'"]').click
    puts"The link - #{link_name} - has been clicked"
  else
    writeFailure 'FAIL to click the link - #{link_name}'
  end
end

# click a link present under App Setup
Then(/^I clicked the link "([^"]*)"$/) do |currency_Code|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{currency_Code}"'"]')
    find(:xpath, '//a[text()="'"#{currency_Code}"'"]').click
    puts "The link #{currency_Code} has been clicked"
    sleep 5
  else
    writeFailure "FAIL to click the link #{currency_Code}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# click a link present under App Setup
Then(/^I clicked the link "([^"]*)" object$/) do |currency_Code|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//th/a[text()="'"#{currency_Code}"'"]')
    find(:xpath, '//th/a[text()="'"#{currency_Code}"'"]').click
    puts "The link #{currency_Code} has been clicked"
    sleep 5
  else
    writeFailure "FAIL to click the link #{currency_Code}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


# click a link present under App Setup
Then(/^I should see "([^"]*)" as "([^"]*)"$/) do |day_Name, hours|
  sleep 5
  Capybara.default_wait_time =30
  if page.has_xpath?('//label[text()="'"#{day_Name}"'"]/parent::td[1]/following-sibling::td[text()="'"#{hours}"'"]')
    puts "The day name - #{day_Name} - is showing value as -- #{hours}--"
    sleep 5
  else
    writeFailure "The day name - #{day_Name} - is NOT showing value as -- #{hours}--"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# click a link present under App Setup
Then(/^I should see "([^"]*)" as "([^"]*)" and "([^"]*)" and "([^"]*)"$/) do |day_Name, start_hours, to, end_hours|
  sleep 5
  Capybara.default_wait_time =30
  if page.has_xpath?('//label[text()="'"#{day_Name}"'"]/parent::td[1]/following-sibling::td[text()="'"#{start_hours}"'"]/following-sibling::td[text()="'"#{to}"'"]/following-sibling::td[text()="'"#{end_hours}"'"]')
    puts "The day name - #{day_Name} - is showing value as -- #{start_hours} #{to} #{end_hours}--"
    sleep 5
  else
    writeFailure "The day name - #{day_Name} - is NOT showing value as -- #{start_hours} #{to} #{end_hours}--"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# click a link present under App Setup
Then(/^I should see "([^"]*)" active checkbox unchecked$/) do |checkBox_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{checkBox_name}"'"]/ancestor::tr[1]//img[@title="Not Checked"]')
    find(:xpath, '//a[text()="'"#{checkBox_name}"'"]/ancestor::tr[1]//img[@title="Not Checked"]').click
    puts "The checkbox - #{checkBox_name} - is not checked"
    sleep 5
  else
    writeFailure "The checkbox - #{checkBox_name} - is checked"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# click a link present under App Setup
Then(/^I clicked the "([^"]*)" link over page$/) do |link_text|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[contains(text(),"'"#{link_text}"'")]')
    find(:xpath, '//a[contains(text(),"'"#{link_text}"'")]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  elsif page.has_xpath?('//a/span[text()="'"#{link_text}"'"]')
    find(:xpath, '//a/span[text()="'"#{link_text}"'"]').select_option
    find(:xpath, '//a/span[text()="'"#{link_text}"'"]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  else
    writeFailure "Fail to click - #{link_text} - link"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the checkbox is checked
Then(/^I should see the checkbox checked for the field "([^"]*)" over the page$/) do |link_text|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[contains(text(),"'"#{link_text}"'")]/parent::td[1]/following-sibling::td[1]/input[@checked="checked"]')
    puts "The checkbox - #{link_text} - is checked"
    sleep 5
  else
    writeFailure "The checkbox - #{link_text} - is not checked"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


#Step to verify the drop down options appearing against requirement
Then(/^I should see given currency code$/) do
  begin
    sleep 5
    currencyCode=[]
    arg=getGeneralDetails "CommonData"
    currencyCode=arg["CurrencyCode"]
    currencyCode.each do |code|
      Capybara.default_wait_time =1
      if page.has_xpath?('//th[text()="'"#{code}"'"]')
        puts "The currency code - #{code} - is present over the page"
      else
        writeFailure "FAIL The currency code - #{code} - is not appearing over the page"
      end
    end  
  rescue Exception => ex
    writeFailure "Error appeared while verifying currency code"
    writeFailure ex.message
  end
  Capybara.default_wait_time =30
end



Then(/^I should verify users$/) do
  begin
    sleep 10
    temp=""
    arg=getGeneralDetails 'AdminUsers'
    excelsheet= WIN32OLE.new('excel.application')
    wrkbook= excelsheet.Workbooks.Open(arg["File_Path"])
    wrksheet= wrkbook.Worksheets(arg["SheetName"])
    wrksheet.Select

    i=arg["Start_Row"]
    puts "----------------------------------------------------------------------------------------"
   
    Capybara.default_wait_time =1
    for counter in i..wrksheet.UsedRange.Rows.Count

      lastName=arg["LastName"]+i.to_s
      lastName=wrksheet.Range(lastName).Value
      if lastName.nil?
        writeFailure "LastName -- is not found under cell --- #{arg["LastName"]+i.to_s}"
      else
        lastName=lastName.strip
      end

      firstName=arg["FirstName"]+i.to_s
      firstName=wrksheet.Range(firstName).Value
      if firstName.nil?
        writeFailure "FirstName -- is not found under cell --- #{arg["FirstName"]+i.to_s}"
      else
        firstName=firstName.strip
      end

      userName=arg["UserName"]+i.to_s
      userName=wrksheet.Range(userName).Value
      if userName.nil?
        writeFailure "UserName -- is not found under cell --- #{arg["UserName"]+i.to_s}"
      else
        userName=userName.strip
      end

      persona=arg["Persona"]+i.to_s
      persona=wrksheet.Range(persona).Value
      if persona.nil?
        writeFailure "persona -- is not found under cell --- #{arg["Persona"]+i.to_s}"
      else
        persona=persona.strip
      end

      userStatus=arg["UserStatus"]+i.to_s
      userStatus=wrksheet.Range(userStatus).Value
      if userStatus.nil?
        writeFailure "persona -- is not found under cell --- #{arg["UserStatus"]+i.to_s}"
      else
        userStatus=userStatus.strip
      end

      profile=arg["Profile"]+i.to_s
      profile=wrksheet.Range(profile).Value
      if profile.nil?
        writeFailure "Profile -- is not found under cell --- #{arg["Profile"]+i.to_s}"
      else
        profile=profile.strip
      end
      username1=lastName+", "+firstName
      name_filter=lastName.to_s.chars.first

      if page.has_xpath?('//span[text()="'"#{name_filter}"'" and (@class="listItemSelected" or @class="listItemPad")]')
        find(:xpath, '(//span[text()="'"#{name_filter}"'" and (@class="listItemSelected" or @class="listItemPad")])[1]').click
      end

      if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]')
        if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{firstName}"'")]')
          puts "The first name is present as -#{firstName}"
          puts "The User name is present as -- #{userName} -- "
        else
          writeFailure "The first name is not present as -#{firstName} - for user -#{userName}"
        end
        if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{lastName}"'")]')
          puts "The last name is present as -#{lastName}"
        else
          writeFailure "The last name is not present as -#{lastName} - for user -#{userName}"
        end
        #        if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td/img[@title="Checked"]')
        #          puts "The user name - #{userName} - is active"
        #        else
        #          writeFailure "The user name - #{userName} - is NOT active"
        #        end
        if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td/a[text()="'"#{profile}"'"]')
          puts "The user profile is present as -#{profile}"
        else
          writeFailure "The profile is not present as  - #{profile}"
        end
      else
        writeFailure "The user name - #{userName}- is not found"
      end
      
      puts "----------------------------------------------------------------------------------------"
      i=i+1
    end
    excelsheet.Quit();
    Capybara.default_wait_time =30
  end
end

#Verify link over page
Then(/^I should see the link "([^"]*)" over the page$/) do |link_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{link_name}"'"]')
    puts "The link - #{link_name} - is present over the page"
  else
    writeFailure "FAIL The link - #{link_name} - is not appearing over the page"
  end
end

## select option from user menu
#Then(/^I selected "([^"]*)" from user menu$/) do |option|
#  sleep 5
#  if page.has_xpath?('//div[@id="userNav-arrow"]')
#    find(:xpath, '//div[@id="userNav-arrow"]').click
#    sleep 5
#  else
#    writeFailure "Fail to click user menu"
#    #fail(ArgumentError.new('Fail'))
#  end
#  if page.has_xpath?('(//a[@title="'"#{option}"'"])[1]')
#    find(:xpath, '(//a[@title="'"#{option}"'"])[1]').click
#    sleep 5
#  else
#    writeFailure "Fail to select #{option} option from user menu"
#    #fail(ArgumentError.new('Fail'))
#  end
#end

# Verify if the checkbox is checked
Then(/^I should see the rule "([^"]*)" unchecked$/) do |link_text|
  sleep 5

  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{link_text}"'"]/ancestor::tr[1]//td/img[@title="Not Checked"]')
    puts "The checkbox - #{link_text} - not is checked"
    sleep 5
  else
    writeFailure "The checkbox - #{link_text} - is checked"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the checkbox is checked
Then(/^I should see the rule "([^"]*)" checkbox checked$/) do |link_text|
  sleep 5

  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{link_text}"'"]')
    if page.has_xpath?('//a[text()="'"#{link_text}"'"]/ancestor::tr[1]//td/img[@title="Checked"]')
      puts "The checkbox - #{link_text} - is checked"
      sleep 5
    else
      writeFailure "The checkbox - #{link_text} - is not checked"
      #fail(ArgumentError.new('Fail'))
    end
  else
    writeFailure "The checkbox - #{link_text} - is not present over the page"
  end
  
  Capybara.default_wait_time =30
end

# Verify if the checkbox is checked
Then(/^I click "([^"]*)" present under "([^"]*)"$/) do |link_text, div_name|
  sleep 5

  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{link_text}"'"]/parent::div[1]//a[text()="'"#{div_name}"'"]')
    find(:xpath, '//a[text()="'"#{link_text}"'"]/parent::div[1]//a[text()="'"#{div_name}"'"]').click
    puts "The link - #{link_text} - is clicked"
    sleep 5
  else
    writeFailure "FAIL to click the link - #{link_text} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


# Verify if the checkbox is checked
Then(/^I click "([^"]*)" next to "([^"]*)"$/) do |link_text, div_name|
  sleep 5

  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{div_name}"'"]/ancestor::tr[1]//*[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{div_name}"'"]/ancestor::tr[1]//*[text()="'"#{link_text}"'"]').click
    puts "The link - #{link_text} - is clicked"
    sleep 5
  else
    writeFailure "FAIL to click the link - #{link_text} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see given exchange rate$/) do
  begin
    sleep 5

    arg=getGeneralDetails "CommonData"
    arg1=getGeneralDetails "ExchangeRate"
    currencyCode=arg["CurrencyCode"]

    currencyCode.each do |code|
      Capybara.default_wait_time =1
      if page.has_xpath?('//th[text()="'"#{code}"'"]')
        puts code
        exchange_rate=arg1[code].to_f
        puts "Exchange rate"
        puts exchange_rate
        rate_in_application=find(:xpath, '(//th[text()="'"#{code}"'"]/following-sibling::td[contains(@class,"numericalColumn")])[1]').text
        rate_in_application=rate_in_application.to_s  #converting to string, that removes all the trailing zero.
        rate_in_application=rate_in_application.to_f
        puts rate_in_application
        if rate_in_application==exchange_rate
          puts "The currency code - #{code} - is present with correct exchange rate - #{exchange_rate} -"
        else
          writeFailure "The currency code - #{code} - expected rate is  - #{exchange_rate} - Actual rate is -#{rate_in_application} -"
        end
      else
        writeFailure "The currency code - #{code} - is not present over the page"
      end
    end

  rescue Exception => ex
    writeFailure "Error appeared while verifying currency code"
    writeFailure ex.message
  end
  Capybara.default_wait_time =30
end


# Verify if the checkbox is checked
Then(/^I should see "([^"]*)" rule under "([^"]*)" section$/) do |link_text, div_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h3[text()="'"#{div_name}"'"]/ancestor::div[contains(@class,"setupBlock")]//a[text()="'"#{link_text}"'"]')
    puts "The link - #{link_text} - is present under - #{div_name} - section"
    sleep 5
  else
    writeFailure "FAIL - The link - #{link_text} - is NOT present under - #{div_name} - section"
  end
  Capybara.default_wait_time =30
end

When(/^I should see given currency with "([^"]*)" data$/) do |entity_name|

  sleep 5
  Capybara.default_wait_time =1
  temp=[]
  currency_name=[]
  arg=getGeneralDetails entity_name
  currency_name=arg["CurrencyCode"]
  puts currency_name
  currency_name.each do |field|
   
    temp=arg[field]
    puts temp
    if page.has_xpath?('//th[text()="Currency Code"]/parent::tr[1]/following-sibling::tr//*[text()="'"#{temp[0]}"'"]')
      puts "The currency code - #{temp[0]} - is present over the page"
      if page.has_xpath?('//*[text()="'"#{temp[0]}"'"]/following-sibling::*[text()="'"#{temp[1]}"'"]')
        puts "The currency - #{temp[0]} - with Conversion Rate - #{temp[1]} - is present over the page"
      else
        writeFailure "FAIL - The currency - #{temp[0]} - with Conversion Rate - #{temp[1]} - is NOT present over the page"
      end
    else
      writeFailure "The currency code - #{temp[0]} - is NOT present over the page"
    end
    
  end
end

When(/^I should see the "([^"]*)"$/) do |currency_code|

  sleep 5
  Capybara.default_wait_time =1
  temp=[]
  currency_name=[]
  arg=getGeneralDetails "CommonData"
  currency_name=arg[currency_code]
  puts currency_name
  currency_name.each do |temp|

    puts temp
    if page.has_xpath?('//th[text()="Currency Code"]/parent::tr[1]/following-sibling::tr//*[text()="'"#{temp}"'"]')
      puts "The currency code - #{temp} - is present over the page"
    else
      writeFailure "The currency code - #{temp} - is NOT present over the page"
    end
  end
end

# Verify if the checkbox is checked
Then(/^I should see "([^"]*)" radio button checked$/) do |chackbox_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//input[@checked="checked"]/following-sibling::label[text()="'"#{chackbox_name}"'"]')
    puts "The radio button - #{chackbox_name} - is checked"
    sleep 5
  else
    writeFailure "FAIL - The radio button - #{chackbox_name} - is NOT checked"    
  end
  Capybara.default_wait_time =30
end

# Verify if the checkbox is checked
Then(/^I should see the checkbox "([^"]*)" checked$/) do |chackbox_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//th[contains(text(),"'"#{chackbox_name}"'")]/following-sibling::td[1]//*[@title="Checked"]')
    puts "The checkbox - #{chackbox_name} - is checked"
    sleep 5
  else
    writeFailure "FAIL - The checkbox - #{chackbox_name} - is NOT checked"
  end
  Capybara.default_wait_time =30
end


# Verify if the checkbox is checked
Then(/^I should see the field "([^"]*)" is showing data as "([^"]*)"$/) do |field_name, data_text|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//th[contains(text(),"'"#{field_name}"'")]/following-sibling::td[1]//*[text()="'"#{data_text}"'"]')
    puts "The field -#{field_name} - is showing data as - #{data_text}"
    sleep 5
  else
    writeFailure "FAIL - The field -#{field_name} - is NOT showing data as - #{data_text}"
  end
  Capybara.default_wait_time =30
end


# Verify if the checkbox is checked
Then(/^I should see Track History checkbox check for "([^"]*)"$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//*[text()="'"#{field_name}"'"]/ancestor::tr[1]//td[6]//img[@title="Checked"]')
    puts "Track History for the field -#{field_name} - is checked"
    sleep 5
  elsif page.has_xpath?('//*[text()="'"#{field_name}"'"]/ancestor::tr[1]//td[9]//img[@title="Checked"]')
    puts "Track History for the field -#{field_name} - is checked"
  else
    writeFailure "FAIL - Track History for the field -#{field_name} - is NOT checked"
  end
  Capybara.default_wait_time =30
end

# Verify if the checkbox is checked
Then(/^I should see Track History checkbox not check for "([^"]*)"$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//*[text()="'"#{field_name}"'"]/ancestor::tr[1]//td[6]//img[@title="Checked"]')
    writeFailure "Track History for the field -#{field_name} - is checked"
    sleep 5
  elsif page.has_xpath?('//*[text()="'"#{field_name}"'"]/ancestor::tr[1]//td[9]//img[@title="Checked"]')
    writeFailure "Track History for the field -#{field_name} - is checked"
  else
    puts "FAIL - Track History for the field -#{field_name} - is NOT checked"
  end
  Capybara.default_wait_time =30
end


# Verify if the checkbox is checked
Then(/^I should see rule "([^"]*)" is "([^"]*)" to "([^"]*)"$/) do |field1_text, symbol, field2_text|
  sleep 5
  Capybara.default_wait_time =1
  #if page.has_xpath?('//option[@selected="selected"  and text()="'"#{field1_text}"'"]/ancestor::tr[1]//span[text()="'"#{symbol}"'"]/ancestor::tr[1]//span[text()="'"#{field2_text}"'"]')
  if page.has_xpath?('//option[@selected="selected"  and text()="'"#{field1_text}"'"]/ancestor::tr[1]//span[text()="'"#{field2_text}"'"]')
    if page.has_xpath?('//option[@selected="selected"  and text()="'"#{field1_text}"'"]/ancestor::tr[1]//*[contains(text(),"=")]')
      puts "The - #{field1_text} - is - #{symbol} - to - #{field2_text}"
    end
  else
    writeFailure "FAIL - The - #{field1_text} - is - #{symbol} - to - #{field2_text}  -- is not present over the page"
  end
  Capybara.default_wait_time =30
end
