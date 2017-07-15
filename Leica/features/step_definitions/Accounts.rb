When(/^I should see the field "([^"]*)" with edit permission except for salesops role$/) do |field_name|
sleep 10

if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1][contains(@class,"EditWrite")]')
  puts "The field - #{field_name} - is present with Edit permission"
else
  writeFailure "Fail The field - #{field_name} - is not present with Edit permission"
end
end


When(/^find count$/) do 
sleep 10
list=[]
#list = find(:xpath, '//input[@title="New"]').all
#puts list.size

puts page.all(:xpath, '//input[@title="New"]').length
end

When(/^I should see the field "([^"]*)" with edit $/) do 
sleep 10

if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1][contains(@class,"EditWrite")]')
  puts "The field - #{field_name} - is present with Edit permission"
else
  writeFailure "Fail The field - #{field_name} - is not present with Edit permission"
end
end