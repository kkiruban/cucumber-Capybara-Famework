
Given(/^I navigate to manager currency page$/) do
  sleep 20
  if ENV['UserRole'].include?('Sit')
    puts "Sit env"
    visit("https://cs50.salesforce.com/_ui/system/organization/ManageCurrenciesPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCompanyProfile&setupid=CompanyCurrency")
    sleep 20
   else
    puts "Prod env"
    visit("https://na35.salesforce.com/_ui/system/organization/ManageCurrenciesPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCompanyProfile&setupid=CompanyCurrency")
    sleep 20
  end
end

When(/^I click on Manage Currencies button$/) do
  find(:xpath,"//input[@name='manageCurrencies']").click
  sleep 10
end

Given(/^I navigate to Home tab in salesforce application$/) do
  visit get_url
  sleep 15
  value =getCredentialInfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 20
end

Then(/^I should see following currency code in Manage currency page:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |hash|
    if page.has_content?(hash['Currency'])
      puts "#{hash['Currency']} currency is visible in manage currency layout"
    else
      writeFailure "#{hash['Currency']} currency is  not visible in manage currency layout"
    end

    puts hash['CurrencyRate']
#    if page.has_content?(hash['CurrencyRate'].to_s)
#      puts "#{hash['CurrencyRate']} currency is visible in manage currency layout"
#    else
#      writeFailure "#{hash['CurrencyRate']} currency is  not visible in manage currency layout"
#    end
  end
end

Then(/^I should see following users as per config guide:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  puts hash['Users']
#  table.hashes.each do |hash|
#
#    if page.has_content?(hash['Users'])
#      puts "#{hash['Users']} User is visible in All users page layout"
#    else
#      writeFailure "#{hash['Users']} User is  not visible in All users page layout"
#    end
#  end
end

Given(/^I navigate to All users page layout$/) do
  if ENV['UserRole'].include?('Sit')
    visit "https://cs50.salesforce.com/005?isUserEntityOverride=1&retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers&setupid=ManageUsers"
    sleep 10
  else
    visit "https://na35.salesforce.com/005?isUserEntityOverride=1&retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers&setupid=ManageUsers"
    sleep 20
  end
end