Given(/^I should navigate to salesforce Home page$/) do
  visit($BASE_URL)
  sleep 15
  def getcredentialinfo
    yamlinput = "./features/support/test_data/Login.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[ENV['UserRole']]
  end
  value =getcredentialinfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 20
end

Then(/^I should see salesforce home page succesfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Salesforce - Performance Edition"
    puts "succesfully visited home page"
  else
    fail(ArgumentError.new('Not visited home page successfully'))
  end
end

When(/^I click on new button from my tasks section$/) do
  find(:xpath,"//input[@name='newTask']").click
  sleep 10
end

Then(/^I should see following:$/) do |string|
  if page.has_content?(string)
    puts "string is visible"
  else
    writeFailure "Failed to see following string"
  end
end

Then(/^I should see Sub Type picklist value in new task page$/) do
  if page.has_field?("Sub Type")
    actualvalues = find_field("Sub Type", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Demo Pitched","Demo Scheduled","Demo Rescheduled","Demo Delivered","Demo No Show"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Sub Type picklist"
    else
      writeFailure "expected values are not visible in Sub Type picklist"
    end
  else
    writeFailure "Sub Type field not visible"
  end
end


When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, field_name|
  select(value, :from => field_name, match: :prefer_exact)
  sleep 10
end

Then(/^I click on continue button in select task record type page$/) do
  within(:id,'bottomButtonRow') do
    click_on "Continue"
  end
end

When(/^I enter all mandantory field to create a new task under task standard record type$/) do
  randomvalue=('0000'..'9999').to_a.sample
  $newtaskstandard = "smoke-test-tasks-standard-" + randomvalue
  sleep 5
  fill_in('Subject', with: $newtaskstandard, match: :prefer_exact)
  fill_in('Comments', with: "testing", match: :prefer_exact)
  fill_in('Due Date', with: "7/20/2017", match: :prefer_exact)
  fill_in('Name', with: "smoke-test-contact-123", match: :prefer_exact)
  fill_in('Related To', with: "smoke-test-opportunity-123", match: :prefer_exact)
  sleep 5
end

When(/^I should not see "([^"]*)" section in task page layout$/) do |section|
  if page.has_content?(section)
    writeFailure "#{section} Section is available"
  else
    puts "#{section} Section is not available"
  end
end