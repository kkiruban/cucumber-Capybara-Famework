
When(/^I click on "([^"]*)" button under Renewable Line Item section$/) do |field_value|
  click_on field_value
  sleep 10
end

When(/^I click on renewal opportunity in renewable line item page layout$/) do
  click_on 'smoke-test-opportunity-2-222'
  sleep 10
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

When(/^I enter all mandantory fields to create a new Renewable Line Item$/) do
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Existing Product Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Owner Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 2
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "OperationManagerProd") || (ENV['UserRole'] == "OperationRepProd")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit") || (ENV['UserRole'] == "SalesOperationSit")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Admin")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit")
      click_on "Operations Manager WKLegal"
      puts "assigned to Operations Manager WKLegal"
      sleep 2
    else if (ENV['UserRole'] == "OperationRepSit")
        click_on "Operations Rep WKLegal"
        puts "assigned to Operations Rep WKLegal"
        sleep 2
      else if (ENV['UserRole'] == "SalesManagerSit")
          click_on "Sales Manager WKLegal"
          puts "assigned to Sales Manager WKLegal"
          sleep 2
        else if (ENV['UserRole'] == "SalesRepSit")
            click_on "Sales Rep WKLegal"
            puts "assigned to Sales Rep WKLegal"
            sleep 2
          else if (ENV['UserRole'] == "AdminSit")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "SalesOperationSit")
                click_on "Sales Ops WKLegal"
                puts "assigned to Sales Ops WKLegal"
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

  within('.pbSubsection') do
    if page.has_field?("Existing Start Date")
      fill_in("Existing Start Date",:with => "10/3/2016")
      puts "value for Existing Start Date field is entered"
    else
      puts "Existing Start Date field is not available"
    end
    if page.has_field?("New Start Date")
      fill_in("New Start Date",:with => "11/3/2016")
      puts "value for New Start Date field is entered"
    else
      puts "New Start Date field is not available"
    end
    if page.has_field?("Quantity")
      fill_in("Quantity",:with => "10")
      puts "value for Quantity field is entered"
    else
      puts "Quantity field is not available"
    end
    if page.has_field?("Existing End Date")
      fill_in("Existing End Date",:with => "11/3/2016")
      puts "value for Existing End Date field is entered"
    else
      puts "Existing End Date field is not available"
    end
    if page.has_field?("New End Date")
      fill_in("New End Date",:with => "11/3/2016")
      puts "value for New End Date field is entered"
    else
      puts "New End Date field is not available"
    end
    if page.has_field?("Previous Price")
      fill_in("Previous Price",:with => "20")
      puts "value for Previous Price field is entered"
    else
      puts "Previous Price field is not available"
    end
  end
end

When(/^I click on "([^"]*)" button in renewable line item section$/) do |button_name|
  within('.pbHeader') do
    click_on button_name
  end
  sleep 20
end

Then(/^I should verify WK Status picklist values in Renewable Line Item page layout$/) do
  if page.has_field?('WK Status')
  actualvalues =find_field("WK Status", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Active","At Risk","Cancelled","Converted","Expired","Future","Inactive","Reinstated","Renewed"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in WK Status picklist"
  else
    writeFailure "expected values are not visible in WK Status picklist"
  end
  else
     writeFailure "WK Status field is not visible"
  end
  missingvalue = (actualvalues.sort-expectedvalues.sort) | (expectedvalues.sort - actualvalues.sort)
  puts  "missing value = #{missingvalue}"
end

Then(/^I should verify Renewal Status picklist values in Renewable Line Item page layout$/) do
  if page.has_field?('Renewal Status')
  actualvalues =find_field("Renewal Status", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Open","<none>","CS - Renewed at Par - R@P","CS - Add-On - ADO","CS - Customer Converted to Online Content - ONL","CS - Renewed at Par - R@P","CS - Sub Step Down - SSD","CS - Upsell - UPS","HA - Annual BI True-Up","HA - Bad Data - BDT","HA - Cancelled Last Year - CLY","HA - Duplicate - DUP","HA - Free Product - FRE","HA - Not Enough Info - NEI","HA - Out Of Business/Retired - OOB","HA - Out of Scope - OOS","HA - Product Discontinued - PDC","NS - Billing - Invoice Problem - INV","NS - Budget Cuts - BUD","NS - Business Focus Change - BFC","NS - Content Does Not Meet Need - NMN","NS - Credit Department Cancel - CRD","NS - Difficult to Use - DIF","NS - Duplicate CCH Product - CCH","NS - Incorrect Order Entry - IOE","NS - Insufficient Product Training - TRN","NS - Insufficient Use - INS","NS - Lack Of Adoption - ADP","NS - Lost To Outsourcing - OUT","NS - Mergers & Acquisitions, Lost To Competitor - MAC","NS - Mergers & Acquisitions, othe CCH account - OCA","NS - No Reason Given - NRG","NS - OBR not Responsive - NRS","NS - Other CCH Product Issue - OPI","NS - Personnel Change - PEC","NS - Platform - PTF","NS - Poor Quality - QUY","NS - Price Not Competitive - PNC"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Renewal Status picklist"
  else
    writeFailure "expected values are not visible in Renewal Status picklist"
  end
  else
     writeFailure "Renewal Status field is not visible"
  end
  missingvalue = (actualvalues.sort-expectedvalues.sort) | (expectedvalues.sort - actualvalues.sort)
  puts  "missing value = #{missingvalue}"
end

Then(/^I should verify SSI Sub Result Reason picklist values in Renewable Line Item page layout$/) do
  if page.has_field?('SSI Sub Result Reason')
  actualvalues =find_field("SSI Sub Result Reason", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","HA - Annual BI True-Up"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Sub Result Reason picklist"
  else
    writeFailure "expected values are not visible in SSI Sub Result Reason picklist"
  end
  else
     writeFailure "SSI Sub Result Reason field is not visible"
  end
  missingvalue = (actualvalues.sort-expectedvalues.sort) | (expectedvalues.sort - actualvalues.sort)
  puts  "missing value = #{missingvalue}"
end
