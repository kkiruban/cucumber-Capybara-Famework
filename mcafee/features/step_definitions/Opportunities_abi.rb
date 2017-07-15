Then(/^I check that "([^"]*)" field is visible or not$/) do |field_name|
  if page.has_content?(field_name)
    puts "#{field_name} field is visible"
  else
    writeFailure "#{field_name} field is not visible"
  end
end

Then(/^I check that "([^"]*)" field is editable for all excepts SalesOps$/) do |field_name|
  if (ENV['UserRole'] != "SalesOperationSit")
    if page.has_field?(field_name)
    puts "#{field_name} field is editable"
    else
      writeFailure "#{field_name} field is not editable"
    end
  else
    if page.has_field?(field_name)
    writeFailure "#{field_name} field is editable"
    else
      puts "#{field_name} field is not editable"
    end
  end
end

Then(/^I check "([^"]*)" picklist values$/) do |field_name|
  begin
    sleep 5
    arg = getopportunitiesdetails 'opportunity_details'
    if page.has_select?("00N4100000Us1dQ")
      puts "#{field_name} picklist field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N4100000Us1dQ')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["Upsell_picklist_values"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
         writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
     writeFailure "#{field_name} picklist is not present"
    end
  end
end

Then(/^I check that "([^"]*)" field is visible under location and batch classification section$/) do |field_name|
  within all('.pbSubsection')[1] do
    if page.has_content?(field_name)
      puts "#{field_name} field is visible"
    else
      writeFailure "#{field_name} field is not visible"
    end
  end
end

Then(/^I check that "([^"]*)" field is editable only for OpsRep and OpsMgr$/) do |field_name|
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit")
   if page.has_field?(field_name)
  puts "#{field_name} field is editable"
  else
    writeFailure "#{field_name} field is not editable"
  end
  else
    if page.has_field?(field_name)
  writeFailure "#{field_name} field is editable"
  else
    puts "#{field_name} field is not editable"
  end
  end
end

Then(/^I check Client Segment picklist values$/) do
  begin
    sleep 5
    arg = getopportunitiesdetails 'opportunity_details'
    if page.has_select?("00N4100000Us1bu")
      puts "Client Segment picklist field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N4100000Us1bu')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["Client_Segment_picklist_values"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
         writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
     writeFailure "Client Segment picklist is not present"
    end
  end
end

Then(/^I select just created opportunity$/) do
 within('.pbHelp') do
    sleep 2
    select("Recently Created", :from => "hotlist_mode")
    puts "Recently created opportunities are selected"
  end
  within('.pbBody') do
    sleep 2
    find_link($opp_name).click
    puts "#{$opp_name} is selected"
  end
end

Then(/^I click on new quote button under quotes section$/) do
  sleep 2
  click_on "New Quote"
end

Then(/^I enter value to mandatory fields under new quote section$/) do
   sleep 2
  if page.has_field?("Quote Name")
    randomvalue=('0001'..'9999').to_a.sample
    fill_in("Quote Name", :with=> "Smoke_test_quotes-#{randomvalue}")
  else
    writeFailure "Quote Name field is not available"
  end
  if page.has_field?("00N4100000Us1fH")
    select("Direct", :from => "00N4100000Us1fH")
  else
    writeFailure "Quote Type field is not available"
  end
  if page.has_field?("00N4100000Us1fG")
    select("1", :from => "00N4100000Us1fG")
  else
    writeFailure "Quote Type Year field is not available"
  end
  if page.has_field?("Review Status")
    select("Pass", :from => "Review Status")
  else
    writeFailure "Review Status field is not available"
  end
end

When(/^I click on existing Opportunity Product$/) do
#  sleep 5
#  find(:xpath, '//*[@id="0063B000005fXp7_RelatedLineItemList_body"]/table/tbody/tr[2]/th/a').click
sleep 4
click_link "Smoke Test Product"
end

When(/^I click on add line items button under quote line items section$/) do
  sleep 2
  click_on "Add Line Item"
  sleep 2
end

When(/^I select existing product name$/) do
  sleep 2
  page.find(:xpath, ".//*[@id='search']").set("smoke")
  sleep 2
  page.find(:id, "save_filter_PricebookEntry").click
  sleep 5
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[0].click
    puts "opportunity is selected"
  end
end

When(/^I click on select button$/) do
  within('.selectButtons') do
    click_button("Select")
  end
end

When(/^I enter start date field value$/) do
  sleep 2
  arg = getopportunitiesdetails 'opportunity_details'
  if page.has_xpath?('//td[1]/span[contains(@class, "dateInput")]/*')
    find(:xpath, '//td[1]/span[contains(@class, "dateInput")]/*').set(arg["start_date"])
  else
    writeFailure "Start Date field is not present"
  end
end

When(/^I enter end date field value$/) do
  sleep 2
  arg = getopportunitiesdetails 'opportunity_details'
  if page.has_xpath?('//td[2]/span[contains(@class, "dateInput")]/*')
    find(:xpath, '//td[2]/span[contains(@class, "dateInput")]/*').set(arg["end_date"])
  else
    writeFailure "End Date field is not present"
  end
end

When(/^I enter quantity field value$/) do
  sleep 2
  if page.has_field?("Quantity")
    fill_in("Quantity", :with=> "10")
  else
    writeFailure "Quantity field is not present"
  end
end

When(/^I enter salse price field value$/) do
 sleep 2
  if page.has_field?("Sales Price")
    fill_in("Sales Price", :with=> "10")
  else
    writeFailure "Sales Price field is not present"
  end
end

When(/^I click on "([^"]*)" button under add quote line items to page$/) do |button_name|
  within('.genericTable') do
    sleep 2
    #click_on(button_name, match: :first)
    click_on(button_name,:match => :first)
  end
end

Then(/^I check that "([^"]*)" field is visible under product information section$/) do |field_name| 
sleep 2
  within all('.pbSubsection')[0] do
  if page.has_content?(field_name)
    puts "#{field_name} field is visible"
  else
    writeFailure "#{field_name} field is not visible"
  end
  end
end

Then(/^I click on opportunity name link$/) do
  within all('.pbSubsection')[0] do
  sleep 4
  puts page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").text
  page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").click
  sleep 10
  end
end

Then(/^I check that "([^"]*)" field is visible under Additional Information$/) do |field_name|
   within all('.pbSubsection')[1] do
  if page.has_content?(field_name)
    puts "#{field_name} field is visible"
  else
    writeFailure "#{field_name} field is not visible"
  end
 end
end

Then(/^I check that "([^"]*)" field is editable for only OpsRep and OpsMgr$/) do |field_name|
 if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "AdminSit")
  if page.has_field?(field_name)
    puts "#{field_name} field is editable"
  else
    writeFailure "#{field_name} field is not editable"
  end
 else
  if page.has_field?(field_name)
    writeFailure "#{field_name} field is editable"
  else
    puts "#{field_name} field is not editable"
  end
 end
end

Then(/^I clik on select button$/) do
  within('.selectButtons') do
    click_button("Select")
  end
end

