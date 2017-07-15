
Then(/^I should see Onboarding field picklist values in renewable line item page$/) do
  if page.has_field?("Onboarding")
    actualvalues = find_field("Onboarding", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","NewBiz-NewCustomer","NewBiz-Return Customer","NewBiz-CrossSelloutofProdType","NewBiz-CrossSellinProdType","NewBiz-Upsell","NewBiz-ReturnCustomer-CrossSelloutofProdType","NULL","Others","Renewal-Conversion","Renewal-LfL"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Onboarding picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Onboarding picklist"
    end
  else
    writeFailure "Onboarding field not visible"
  end
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

Given(/^I should navigate to opportunity tab in saleforce application$/) do
  visit get_url
  sleep 15
#  def getcredentialinfo
#    yamlinput = "./features/config/Login.yml"
#    myoptions = YAML.load_file(yamlinput)
#    myoptions[ENV['UserRole']]
#  end
  value =getCredentialInfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 20
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,".//a[@class='listRelatedObject opportunityBlock title']").click
  sleep 30
end

When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "smoke-test-opportunity-2-222")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
  click_on "smoke-test-opportunity-2-222"
  sleep 10
end

Then(/^I click on "([^"]*)" button under renewable line item section$/) do |button_name|
  sleep 3
  find(:xpath,"//input[@title='New Renewable Line Item']").click
  sleep 3
end

Then(/^I enter data to all mandatory fields under renewable line item$/) do
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
  find(:xpath,"//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:13:j_id32_lkwgt']/img").click
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
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationManagerProd")
      click_on "Operations Manager McAfee"
      puts "assigned to Operations Manager McAfee"
      sleep 2
    else if (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "OperationRepProd")
        click_on "Operations Rep McAfee"
        puts "assigned to Operations Rep McAfee"
        sleep 2
      else if (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesManagerProd")
          click_on "Sales Manager McAfee"
          puts "assigned to Sales Manager McAfee"
          sleep 2
        else if (ENV['UserRole'] == "SalesRepSit") || (ENV['UserRole'] == "SalesRepProd")
            click_on "Sales Rep McAfee"
            puts "assigned to Sales Rep McAfee"
            sleep 2
          else if (ENV['UserRole'] == "AdminSit") || (ENV['UserRole'] == "AdminProd")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "SalesOperationSit") || (ENV['UserRole'] == "SalesOperationProd")
                click_on "Sales Ops McAfee"
                puts "assigned to Sales Ops McAfee"
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

Then(/^I click on "([^"]*)" button in renewable line item section$/) do |button_name|
  within('.pbHeader') do
    click_on button_name
  end
end

When(/^I click on manage renewals button under renewable line item$/) do
  find(:xpath,"//input[@value='Manage Renewals']").click
  sleep 5
end

When(/^I click on renewal opportunity under renewable line item detail section$/) do
  find(:xpath,".//*[@id='CF00N4100000Us0qR_ileinner']/a").click
  sleep 5
end

When(/^I check existinig product in renewal relationship page$/) do
  find(:xpath,".//*[@id='renewalRelationshipGrid']/tbody/tr[1]/td[1]/input").click
  sleep 5
end

When(/^I click on rebuild opportunity link$/) do
  find(:xpath,".//*[@id='rebuildRRtoOLI']").click
  sleep 10
end