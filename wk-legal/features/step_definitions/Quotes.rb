When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "smoke-test-opportunity-2-222")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
  click_on "smoke-test-opportunity-2-222"
  sleep 10
end

Then(/^I should see "([^"]*)" section on opportunity page layout$/) do |section|
  if page.has_content?(section)
    puts "#{section} Section is available"
  else
    writeFailure "#{section} Section is not available"
  end
end

When(/^I click on "([^"]*)" button under quotes section$/) do |field_name|
  click_on 'New Quote'
  sleep 10
end

When(/^I enter all mandantory field to create a new quote$/) do
  randomvalue=('0000'..'9999').to_a.sample
  $newquote = "smoke-test-quote-" + randomvalue
  sleep 10
  fill_in('Quote Name', with: $newquote, match: :prefer_exact)
  if page.has_field?('Quote Type')
  select('Direct', :from => 'Quote Type',match: :prefer_exact)
  else
    writeFailure "Quote Type field is not visible"
  end
  if page.has_field?('Quote Type Year')
  select('2', :from => 'Quote Type Year',match: :prefer_exact)
  sleep 10
  else
    writeFailure "Quote Type Year field is not visible"
  end
end

Then(/^I should see "([^"]*)" section on quote page layout$/) do |section|
  if page.has_content?(section)
    puts "#{section} Section is available"
  else
    writeFailure "#{section} Section is not available"
  end
end

When(/^I click on Add line item button under Quote Line Items section$/) do
  click_on 'Add Line Item'
  sleep 10
end

When(/^I search random product and select product name$/) do
  sleep 2
  page.find(:xpath, ".//*[@id='search']").set("smoke-test-product")
  sleep 2
  page.find(:id, "save_filter_PricebookEntry").click
  sleep 5
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[0].click
  end
end

When(/^I click on select button in product selection page$/) do
  click_on "Select"
  sleep 10
end

When(/^I click on "([^"]*)" button under add quote line items to page$/) do |button_name|
  within('.genericTable') do
    sleep 2
    click_on(button_name, match: :first)
  end
end

When(/^I enter quantity field value to add products to quote from standard price book$/) do
  sleep 2
  if page.has_field?("Quantity")
    fill_in("Quantity", :with=> "10")
  else
    writeFailure "Quantity field is not present"
  end
end