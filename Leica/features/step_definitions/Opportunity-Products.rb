
Given(/^I should navigate to opportunity tab in saleforce application$/) do
  visit get_url
  sleep 15
  value = getCredentialInfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 50
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 20
  find(:xpath,".//a[@class='listRelatedObject opportunityBlock title']").click
  sleep 50
end

When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "smoke-test-opportunity-2-222")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
  click_on "smoke-test-opportunity-2-222"
  sleep 10
end

When(/^I click on any existing Opportunity Product$/) do
  find(:xpath,"//a[@title='Edit - Record 1 - Smoke Test Product']").click
  sleep 10
end


When(/^I fill "([^"]*)" with "([^"]*)"$/) do |field_name, value|
  fill_in(field_name, :with => value,match: :prefer_exact)
  sleep 10
end
