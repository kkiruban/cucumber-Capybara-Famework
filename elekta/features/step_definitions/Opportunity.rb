
Given(/^I should navigate to salesforce Home page$/) do
  value = getCredentialInfo
  visit get_url
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 20
end

Then(/^I should see salesforce home page succesfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Salesforce - Performance Edition"
    puts "succesfully visited home page"
  else
    writeFailure "Not visited home page successfully"
  end
end

When(/^I click on Opportunity tab from all tabs section$/) do
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 20
  find(:xpath,".//a[@class='listRelatedObject opportunityBlock title']").click
  sleep 20
end

Then(/^I should see Opportunity page succesfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Opportunities: Home ~ Salesforce - Performance Edition"
    puts "succesfully visited home page"
  else
    writeFailure "Not visited home page successfully"
  end
end

When(/^I click on continue button to create a new opportunity$/) do
  within(:id,'bottomButtonRow') do
    click_on "Continue"
  end
end

Then(/^I should see following:$/) do |string|
  if page.has_content?(string)
    puts "string is visible"
  else
    writeFailure "Failed to see following string"
  end
end

Then(/^I should see Sub Stage picklist values in new opportunity page layout$/) do
  if page.has_field?("Sub Stage")
    actualvalues = find_field("Sub Stage", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Pending Legal","Third Party Bid"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Sub Stage picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)  
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Sub Stage picklist"
    end
  else
    writeFailure "Sub Stage field not visible"
  end
end


Then(/^I should see "([^"]*)" field with read and write permission for Ops Manager Ops Rep and Sales Manager$/) do |value|
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "SalesManagerSit")
    if page.has_field?(value)
      puts "#{value} field is visible with editable permission"
    elsif page.has_content?(value)
      writeFailure "#{value} field is visible with readable permission"
    else
      writeFailure "#{value} field is not visible"
    end
  else
    if page.has_field?(value)
      writeFailure "#{value} field is visible with editable permission"
    elsif page.has_content?(value)
      puts "#{value} field is visible with readable permission"
    else
      writeFailure "#{value} field is not visible"
    end
  end
end

Then(/^I should see Client Region picklist values in new opportunity page layouts$/) do
  if page.has_field?("Client Region")
    actualvalues = find_field("Client Region", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Benelux","Central Europe","DACH","France","Iberia","Italy","Mexico","Brazil","RNA","Turkey","South Africa","UK&I","Nordics","Puerto Rico"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Client Region picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Client Region picklist"
    end
  else
    writeFailure "Client Region field not visible"
  end
end

Then(/^I should see Client Territory picklist values in new opportunity page layouts$/) do
  if page.has_field?("Client Territory")
    actualvalues = find_field("Client Territory", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Americas","EMEA"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Client Territory picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Client Territory picklist"
    end
  else
    writeFailure "Client Territory field not visible"
  end
end

Then(/^I should verify Price Book is marked as mandantory field in new opportunity page layout$/) do
  if page.has_xpath?("//div[@class='requiredInput'][span[*[@id='Pricebook2']]]")
    puts "Price Book is marked as mandantory field in new opportunity page layout"
  else
    writeFailure "Price Book is not marked as mandantory field in new opportunity page layout"
  end
end

Then(/^I should see Batch Type picklist values in new opportunity page layout$/) do
  if page.has_field?("Batch Type")
    actualvalues = find_field("Batch Type", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--", "Expired", "IBOW", "Renewal", "Warranty", "Adds/Recovery Expired", "Adds/Recovery Renewal", "Adds/Recovery Uncovered", "Campaign"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Batch Type picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Batch Type picklist"
    end
  else
    writeFailure "Batch Type field not visible"
  end
end

Then(/^I should see Billing Frequency picklist values in new opportunity page layout$/) do
  if page.has_field?("Billing Frequency")
    actualvalues = find_field("Billing Frequency", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","In Advance","Annual","Quarterly","Monthly","In Arrears - Monthly","In Arrears - Quarterly","In Arrears - Annually"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Billing Frequency picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Billing Frequency picklist"
    end
  else
    writeFailure "Billing Frequency field not visible"
  end
end

Then(/^I should see Client Sub\-Region picklist values in new opportunity page layout$/) do
  if page.has_field?("Client Sub-Region")
    actualvalues = find_field("Client Sub-Region", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues =  ["--None--", "Central", "Midwest", "North", "South", "West","Canada"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Client Sub-Region picklist" 
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Client Sub-Region picklist"
    end
  else
    writeFailure "Client Sub-Region field not visible"
  end
end

Then(/^I should see create Opportunity page succesfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Opportunity Edit: New Opportunity ~ Salesforce - Performance Edition"
    puts "succesfully visited home page"
  else
    writeFailure "Not visited home page successfully"
  end
end

When(/^I enter all mandantory fields to create new random opportunity$/) do
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "OperationManagerProd") || (ENV['UserRole'] == "OperationRepProd") || (ENV['UserRole'] == "AdminSit")
    randomvalue=('0000'..'9999').to_a.sample
    $newopportunity = "smoke-test-opportunity-" + randomvalue
    sleep 5
    puts $newopportunity
    fill_in('Opportunity Name', with: $newopportunity, match: :prefer_exact)
    fill_in('Account Name', with: "smoke-test-account-123", match: :prefer_exact)
    select('Not Contacted', :from => 'Stage', match: :prefer_exact)
    fill_in('Price Book', with: "Standard Price Book", match: :prefer_exact)
    fill_in('Close Date', with: " 7/21/2017", match: :prefer_exact)
    select('Volume', :from => 'Opportunity Type', match: :prefer_exact)
    select('Direct', :from => 'Direct/Channel', match: :prefer_exact)
    select('EMEA', :from => 'Client Territory', match: :prefer_exact)
    select('Turkey', :from => 'Client Region', match: :prefer_exact)
#    select('West', :from => 'Client Sub-Region', match: :prefer_exact)
    select('United States', :from => 'Country', match: :prefer_exact)
    select('NALA', :from => 'SSI Theatre', match: :prefer_exact)
    sleep 15
  else
    randomvalue=('0000'..'9999').to_a.sample
    $newopportunity = "smoke-test-opportunity-" + randomvalue
    sleep 5
    fill_in('Opportunity Name', with: $newopportunity, match: :prefer_exact)
    fill_in('Account Name', with: "smoke-test-account-123", match: :prefer_exact)
    select('Not Contacted', :from => 'Stage', match: :prefer_exact)
    fill_in('Price Book', with: "Standard Price Book", match: :prefer_exact)
    fill_in('Close Date', with: " 7/21/2017", match: :prefer_exact)
    select('Volume', :from => 'Opportunity Type', match: :prefer_exact)
    select('Direct', :from => 'Direct/Channel', match: :prefer_exact)
    select('EMEA', :from => 'Client Territory', match: :prefer_exact)
    select('RNA', :from => 'Client Region', match: :prefer_exact)
    select('United States', :from => 'Country', match: :prefer_exact)
    select('NALA', :from => 'SSI Theatre', match: :prefer_exact)
    sleep 15
  end
end

When(/^I click on Renewal Opportunity under Renewable Line Item Detail section$/) do
  click_on $newopportunity
  sleep 20
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field_name, value|
  fill_in(field_name, with: value, match: :prefer_exact)
end