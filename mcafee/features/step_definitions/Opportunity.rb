
Then(/^I should see Business Line picklist values in create opportunity page$/) do
  actualvalues =find_field("Business Line", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Advanced Threat","Data Center/Cloud","Data Protection","Endpoint Security","EOL-Legacy","Network IPS","Premium Support","Security Operations","Web Protection"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in business line picklist"
  else
    writeFailure "expected values are not visible in business line picklist"
  end
end
Then(/^I should see Client Theatre picklist values in create opportunity page$/) do
  actualvalues =find_field("Client Theater", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","APAC","EMEA","NA"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Theatre picklist"
  else
    writeFailure "expected values are not visible in Client Theatre picklist"
  end
end

Then(/^I should see Client Territory picklist values in create opportunity page$/) do
  actualvalues =find_field("Client Territory", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","APAC","EMEA","NA","USA"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Territory picklist"
  else
    writeFailure "expected values are not visible in Client Territory picklist"
  end
end

Then(/^I should see Client Region picklist values in create opportunity page$/) do
  actualvalues =find_field("Client Region", match: :prefer_exact).all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","ANZ","CAN","CEUR","IND","MET","NAM","NESA","NTA","SEA","SEUR","UKIR"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Region picklist"
  else
    writeFailure "expected values are not visible in Client Region picklist"
  end
end

When(/^I fill all mandantory fields to create a new random opportunity$/) do
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
    if page.has_field?("opp9")
      fill_in("opp9",:with => "5/17/2017")
      puts "value for close date field is entered"
    else
      puts "close date field is not available"
    end
  end
  if page.has_field?("Opportunity Type")
    select("Enterprise", :from => "Opportunity Type")
    puts "value for Opportunity Type field is selected"
  else
    puts "Opportunity Type field is not available"
  end
  if page.has_field?("Business Line")
    select("Core", :from => "Business Line")
    puts "value for Business Line field is selected"
  else
    puts "Business Line field is not available"
  end
  if page.has_field?("Client Territory")
    select("EMEA", :from => "Client Territory")
    puts "value for Client Territory field is selected"
  else
    puts "Client Territory field is not available"
  end
  if page.has_field?("Client Region")
    select("USA", :from => "Client Region")
    puts "value for Client Region field is selected"
  else
    puts "Client Region field is not available"
  end
  if page.has_field?("Direct/Channel")
    select("Direct", :from => "Direct/Channel")
    puts "value for direct channel field is selected"
  else
    puts "direct channel field is not available"
  end
  if page.has_field?("Country")
    select("United States", :from => "Country")
    puts "value for Country field is selected"
  else
    puts "Country field is not available"
  end
  if page.has_field?("SSI Theatre")
    select("NALA", :from => "SSI Theatre")
    puts "value for SSI Theatre field is selected"
  else
    puts "SSI Theatre field is not available"
  end
  if page.has_field?("Engagement Type")
    select("SREV", :from => "Engagement Type")
    puts "value for Engagement Type field is selected"
  else
    puts "Engagement Type field is not available"
  end
  if page.has_field?("opp16")
    select("USD - U.S. Dollar", :from => "opp16")
    puts "value for Opportunity Currency field is selected"
  else
    puts "Opportunity Currency field is not available"
  end
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-")
  sleep 20
  find_button('Go!').click
  sleep 30
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
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "standard")
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
