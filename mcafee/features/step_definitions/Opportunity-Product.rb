When(/^I click on any existing Opportunity Product$/) do
  find(:xpath,"//a[@title='Edit - Record 1 - Smoke Test Product']").click
  sleep 10
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |field_name,value|
  if page.has_field?(field_name)
    fill_in(field_name, :with => value, match: :prefer_exact)
    sleep 10
  else
    writeFailure "#{field_name} is not visible over the page"
  end
end