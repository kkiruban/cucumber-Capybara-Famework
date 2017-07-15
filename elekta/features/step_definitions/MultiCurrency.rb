

Then(/^I should see "([^"]*)" section$/) do |section|
  if page.has_content?(section)
    puts "#{section} section is visible"
  else
    writeFailure "#{section} section is not visible"
  end
end

Then(/^I should see Previous Local Currency Code picklist values in new Renewable Line Item page layout$/) do
  if page.has_field?("Previous Local Currency Code")
    actualvalues = find_field("Sub Stage", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","BRL","CAD","CHF","CNY","DKK","EUR","GBP","JPY","MXN","NOK","PLN","SEK","TRY","USD","ZAR","SGD","CZK"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Sub Stage picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Previous Local Currency Code picklist"
    end
  else
    writeFailure "Previous Local Currency Code field not visible"
  end
end

When(/^I click on "([^"]*)" button in opportunity page layout$/) do |button|
  click_on button
  sleep 10
end

When(/^I check "([^"]*)" checkbox in opportunity page layout$/) do |field_name|
  check field_name
  sleep 10
end

When(/^I fill all mandantory field to create a new random quote$/) do
  randomvalue=('0000'..'9999').to_a.sample
  $newquote = "smoke-test-quote-" + randomvalue
  sleep 5
  puts $newquote
  fill_in('Quote Name', with:$newquote, match: :prefer_exact)
  select('Direct', :from => 'Quote Type', match: :prefer_exact)
  select('1', :from => 'Quote Type Year', match: :prefer_exact)
  sleep 10
end


When(/^I search existing product and select that product$/) do
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
  within('.selectButtons') do
    click_button("Select")
  end
end

When(/^I enter all required fields to create new random renewable line item$/) do
  fill_in('Existing Start Date', with:"6/28/2017", match: :prefer_exact)
  fill_in('Existing Start Date', with:"6/28/2017", match: :prefer_exact)
  fill_in('New Start Date', with:"6/28/2017", match: :prefer_exact)
  fill_in('Existing End Date', with:"7/28/2017", match: :prefer_exact)
  fill_in('New End Date', with:"7/28/2017", match: :prefer_exact)
  fill_in('Existing Product', with: "Smoke Test Product", match: :prefer_exact)
  fill_in('Asset', with: "smoke-test-asset-123", match: :prefer_exact)
  select('Renewal', :from => 'Batch Type', match: :prefer_exact)
end

When(/^I click on "([^"]*)" button in new Renewable Line Item page layout$/) do |field_value|
  click_on(field_value,match: :first)
  sleep 20
end

Then(/^I should see "([^"]*)" in "([^"]*)" field$/) do |field_value, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1]/div[text()="'"#{field_value}"'"]')
    puts "The field - #{field_name} -  with data - #{field_value} -  is present over the page"
  else
    writeFailure "fail to find the field - #{field_name} -  with data - #{field_value} -"
  end
end
