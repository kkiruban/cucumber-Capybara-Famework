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
  if page.has_field?("00N4100000WIAnd")
    select("Direct", :from => "00N4100000WIAnd")
  else
    writeFailure "Quote Type field is not available"
  end
  if page.has_field?("00N4100000WIAnc")
    select("1", :from => "00N4100000WIAnc")
  else
    writeFailure "Quote Type Year field is not available"
  end
#  if page.has_field?("Review Status")
#    select("Pass", :from => "Review Status")
#  else
#    writeFailure "Review Status field is not available"
#  end
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

Then(/^I clik on select button$/) do
  within('.selectButtons') do
    click_button("Select")
  end
end

When(/^I check local currency code picklist value$/) do
arg = getquotesdetails "quotes_details"
  if page.has_field?("00N4100000WIAn6")
    actualvalues = find_field("00N4100000WIAn6").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = arg["local_currency_code"].split(',')
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in local currency code picklist"
    else
      extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{extravalue}"
      missingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{missingValue}"
      writeFailure "expected values are not visible in local currency code picklist"
    end
  else
    writeFailure "local currency code field not visible"
  end
end
