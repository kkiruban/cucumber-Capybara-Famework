Then(/^I check that Do Not Call checkbox is read only for all users$/) do
if page.has_content?("Do Not Call")
  puts "Do Not Call checkbox is visible"
 if page.has_field?('con27', :type => 'checkbox') == true
    writeFailure "Do Not Call checkbox is editable"
  else
     puts "Do Not Call checkbox is not editable"
 end
else
  writeFailure "Do Not Call checkbox is not visible"
end
end

Then(/^I check that Fax Opt Out checkbox is read only for all users$/) do
if page.has_content?("Fax Opt Out")
  puts "Fax Opt Out checkbox is visible"
 if page.has_field?('con28', :type => 'checkbox') == true
    writeFailure "Fax Opt Out checkbox is editable"
  else
     puts "Fax Opt Out checkbox is not editable"
 end
else
  writeFailure "Fax Opt Out checkbox is not visible"
end
end

Then(/^I check that Email Opt Out checkbox is read only for all users$/) do
if page.has_content?("Email Opt Out")
  puts "Email Opt Out checkbox is visible"
 if page.has_field?('con23', :type => 'checkbox') == true
    writeFailure "Email Opt Out checkbox is editable"
  else
     puts "Email Opt Out checkbox is not editable"
 end
else
  writeFailure "Email Opt Out checkbox is not visible"
end
end

Then(/^I check that Has Opted Out Of Mail text field is editable for all users excepts SalesOps$/) do
  if (ENV['UserRole'] != "SalesOperationSit")
    if page.has_field?("Has Opted Out Of Mail")
      puts "Has Opted Out Of Mail is editable"
    else
      writeFailure "Has Opted Out Of Mail is not editable"
    end
  else
    if page.has_field?("Has Opted Out Of Mail")
      writeFailure "Has Opted Out Of Mail is editable"
    else
      puts "Has Opted Out Of Mail is not editable"
    end
  end
end