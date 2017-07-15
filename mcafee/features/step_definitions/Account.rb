Given(/^I should navigate to Accounts tab in saleforce application$/) do
  visit get_url
  sleep 15
  def getcredentialinfo
    yamlinput = "./features/config/Login.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[ENV['UserRole']]
  end
  value =getcredentialinfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 20
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 10
  find(:xpath,"//a[@class='listRelatedObject accountBlock title']").click
  sleep 15
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

When(/^I enter all mandantory fields to create a random new account$/) do
 def getDetails(yamlInfo)
	yamlinput = "./features/config/Account.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end
   Accountvalue = getDetails 'Testdata'
  randomvalue=('0000'..'9999').to_a.sample
  $newaccount = Accountvalue["AccountName"] + randomvalue
  sleep 5
  fill_in('Account Name', with: $newaccount, match: :prefer_exact)
  sleep 10
end

Then(/^I should see accounts page successfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Accounts: Home ~ Salesforce - Performance Edition"
    puts "succesfully visited home page"
  else
    fail(ArgumentError.new('Not visited home page successfully'))
  end
end


Then(/^I should see Implementation Status field picklist values in new account page$/) do
  if page.has_field?("Implementation Status")
    actualvalues = find_field("Implementation Status", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Black","Green","Red"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Implementation Status picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Implementation Status picklist"
    end
  else
    writeFailure "Implementation Status field not visible"
  end
end


Then(/^I should see RLM Tier field picklist values in new account page$/) do
  if page.has_field?("RLM Tier")
    actualvalues = find_field("RLM Tier", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","a. >1M","b. 500K -1M","c. 250K -500K","d. 100K -250K","e. 50K -100K","f. 30K -50K","g. 10K -30K","h. 5K -10K","i. 2.5K -5K","j. 1K -2.5K","k. <1K"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in RLM Tier picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in RLM Tier picklist"
    end
  else
    writeFailure "RLM Tier field not visible"
  end
end

Then(/^I should see Implementation Status Reason field picklist values in new account page$/) do
  if page.has_field?("Implementation Status Reason")
    actualvalues = find_field("Implementation Status Reason", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","No Risk perceived - Customer healthy","Customer Unresponsive","Grant Number unknown","Download Issues - Grant Number","Download Issues - Technical errors","Customer internal Delay","Deployment Window","Lack of Training","Business Compliance","Technical Errors/Delays","Cease of Business: Out of business","Cease of business: M&A","Cease of Business: Bankruptcy"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Implementation Status Reason picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Implementation Status Reason picklist"
    end
  else
    writeFailure "Implementation Status Reason field not visible"
  end
end

Then(/^I should see Health Status field picklist values in new account page$/) do
  if page.has_field?("Health Status")
    actualvalues = find_field("Health Status", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Black","Green","Red"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Health Status picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Health Status picklist"
    end
  else
    writeFailure "Health Status field not visible"
  end
end

Then(/^I should see Health Status Reason field picklist values in new account page$/) do
  if page.has_field?("Health Status Reason")
    actualvalues = find_field("Health Status Reason", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Black","Green","Red"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Health Status Reason picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Health Status Reason picklist"
    end
  else
    writeFailure "Health Status Reason field not visible"
  end
end

Then(/^I should see Competitor field picklist values in new account page$/) do
  if page.has_field?("Competitor")
    actualvalues = find_field("Competitor", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Trend Micro","Symantec","Kaspersky","Sophos","Microsoft","Cylance","SentinelOne","Eset","CrowdStrike","Bit9+Carbon Black","Digital Guardian","Forcepoint","Check Point","Winmagic","Websense","Cisco","Blue Coat","Zscaler","Log Rhythm","Palo Alto Networks","Big9","Tripwire","Alien Vault","Splunk","IBM","ArcSight","FireEye","Juniper Networks"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Competitor picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Competitor	picklist"
    end
  else
    writeFailure "Competitor field not visible"
  end
end

Then(/^I should see Upsell\/Cross\-sell Potential field picklist values in new account page$/) do
  if page.has_field?("Upsell/Cross-sell Potential")
    actualvalues = find_field("Upsell/Cross-sell Potential", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Upsell < 1 Month","Upsell < 3 Month","Upsell < 6 Month","Upsell < 1 Year","Upsell > 1 Year","Cross-sell < 1 Month"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Upsell/Cross-sell Potential picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Upsell/Cross-sell Potential	picklist"
    end
  else
    writeFailure "Upsell/Cross-sell Potential field not visible"
  end
end

Then(/^I should see Upsell\/Cross\-sell Product field picklist values in new account page$/) do
  if page.has_field?("Upsell/Cross-sell Product")
    actualvalues = find_field("Upsell/Cross-sell Product", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Desktop Protection","Data center","Server Protection","Data Protection","DLP","Web Protection","Risk and Compliance","SIEM","Network Protection","Sandbox"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Upsell/Cross-sell Product picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Upsell/Cross-sell Product picklist"
    end
  else
    writeFailure "Upsell/Cross-sell Product field not visible"
  end
end

Then(/^I should see Business Value field picklist values in new account page$/) do
  if page.has_field?("Business Value")
    actualvalues = find_field("Business Value", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Data Loss Prevention","Machine Learning","Security","Price","Upgrade","Features","Functionality","Ease of Use","Ease of Installation"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Business Value picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Business Value	picklist"
    end
  else
    writeFailure "Business Value field not visible"
  end
end