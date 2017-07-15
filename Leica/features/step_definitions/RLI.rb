Given(/^I should navigate to salesforce Home page$/) do
  visit get_url
  sleep 15
  value = getCredentialInfo
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
  randomvalue=('0000'..'9999').to_a.sample
  $newopportunity = "smoke-test-opportunity-" + randomvalue
  sleep 5
  fill_in('Opportunity Name', with: $newopportunity, match: :prefer_exact)
  fill_in('Account Name', with: "smoke-test-account-123", match: :prefer_exact)
  select('Not Contacted', :from => 'Stage', match: :prefer_exact)
  fill_in('Price Book', with: "Standard Price Book", match: :prefer_exact)
  fill_in('Close Date', with: " 7/21/2017", match: :prefer_exact)
  select('Renewal', :from => 'Opportunity Type', match: :prefer_exact)
  select('EMEA', :from => 'Client Region', match: :prefer_exact)
  select('United States', :from => 'Country', match: :prefer_exact)
  select('NALA', :from => 'SSI Theatre', match: :prefer_exact)
  sleep 15
end

When(/^I click on renewal opportunity under renewable line item detail section$/) do
  click_on $newopportunity
  sleep 20
end


When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field_name, value|
  fill_in(field_name, with: value, match: :prefer_exact)
end

When(/^I click on "([^"]*)" button under renewable line item section$/) do |button_name|
  click_on  button_name
  sleep 10
end

Then(/^I should see "([^"]*)" field with read and write permission for Ops Manager and Ops Rep$/) do |field_name|
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "OperationManagerProd") || (ENV['UserRole'] == "OperationRepProd")
    if page.has_field?(field_name)
      puts "#{field_name} field is visible with editable permission"
    elsif page.has_content?(field_name)
      writeFailure "#{field_name} field is visible with readable permission"
    else
      writeFailure "#{field_name} field is not visible"
    end
  else
    if page.has_field?(field_name)
      writeFailure "#{field_name} field is visible with editable permission"
    elsif page.has_content?(field_name)
      puts "#{field_name} field is visible with readable permission"
    else
      writeFailure "#{field_name} field is not visible"
    end
  end
end

Then(/^I should see Batch Type picklist values for renewable line item page layout$/) do
  if page.has_field?("Batch Type")
    actualvalues = find_field("Batch Type", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Expired","IBOW","Renewal","Warranty","Adds/Recovery IBOC","Adds/Recovery Renewal","Adds/Recovery Warranty","Adds/Recovery IBOW"]
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

When(/^I enter all mandantory fields to create new renewable line item$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:10:j_id32_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 20
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "OperationManagerProd") || (ENV['UserRole'] == "OperationRepProd")
    fill_in("lksrch",:with=> "Ope")
  else
    if (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit") || (ENV['UserRole'] == "SalesOperationSit") || (ENV['UserRole'] == "SalesManagerProd") || (ENV['UserRole'] == "SalesRepProd") || (ENV['UserRole'] == "SalesOperationProd")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "AdminSit") || (ENV['UserRole'] == "AdminProd")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 5
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 15
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationManagerProd")
      click_on "Operations Manager Leica"
      puts "assigned to Operations Manager 1PF5"
      sleep 2
    else if (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "OperationRepProd")
        click_on "Operations Rep Leica"
        puts "assigned to Operations Rep 1PF5"
        sleep 2
      else if (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesManagerProd")
          click_on "Sales Manager leica"
          puts "assigned to Sales Manager 1PF5"
          sleep 2
        else if (ENV['UserRole'] == "SalesRepSit") || (ENV['UserRole'] == "SalesRepProd")
            click_on "Sales rep Leica"
            puts "assigned to Sales Rep 1PF5"
            sleep 2
          else if (ENV['UserRole'] == "AdminSit") || (ENV['UserRole'] == "AdminProd")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "SalesOperationSit") || (ENV['UserRole'] == "SalesOperationProd")
                click_on "Sales Ops leica"
                puts "assigned to Sales Ops 1PF5"
                sleep 2
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  
  fill_in('New Start Date', with: "7/21/2017", match: :prefer_exact)
  fill_in('Existing End Date', with: "7/21/2017", match: :prefer_exact)
  fill_in('New End Date', with: "7/21/2017", match: :prefer_exact)
  fill_in('Previous Price', with: "10", match: :prefer_exact)
  fill_in('Existing Start Date', with: "7/21/2017", match: :prefer_exact)
  fill_in('Previous Local Currency Amount', with: "20", match: :prefer_exact)
  fill_in('Existing Product', with: "Smoke Test Product", match: :prefer_exact)
  fill_in('Quantity', with: "10", match: :prefer_exact)
  

  #  if (ENV['UserRole'] == "OperationManagerSit")
  #    fill_in('Owner', with: "Operations Manager Leica", match: :prefer_exact)
  #  elsif(ENV['UserRole'] == "OperationRepSit")
  #    fill_in('Owner', with: "Operations Rep Leica", match: :prefer_exact)
  #  elsif(ENV['UserRole'] == "SalesManagerSit")
  #    fill_in('Owner', with: "Sales Manager leica", match: :prefer_exact)
  #  elsif(ENV['UserRole'] == "SalesRepSit")
  #    fill_in('Owner', with: "Sales rep Leica", match: :prefer_exact)
  #  elsif(ENV['UserRole'] == "SalesOperationSit")
  #    fill_in('Owner', with: "Sales Ops leica", match: :prefer_exact)
  #  else
  #    fill_in('Owner', with: "DS Integration Admin", match: :prefer_exact)
  #  end
  sleep 10
end

When(/^I click on any existing RLI under Renewable Line Item$/) do
  click_on "a1841000001tgex"
  sleep 25
end

When(/^I click on Save button in create renewable line item page$/) do
  within('.pbHeader') do
    click_on 'Save'
  end
  sleep 20
end

Then(/^I should see SSI sub result reason picklist values when we select HA Already Renewed ARN from Renewal Status$/) do
  select("HA - Already Renewed – ARN", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA \- Bad Data \- BDT from Renewal Status$/) do
  select("HA - Bad Data - BDT", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA \- Duplicate \- DUP from Renewal Status$/) do
  select("HA - Duplicate - DUP", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Duplicate entry"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA End Of Support EOL from Renewal Status$/) do
  select("HA - End Of Support - EOL", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA Other OTH from Renewal Status$/) do
  select("HA - Other - OTH", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Reseller/Dealer"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA \- Previously Renewed Contract \- REN from Renewal Status$/) do
  select("HA - Previously Renewed Contract - REN", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA \- Sales Pull Back \- SPB from Renewal Status$/) do
  select("HA - Sales Pull Back - SPB", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA \- Theater Swap \- THS from Renewal Status$/) do
  select("HA - Theater Swap - THS", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select HA \- Upgrade \- EUG from Renewal Status$/) do
  select("HA - Upgrade - EUG", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Bid \- NBD from Renewal Status$/) do
  select("NS - Bid - NBD", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Can not Reach Contact \- CNC from Renewal Status$/) do
  select("NS - Can not Reach Contact - CNC", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","No answer to phone / email","Unable to obtain customer details to engage"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 10
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Client Product Replacement \- PTR from Renewal Status$/) do
  select("NS - Client Product Replacement - PTR", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Contract led decision – Managed Services","Price led decision","Product Replaced with existing Manufacturer Product"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Competitive DVAR \- SCV from Renewal Status$/) do
  select("NS - Competitive DVAR - SCV", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Competitive Service Loss Other \- SCS from Renewal Status$/) do
  select("NS - Competitive Service Loss Other - SCS", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Problems solved by customer – Self Repair"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Customer Cost\-Benefit Decision \- SCB from Renewal Status$/) do
  select("NS - Customer Cost-Benefit Decision - SCB", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Bi-annual Preventive Maintenance","Contract led decision – Managed Services","Does not see Value in Service","On Demand Preference","Price led decision","Service led decision"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Customer No Longer Exists \- RNE from Renewal Status$/) do
  select("NS - Customer No Longer Exists - RNE", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Company has been Acquired and budget lies with new company","Company has gone out of business","Premises have been destroyed"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Customer Satisfaction Driven \- SSD from Renewal Status$/) do
  select("NS - Customer Satisfaction Driven - SSD", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- End of Service Life \- PEL from Renewal Status$/) do
  select("NS - End of Service Life - PEL", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Not in Budget \- NIB from Renewal Status$/) do
  select("NS - Not in Budget - NIB", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","No Budget available for Service"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Other Data Management \- RDM from Renewal Status$/) do
  select("NS - Other Data Management - RDM", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Outside Vendor Supporting \- OVS from Renewal Status$/) do
  select("NS - Outside Vendor Supporting - OVS", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Prefers Time & Materials \- T&M from Renewal Status$/) do
  select("NS - Prefers Time & Materials - T&M", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Unsatisfied with Service \- UWS from Renewal Status$/) do
  select("NS - Unsatisfied with Service - UWS", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Dissatisfied with Product","Dissatisfied with Service","On Demand Preference"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Unresponsive VAR \- RUV from Renewal Status$/) do
  select("NS - Unresponsive VAR - RUV", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Unresponsive End User \- REU from Renewal Status$/) do
  select("NS - Unresponsive End User - REU", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Contact responsive but not on updates relating to this asset","No answer to phone / email","Unable to reach contact"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Third Party Maintenance \- SPM from Renewal Status$/) do
  select("NS - Third Party Maintenance - SPM", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Contract led decision – Managed Services","Price led decision","Service led decision"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Switched to Competitor \- STC from Renewal Status$/) do
  select("NS - Switched to Competitor - STC", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Contract led decision – Managed Services","Price led decision","Product Replaced with Competitors Product","Service led decision"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end

Then(/^I should see SSI sub result reason picklist values when we select NS \- Product Decommissioned \- PPD from Renewal Status$/) do
  select("NS - Product Decommissioned - PPD", :from => "Renewal Status", match: :prefer_exact)
  actualvalues = find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","(None)","Product Decommissioned","Product Replaced with Competitors Product","Product Replaced with existing Manufacturer Product"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    Extravalue = (actualvalues.sort-expectedvalues.sort)
    puts  "Extra value = #{Extravalue}"
    MissingValue = (expectedvalues.sort - actualvalues.sort)
    puts  "Missing Value = #{MissingValue}"
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  sleep 5
end