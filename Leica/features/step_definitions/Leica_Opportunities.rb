Then(/^I check that "([^"]*)" field is read only for all users$/) do |field_name|
  if page.has_content?(field_name)
    puts "#{field_name} field is visible"
  else
    writeFailure "#{field_name} field is not visible"
  end
  if (ENV['UserRole'] != "AdminSit") || (ENV['UserRole'] != "AdminProd")
  if page.has_field?(field_name)
    writeFailure "#{field_name} field is editable"
  else
    puts "#{field_name} field is not editable"
  end
  else
  if page.has_field?(field_name)
    puts "#{field_name} field is editable"
  else
    writeFailure "#{field_name} field is not editable"
  end
  end
end

Then(/^I check that "([^"]*)" field is visible or not$/) do |field_name|
  if page.has_content?(field_name)
    puts "#{field_name} field is visible"
  else
    writeFailure "#{field_name} field is not visible"
  end
end

Then(/^I check that "([^"]*)" field is editable for all users excepts SalesOps$/) do |field_name|
  if (ENV['UserRole'] != "SalesOperationSit") || (ENV['UserRole'] != "SalesOperationProd")
    if page.has_field?(field_name)
      writeFailure "#{field_name} field is editable"
    else
      puts "#{field_name} field is not editable"
    end
  else
    if page.has_field?(field_name)
      puts "#{field_name} field is editable"
    else
      writeFailure "#{field_name} field is not editable"
    end
  end
end

Then(/^I check Stage Insight picklist value after selecting Not Contacted from stage picklist$/) do
  sleep 5
  arg = getopportunitydetails "opportunity_details"
  if page.has_field?("Stage Insight")
    actualvalues = find_field("Stage Insight").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = arg["stage_insight1"].split(',')
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Stage Insight picklist"
    else
      extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{extravalue}"
      missingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{missingValue}"
      writeFailure "expected values are not visible in Stage Insight picklist"
    end
  else
    writeFailure "Stage Insight field not visible"
  end
end

Then(/^I select "([^"]*)" option from "([^"]*)" picklist$/) do |option_name, field_name|
  if page.has_select?("opp11")
    select(option_name, :from=> "opp11")
  else
    writeFailure "#{option_name} is not avilable in #{field_name} picklist"
  end
end

Then(/^I check Stage Insight picklist value after selecting Contacted from stage picklist$/) do
  sleep 5
  arg = getopportunitydetails "opportunity_details"
  if page.has_field?("Stage Insight")
    actualvalues = find_field("Stage Insight").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = arg["stage_insight2"].split(',')
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Stage Insight picklist"
    else
      extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{extravalue}"
      missingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{missingValue}"
      writeFailure "expected values are not visible in Stage Insight picklist"
    end
  else
    writeFailure "Stage Insight field not visible"
  end
end

Then(/^I check Stage Insight picklist value after selecting Quote Delivered from stage picklist$/) do
  sleep 5
  arg = getopportunitydetails "opportunity_details"
  if page.has_field?("Stage Insight")
    actualvalues = find_field("Stage Insight").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = arg["stage_insight3"].split(',')
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Stage Insight picklist"
    else
      extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{extravalue}"
      missingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{missingValue}"
      writeFailure "expected values are not visible in Stage Insight picklist"
    end
  else
    writeFailure "Stage Insight field not visible"
  end
end

Then(/^I check Stage Insight picklist value after selecting Customer Commitment from stage picklist$/) do
  sleep 5
  arg = getopportunitydetails "opportunity_details"
  if page.has_field?("Stage Insight")
    actualvalues = find_field("Stage Insight").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = arg["stage_insight4"].split(',')
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Stage Insight picklist"
    else
      extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{extravalue}"
      missingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{missingValue}"
      writeFailure "expected values are not visible in Stage Insight picklist"
    end
  else
    writeFailure "Stage Insight field not visible"
  end
end

Then(/^I check Renewal Type picklist value$/) do
  sleep 5
  if page.has_field?("Renewal Type")
    puts "Renewal Type field is available"
    if page.has_select?("Renewal Type")
      puts "Renewal Type is a picklist"
      arg = getopportunitydetails "opportunity_details"
      actualvalues = find_field("Stage Insight").all('option').collect(&:text)
      puts "actual values = #{actualvalues}"
      expectedvalues = arg["renewal_type"].split(',')
      puts "expectedvalues =  #{expectedvalues}"
      if actualvalues.sort == expectedvalues.sort
        puts "expected values are visible in Renewal Type picklist"
      else
        extravalue = (actualvalues.sort-expectedvalues.sort)
        puts  "Extra value = #{extravalue}"
        missingValue = (expectedvalues.sort - actualvalues.sort)
        puts  "Missing Value = #{missingValue}"
        writeFailure "expected values are not visible in Renewal Type picklist"
      end
    else
      writeFailure "Renewal Type is not a picklist"
    end
  else
    writeFailure "Renewal Type field is not available"
  end
end

Then(/^I check Business Line picklist value$/) do
  sleep 5
  if page.has_field?("Business Line")
    puts "Business Line field is available"
    if page.has_select?("Business Line")
      puts "Business Line is a picklist"
      arg = getopportunitydetails "opportunity_details"
      actualvalues = find_field("Business Line").all('option').collect(&:text)
      puts "actual values = #{actualvalues}"
      expectedvalues = arg["business_line"].split(',')
      puts "expectedvalues =  #{expectedvalues}"
      if actualvalues.sort == expectedvalues.sort
        puts "expected values are visible in Business Line picklist"
      else
        extravalue = (actualvalues.sort-expectedvalues.sort)
        puts  "Extra value = #{extravalue}"
        missingValue = (expectedvalues.sort - actualvalues.sort)
        puts  "Missing Value = #{missingValue}"
        writeFailure "expected values are not visible in Business Line picklist"
      end
    else
      writeFailure "Business Line is not a picklist"
    end
  else
    writeFailure "Business Line field is not available"
  end
end

Then(/^I check Client Region picklist value$/) do
  sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is available"
    if page.has_select?("Client Region")
      puts "Client Region is a picklist"
      arg = getopportunitydetails "opportunity_details"
      actualvalues = find_field("Client Region").all('option').collect(&:text)
      puts "actual values = #{actualvalues}"
      expectedvalues = arg["client_region"].split(',')
      puts "expectedvalues =  #{expectedvalues}"
      if actualvalues.sort == expectedvalues.sort
        puts "expected values are visible in Client Region picklist"
      else
        extravalue = (actualvalues.sort-expectedvalues.sort)
        puts  "Extra value = #{extravalue}"
        missingValue = (expectedvalues.sort - actualvalues.sort)
        puts  "Missing Value = #{missingValue}"
        writeFailure "expected values are not visible in Client Region picklist"
      end
    else
      writeFailure "Client Region is not a picklist"
    end
  else
    writeFailure "Client Region field is not available"
  end
end

Then(/^I check Client Territory picklist value$/) do
  sleep 5
  if page.has_field?("Client Territory")
    puts "Client Territory field is available"
    if page.has_select?("Client Territory")
      puts "Client Territory is a picklist"
      arg = getopportunitydetails "opportunity_details"
      actualvalues = find_field("Client Territory").all('option').collect(&:text)
      puts "actual values = #{actualvalues}"
      expectedvalues = arg["client_territory"].split(',')
      puts "expectedvalues =  #{expectedvalues}"
      if actualvalues.sort == expectedvalues.sort
        puts "expected values are visible in Client Territory picklist"
      else
        extravalue = (actualvalues.sort-expectedvalues.sort)
        puts  "Extra value = #{extravalue}"
        missingValue = (expectedvalues.sort - actualvalues.sort)
        puts  "Missing Value = #{missingValue}"
        writeFailure "expected values are not visible in Client Territory picklist"
      end
    else
      writeFailure "Client Territory is not a picklist"
    end
  else
    writeFailure "Client Territory field is not available"
  end
end

Then(/^I check Opportunity Type picklist value$/) do
  if page.has_field?("Opportunity Type")
    puts "Opportunity Type field is available"
    if page.has_select?("Opportunity Type")
      puts "Opportunity Type is a picklist"
      arg = getopportunitydetails "opportunity_details"
      actualvalues = find_field("Opportunity Type").all('option').collect(&:text)
      puts "actual values = #{actualvalues}"
      expectedvalues = arg["opportunity_type"].split(',')
      puts "expectedvalues =  #{expectedvalues}"
      if actualvalues.sort == expectedvalues.sort
        puts "expected values are visible in Opportunity Type picklist"
      else
        extravalue = (actualvalues.sort-expectedvalues.sort)
        puts  "Extra value = #{extravalue}"
        missingValue = (expectedvalues.sort - actualvalues.sort)
        puts  "Missing Value = #{missingValue}"
        writeFailure "expected values are not visible in Opportunity Type picklist"
      end
    else
      writeFailure "Opportunity Type is not a picklist"
    end
  else
    writeFailure "Opportunity Type field is not available"
  end
end

Then(/^I check Renewal Currency picklist value$/) do
  if page.has_field?("Renewal Currency")
    puts "Renewal Currency field is available"
    if page.has_select?("Renewal Currency")
      puts "Renewal Currency is a picklist"
      arg = getopportunitydetails "opportunity_details"
      actualvalues = find_field("Renewal Currency").all('option').collect(&:text)
      puts "actual values = #{actualvalues}"
      expectedvalues = arg["renewal_currency"].split(',')
      puts "expectedvalues =  #{expectedvalues}"
      if actualvalues.sort == expectedvalues.sort
        puts "expected values are visible in Renewal Currency picklist"
      else
        extravalue = (actualvalues.sort-expectedvalues.sort)
        puts  "Extra value = #{extravalue}"
        missingValue = (expectedvalues.sort - actualvalues.sort)
        puts  "Missing Value = #{missingValue}"
        writeFailure "expected values are not visible in Renewal Currency picklist"
      end
    else
      writeFailure "Renewal Currency is not a picklist"
    end
  else
    writeFailure "Renewal Currency field is not available"
  end
end

Then(/^I enter data to all mandatory fiels under new opportunity section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $opp_name = "Smoke_test_opportinity_"+ Random.new.rand(1..20000).to_s
    fill_in("Opportunity Name", :with=> $opp_name)
    puts "opportunity name is: #{$opp_name}"
    sleep 2
    if page.has_field?("opp11")
      select("Contacted", :from => "opp11")
      puts "value for stage field is selected"
    else
      puts "stage field is not available"
    end
    sleep 2
    if page.has_field?("Close Date")
      fill_in("Close Date",:with => "6/17/2017")
      puts "value for close date field is entered"
    else
      puts "close date field is not available"
    end
  end
  
  if page.has_field?("Opportunity Type", :match => :prefer_exact)
    select("Renewal", :from => "Opportunity Type")
    puts "value for Opportunity Type field is selected"
  else
    puts "Opportunity Type field is not available"
  end

  if page.has_field?("opp11")
    select("Not Contacted", :from => "opp11")
    puts "value for Engagement Type field is selected"
  else
    puts "Engagement Type field is not available"
  end

  #    if page.has_field?("00N3600000JAKmv")
  #      select("FIHK HKD", :from => "00N3600000JAKmv")
  #      puts "value for Operating Unit field is selected"
  #    else
  #      puts "Operating Unit field is not available"
  #    end
  #
  #    if page.has_field?("Business Line")
  #      select("Core", :from => "Business Line")
  #      puts "value for Business Line field is selected"
  #    else
  #      puts "Business Line field is not available"
  #    end
  #
  #    if page.has_field?("00N7A000000blqY")
  #      select("Direct", :from => "00N7A000000blqY")
  #      puts "value for Dirrect/Channel field is selected"
  #    else
  #      puts "Dirrect/Channel field is not available"
  #    end
  #
  #    if page.has_field?("00N3600000JAKmC")
  #      select("USA", :from => "00N3600000JAKmC")
  #      puts "value for Client Territory field is selected"
  #    else
  #      puts "Client Territory field is not available"
  #    end
  #
  #    if page.has_field?("00N3600000JAKmA")
  #      select("USA", :from => "00N3600000JAKmA")
  #      puts "value for Client Region field is selected"
  #    else
  #      puts "Client Region field is not available"
  #    end
  #
  #    if page.has_field?("Country")
  #      select("United States", :from => "Country")
  #      puts "value for Country field is selected"
  #    else
  #      puts "Country field is not available"
  #    end
  #
  #    if page.has_field?("00N3600000JAKnU")
  #      select("NALA", :from => "00N3600000JAKnU")
  #      puts "value for SSI Theatre field is selected"
  #    else
  #      puts "SSI Theatre field is not available"
  #    end
  ##  end
  #
  ##  within all('.pbSubsection')[3] do
  #    if page.has_field?("opp16")
  #      select("USD - U.S. Dollar", :from => "opp16")
  #      puts "value for Opportunity Currency field is selected"
  #    else
  #      puts "Opportunity Currency field is not available"
  #    end
  ##  end

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 20
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 10
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)

  sleep 3
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Price Book Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Standard")
  sleep 10
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

Then(/^I check that "([^"]*)" field is visible under Location and Batch Classification$/) do |field_name|
  within all('.pbSubsection')[2] do
    if page.has_content?(field_name)
      puts "#{field_name} field is visible under Location and Batch Classification"
    else
      writeFailure "#{field_name} field is not visible under Location and Batch Classification"
    end
  end
end

And(/^I check that "([^"]*)" field is read only for all users under Location and Batch Classification$/) do |field_name|
  if page.has_content?(field_name)
    puts "#{field_name} is visible"
    within all('.pbSubsection')[2] do
      if page.has_field?(field_name)
        writeFailure "#{field_name} field is visible under Location and Batch Classification"
      else
        puts "#{field_name} field is not visible under Location and Batch Classification"
      end
    end
  else
    writeFailure "#{field_name} is not visible"
  end
end

Then(/^I enter data to all mandatory fields under Renewable Line Item$/) do
  sleep 3
  within('.pbSubsection') do
    if page.has_field?("Currency", :match => :prefer_exact)
      select("U.S. Dollar", :from=> "Currency", :match => :prefer_exact)
    else
      puts "Currency field is not availabe"
    end
    if page.has_field?("Quantity")
      fill_in("10", :with=> "Quantity")
    else
      puts "Quantity field is not available"
    end

    if page.has_field?("Existing End Date", :match => :prefer_exact)
      fill_in("Existing End Date", :with=> "7/3/2017")
    else
      puts "Existing End Date field is not available"
    end
    if page.has_field?("New End Date", :match => :prefer_exact)
      fill_in("New End Date", :with=> "12/3/2017")
    else
      puts "New End Date field is not available"
    end
    if page.has_field?("Existing Start Date", :match => :prefer_exact)
      fill_in("Existing Start Date", :with=> "8/3/2017")
    else
      puts "Existing Start Date field is not available"
    end
    if page.has_field?("New Start Date", :match => :prefer_exact)
      fill_in("New Start Date", :with=> "10/5/2017")
    else
      puts "New Start Date field is not available"
    end

    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Existing Product Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke")
    sleep 5
    find_button('Go!').click
    sleep 4
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      sleep 2
      table.all('tr')[1].all('th')[0].find('a').click
    end
    sleep 4
    page.driver.browser.switch_to.window(main)

    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Owner Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "*")
    sleep 5
    find_button('Go!').click
    sleep 4
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      sleep 2
      table.all('tr')[1].all('th')[0].find('a').click
    end
    sleep 4
    page.driver.browser.switch_to.window(main)

  end
end

Then(/^I click on opportunity name link under Partner Opportunity$/) do
  within all('.pbSubsection')[0] do
    sleep 4
    puts page.find(:xpath, "//div[@id='CF00N4100000WH7f5_ileinner']/a").text
    page.find(:xpath, "//div[@id='CF00N4100000WH7f5_ileinner']/a").click
    sleep 10
  end
end

Then(/^I check that the number of "([^"]*)" field matches the number of RLI in Renewable Line Item related section$/) do |arg1|
  sleep 4
  within all('.pbBody')[5] do
    table =all("tbody")[0]
    puts table.all("tr").count
    #				tr = table.all("tr")
    #				@tRowCount = tr.count
    #        puts @tRowCount
  end
end

Then(/^I check that Partner Information section is visible$/) do
  if page.has_content?("Partner Information")
    puts "Partner Information section is visible"
  else
    writeFailure "Partner Information section is not visible"
  end
end

Then(/^I click on "([^"]*)" button under Partner Opportunities section$/) do |arg1|  
  find(:xpath,"//input[@title='Add New Partner Opportunity']").click
  sleep 5
end

Then(/^I click on "([^"]*)" button under Add Partner Opportunity$/) do |button_name|
  click_on(button_name)
end

Then(/^I enter all madatory field under new partner opportunity section$/) do
  sleep 3
  $partner_opp_name = "Smoke_test_partner_opp"+ Random.new.rand(1..20000).to_s
  if page.has_field?("Partner Opportunity")
    fill_in("Partner Opportunity", :with => $partner_opp_name)
  else
    writeFailure "Partner Opportunity field is not available"
  end
end

Then(/^I check that partner opportunity name is visible under Partner Opportunity related section$/) do
  within all('.pbBody')[7] do
  if page.has_content?($partner_opp_name)
    puts "Partner Opportunity Name is visible under Partner Opportunity related section"
  else
    writeFailure "Partner Opportunity Name is not visible under Partner Opportunity related section"
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

 Then(/^I click on opportunity name link$/) do
    within all('.pbSubsection')[0] do
  sleep 4
  puts page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").text
  page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").click
  sleep 10
  end
end

