

And(/^I verify the "([^"]*)" pickList$/) do |type|
  begin
   sleep 2
   if page.has_content?(type)
     puts "Successfully see the #{type} name"
     if page.has_xpath?("//select[@id='acc6']")
       puts "Successfully see the #{type} pickList"
     else
       putstr "Failed to see the #{type} pickList"
     end
   else
     putstr "Failed to see the #{type} name"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} pickList"
  end
end


And(/^I able to see the "([^"]*)" pickList values$/) do |type|
  begin
    sleep 2
    arg = getDetails 'AccountTypePickListValues'

    if page.has_xpath?("//select[@id='acc6']")

      puts "Successfully see the #{type} pickList"

      $type = []

      all(:xpath,"//select[@id='acc6']/option").each do |options|

        $type << options.text
      end

      if $type.include?arg["TypePartner"]
        puts "Successfully see the #{type} #{arg["TypePartner"]} pickList value"
      else
        putstr "Failed to see the #{type} #{arg["TypePartner"]} pickList value"
      end

      if $type.include?arg["TypeProximity"]
        puts "Successfully see the #{type} #{arg["TypeProximity"]} pickList value"
      else
        putstr "Failed to see the #{type} #{arg["TypeProximity"]} pickList value"
      end

      if $type.include?arg["TypeDosti"]
        puts "Successfully see the #{type} #{arg["TypeDosti"]} pickList value"
      else
        putstr "Failed to see the #{type} #{arg["TypeDosti"]} pickList value"
      end

    else
      putstr "Failed to see the #{type} pickList"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} pickList values"
  end
end


And(/^I verify new account field$/) do
  begin
  sleep 3
  arg = getDetails 'NewAccountInformation'

  if page.has_content?arg["AccountName"]
    puts "Successfully see the #{arg["AccountName"]} field"
  else
    putstr "Failed to see the #{arg["AccountName"]} field"
  end

  if page.has_content?arg["ParentAccount"]
    puts "Successfully see the #{arg["ParentAccount"]} field"
  else
    putstr "Failed to see the #{arg["ParentAccount"]} field"
  end

  if page.has_content?arg["AccountCurrency"]
    puts "Successfully see the #{arg["AccountCurrency"]} field"
  else
    putstr "Failed to see the #{arg["AccountCurrency"]} field"
  end

  if page.has_content?arg["AccountOwner"]
  puts "Successfully see the #{arg["AccountOwner"]} field"
  else
    putstr "Failed to see the #{arg["AccountOwner"]} field"
  end

  if page.has_content?arg["AccountType"]
    puts "Successfully see the #{arg["AccountType"]} field"
  else
    putstr "Failed to see the #{arg["AccountType"]} field"
  end

  rescue Exception => ex
    putstr "Error occurred while verifying the account fields"
  end
end


And(/^I verify "([^"]*)" field should be visible$/) do |zip_code|
  begin
    sleep 2
    $account_zip_code = false
    if page.has_content?(zip_code)
      puts "Successfully see the #{zip_code} field"
      if page.has_xpath?("//div[3]/table/tbody/tr[9]/td[2]/input")
        puts "Successfully see the #{zip_code} text box field is visible"
        $account_zip_code = true
      else
        putstr "Failed to see the #{zip_code} text box field is not visible"
      end
    else
      putstr "Failed to see the #{zip_code} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{zip_code} field is visible"
  end
end


And(/^I fill the account required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewAccountInformation'

    $account_name = "#{arg["AccountRequiredName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#acc2")
      puts "Successfully see the Account Name field"
      find("#acc2").send_keys $account_name
    else
      putstr "Failed to find the Account Name field"
    end

    if page.has_content?(arg["ClientCompanyIDField"])
      puts "Successfully see the #{arg["ClientCompanyIDField"]} field"

      fill_in arg["ClientCompanyIDField"],:with => arg["ClientCompanyIDValue"]
      puts "Successfully fill the #{arg["ClientCompanyIDField"]} field"

    else
      putstr "Failed to see the #{arg["ClientCompanyIDField"]} field"
    end


    if page.has_css?("#acc3")
      puts "Successfully see the Parent Account Lookup field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Parent Account Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["ParentAccountName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Parent Account Lookup field"
    end
    puts "Successfully fill the account required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the account required fields"
  end
end

Then(/^I able to see the account created successfully$/) do
  begin
    sleep 10
    arg = getDetails 'NewAccountInformation'

    if page.has_content? arg["AccountDetailspage"]
        puts "Successfully created the Account record"

        if find(".topName").text == $account_name
          puts "Successfully created the Account: #{$account_name}"
        else
          putstr "Failed to created the Account: #{$account_name}"
        end
    else
      putstr "Failed to created the Account record"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created Account record: #{$account_name}"
  end
end



And(/^I verify the "([^"]*)" field is visible in the "([^"]*)" column under "([^"]*)"$/) do |field_name, field_position, section_name|
  begin
  sleep 2
  if page.has_content?(field_name)
    puts "Successfully see the #{field_name} field"

    if page.has_xpath?("//h3[text()='#{section_name}']/ancestor::div[1]/following-sibling::div[1]//label[text()='#{field_name}']")
      puts "#{field_name} field is visible in the #{field_position} column under #{section_name}"
    else
      putstr "#{field_name} field is not visible in the #{field_position} column under #{section_name}"
    end
  else
    putstr "Failed to see the #{field_name} field"
  end
  rescue Exception => ex
   putstr "Error occurred while verifying the #{field_name} field is visible under #{section_name}"
 end
end



And(/^I verify the section "([^"]*)" field "([^"]*)" index "([^"]*)" and "([^"]*)" is editable for all users except "([^"]*)"$/) do |section_index, field, index_one, index_two, role|
  begin
  sleep 3
  unless (ENV['UserRole'].include? role)

    if page.has_content?(field)
      puts "Successfully see the #{field} field"

      within all(".pbSubsection")[section_index.to_i] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if (row.all("td")[index_one.to_i].text == field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)
              puts "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)
              puts "#{field} text box field is visible with edit permissions"
              break
            else
              putstr "#{field} field is visible with read only permissions"
              break
            end

          elsif (row.all("td")[index_one.to_i].first("label").text.include? field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)
              puts "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)
              puts "#{field} text box field is visible with edit permissions"
              break
            else
              putstr "#{field} field is visible with read only permissions"
              break
            end

          end
        end
        putstr "Failed to see the #{field} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field} field"
    end
  else
    if page.has_content?(field)
      puts "Successfully see the #{field} field"

      within all(".pbSubsection")[section_index.to_i] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|

          if (row.all("td")[index_one.to_i].text == field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)
              putstr "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)
              putstr "#{field} text box field is visible with edit permissions"
              break
            else
              puts "#{field} field is visible with read only permissions"
              break
            end

          elsif (row.all("td")[index_one.to_i].first("label").text.include? field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)
              putstr "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)
              putstr "#{field} text box field is visible with edit permissions"
              break
            else
              puts "#{field} field is visible with read only permissions"
              break
            end

          end
        end
        putstr "Failed to see the #{field} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field} field"
    end
  end
  rescue Exception => ex
   putstr "#{field} field is not visible with read only permissions"
 end
end


And(/^I verify the section "([^"]*)" text box field "([^"]*)" index "([^"]*)" and "([^"]*)" values is editable for all users except "([^"]*)"$/) do |section_index, field, index_one, index_two, role|
  begin
  sleep 3
  arg = getDetails 'NewAccountInformation'

  unless (ENV['UserRole'].include? role)

    if page.has_content?(field)
      puts "Successfully see the #{field} field"

      within all(".pbSubsection")[section_index.to_i] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if (row.all("td")[index_one.to_i].text == field)
            result = true

            if (row.all("td")[index_two.to_i].first("input")[:type] == arg["TextBoxValue"])
              puts "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("span").first("input")[:type] == arg["TextBoxValue"])
              puts "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("input")[:type] == arg["TextBoxValue"])
              puts "#{field} text box field is visible with edit permissions"
              break
            else
              putstr "#{field} field is visible with read only permissions"
              break
            end

          elsif (row.all("td")[index_one.to_i].first("label").text.include? field)
            result = true

            if (row.all("td")[index_two.to_i].first("input")[:type] == arg["TextBoxValue"])
              puts "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("span").first("input")[:type] == arg["TextBoxValue"])
              puts "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("input")[:type] == arg["TextBoxValue"])
              puts "#{field} text box field is visible with edit permissions"
              break
            else
              putstr "#{field} field is visible with read only permissions"
              break
            end

          end
        end
        putstr "Failed to see the #{field} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field} field"
    end
  else
    if page.has_content?(field)
      puts "Successfully see the #{field} field"

      within all(".pbSubsection")[section_index.to_i] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|

          if (row.all("td")[index_one.to_i].text == field)
            result = true

            if (row.all("td")[index_two.to_i].first("input")[:type] == arg["TextBoxValue"])
              putstr "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("span").first("input")[:type] == arg["TextBoxValue"])
              putstr "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("input")[:type] == arg["TextBoxValue"])
              putstr "#{field} text box field is visible with edit permissions"
              break
            else
              puts "#{field} field is visible with read only permissions"
              break
            end

          elsif (row.all("td")[index_one.to_i].first("label").text.include? field)
            result = true

            if (row.all("td")[index_two.to_i].first("input")[:type] == arg["TextBoxValue"])
              putstr "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("span").first("input")[:type] == arg["TextBoxValue"])
              putstr "#{field} text box field is visible with edit permissions"
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("input")[:type] == arg["TextBoxValue"])
              putstr "#{field} text box field is visible with edit permissions"
              break
            else
              puts "#{field} field is visible with read only permissions"
              break
            end
          else
            puts "#{field} field is visible with read only permissions"
            break
          end
        end
        putstr "Failed to see the #{field} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field} field"
    end
  end
  rescue Exception => ex
   putstr "#{field} field is not visible with read only permissions"
 end
end


And(/^I verify the section "([^"]*)" pickList field "([^"]*)" index "([^"]*)" and "([^"]*)" values is editable for all users except "([^"]*)"$/) do |section_index, field, index_one, index_two, role|
  begin
  sleep 3
  field_name = field.delete(' ')

  arg = getDetails "#{field_name}PickListValues"

  $pickList_values = []
  $field_pickList_values = []

  $pickList_values =  arg[field_name+"Values"].split(",")

  unless (ENV['UserRole'].include? role)
    if page.has_content?(field)
      puts "Successfully see the #{field} field"

      within all(".pbSubsection")[section_index.to_i] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|

          if (row.all("td")[index_one.to_i].text == field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end

              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end

              break
            elsif (row.all("td")[index_two.to_i].first("span").first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("span").first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end

              break
            else
              putstr "#{field} field is visible with read only permissions"
              break
            end

          elsif (row.all("td")[index_one.to_i].first("label").text.include? field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end
              break
            else
              putstr "#{field} field is visible with read only permissions"
              break
            end

          end
        end
        putstr "Failed to see the #{field} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field} field"
    end
  else
    if page.has_content?(field)
      puts "Successfully see the #{field} field"

      within all(".pbSubsection")[section_index.to_i] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|

          if (row.all("td")[index_one.to_i].text == field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end

              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end

              break
            elsif (row.all("td")[index_two.to_i].first("span").first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("span").first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end

              break
            else
              puts "#{field} field is visible with read only permissions"
              return
            end

          elsif (row.all("td")[index_one.to_i].first("label").text.include? field)
            result = true

            if (row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end
              break
            elsif (row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[index_two.to_i].first("div").first("span").first("select").all('option').collect(&:text)

              puts "#{field} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{field} pickList value: #{value}"
                else
                  putstr "Failed to see the #{field} pickList value: #{value}"
                end
              end
              break
            else
              puts "#{field} field is visible with read only permissions"
              break
            end
          else
            puts "#{field} field is visible with read only permissions"
            return
          end
        end
        putstr "Failed to see the #{field} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field} field"
    end
  end
  rescue Exception => ex
    putstr "#{field} field is not visible with read only permissions"
  end
end


And(/^I verify the "([^"]*)" required field$/) do |client_company_id|
  begin
    sleep 2
    if page.has_content?(client_company_id)
      puts "Successfully see the #{client_company_id} field"

      if page.has_xpath?("//label[text()='#{client_company_id}']/ancestor::td[1]/following-sibling::td[1]/div[@class='requiredInput']/input[@type='text']")
        puts "Successfully see the required field: #{client_company_id}"
      else
        putstr "Failed to see the required field: #{client_company_id}"
      end
    else
      putstr "Failed to see the #{client_company_id} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{client_company_id} required field"
  end
end


And(/^I should not able to see "([^"]*)" "([^"]*)"$/) do |field, related_list|
  begin
  sleep 3
    unless page.has_content?(field)
      puts "Unable to see the #{field} #{related_list}"

    else
      putstr "Able to see the #{field} #{related_list}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} #{related_list}"
  end
end


And(/^I verify the "([^"]*)" related list fields$/) do |opportunities|
  begin
   sleep 3
   arg = getDetails "OpportunityRelatedListValues"

   $pickList_values = []

   $pickList_values =  arg["OpportunityRelatedList"].split(",")
   sleep 3

    within all(".listRelatedObject.opportunityBlock")[0] do

      $pickList_values.each do |value|

        if page.has_content? value
          puts "Successfully see the #{opportunities} related list field: #{value}"
        else
          putstr "Failed to see the #{opportunities} related list field: #{value}"
        end
      end

    end
  rescue Exception => ex
   putstr "Error occurred while verifying the #{opportunities} related list fields"
 end
end



When(/^I fill the opportunity required fields$/) do
  begin
    sleep 3
    arg = getDetails 'NewAccountInformation'

    $opportunity_name = "#{arg["OpportunityNameValue"]}#{Time.now.strftime('%m%d_%H%M_%S')}"


    if page.has_css?("#opp3")
      puts "Successfully see the #{arg["OpportunityNameField"]} field"

      fill_in arg["OpportunityNameField"],:with => $opportunity_name

      puts "Successfully fill the #{arg["OpportunityNameField"]} field"
    else
      putstr "Failed to see the #{arg["OpportunityNameField"]} field"
    end

    if page.has_select?(arg["OpportunityStageField"])
      puts "Successfully see the #{arg["OpportunityStageField"]} field"

      select(arg["OpportunityStageValue"], :from => arg["OpportunityStageField"], :match => :first)

      puts "Successfully selected the #{arg["OpportunityStageField"]} option: #{arg["OpportunityStageValue"]}"
    else
      putstr "Failed to see the #{arg["OpportunityStageField"]} field"
    end


    if page.has_css?("#opp9")
      puts "Successfully see the #{arg["OpportunityCloseDateField"]} field"

      find("#opp9").set arg["OpportunityCloseDateValue"]

      puts "Successfully fill the #{arg["OpportunityCloseDateField"]} field"
    else
      putstr "Failed to see the #{arg["OpportunityCloseDateField"]} field"
    end


    if page.has_select?(arg["OpportunityTypeField"])
      puts "Successfully see the #{arg["OpportunityTypeField"]} field"

      select(arg["OpportunityTypeValue"], :from => arg["OpportunityTypeField"])

      puts "Successfully selected the #{arg["OpportunityTypeField"]} option: #{arg["OpportunityTypeValue"]}"
    else
      putstr "Failed to see the #{arg["OpportunityTypeField"]} field"
    end


    if page.has_select?(arg["BusinessLineField"])
      puts "Successfully see the #{arg["BusinessLineField"]} field"

      select(arg["BusinessLineValue"], :from => arg["BusinessLineField"])

      puts "Successfully selected the #{arg["BusinessLineField"]} option: #{arg["BusinessLineValue"]}"
    else
      putstr "Failed to see the #{arg["BusinessLineField"]} field"
    end


    if page.has_select?(arg["OpportunityClientRegionField"])
      puts "Successfully see the #{arg["OpportunityClientRegionField"]} field"

      select(arg["OpportunityClientRegionValue"], :from => arg["OpportunityClientRegionField"])

      puts "Successfully selected the #{arg["OpportunityClientRegionField"]} option: #{arg["OpportunityClientRegionValue"]}"
    else
      putstr "Failed to see the #{arg["OpportunityClientRegionField"]} field"
    end


    if page.has_select?(arg["OpportunityCountryField"])
      puts "Successfully see the #{arg["OpportunityCountryField"]} field"

      select(arg["OpportunityCountryValue"], :from => arg["OpportunityCountryField"])

      puts "Successfully selected the #{arg["OpportunityCountryField"]} option: #{arg["OpportunityCountryValue"]}"
    else
      putstr "Failed to see the #{arg["OpportunityCountryField"]} field"
    end

    if page.has_select?(arg["OpportunitySSITheatreField"])
      puts "Successfully see the #{arg["OpportunitySSITheatreField"]} field"

      select(arg["OpportunitySSITheatreValue"], :from => arg["OpportunitySSITheatreField"])

      puts "Successfully selected the #{arg["OpportunitySSITheatreField"]} option: #{arg["OpportunitySSITheatreValue"]}"
    else
      putstr "Failed to see the #{arg["OpportunitySSITheatreField"]} field"
    end


    if page.has_select?(arg["OpportunityDirectChannelField"])
      puts "Successfully see the #{arg["OpportunityDirectChannelField"]} field"

      select(arg["OpportunityDirectChannelValue"], :from => arg["OpportunityDirectChannelField"])

      puts "Successfully selected the #{arg["OpportunityDirectChannelField"]} option: #{arg["OpportunityDirectChannelValue"]}"
    else
      putstr "Failed to see the #{arg["OpportunityDirectChannelField"]} field"
    end


    if page.has_select?(arg["OpportunityClientTerritoryField"])
      puts "Successfully see the #{arg["OpportunityClientTerritoryField"]} field"

      select(arg["OpportunityClientTerritoryValue"], :from => arg["OpportunityClientTerritoryField"])

      puts "Successfully selected the #{arg["OpportunityClientTerritoryField"]} option: #{arg["OpportunityClientTerritoryValue"]}"
    else
      putstr "Failed to see the #{arg["OpportunityClientTerritoryField"]} field"
    end


    if page.has_content?(arg["OpportunityPriceBookFieldField"])
      puts "Successfully see the #{arg["OpportunityPriceBookFieldField"]} field"

      fill_in arg["OpportunityPriceBookFieldField"],:with => arg["OpportunityPriceBookFieldValue"]

      puts "Successfully fill the #{arg["OpportunityPriceBookFieldField"]} field"
    else
      putstr "Failed to see the #{arg["OpportunityPriceBookFieldField"]} field"
    end

    puts "Successfully see the filled the opportunity required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the opportunity required fields"
  end
end


Then(/^I able to see the opportunity created successfully$/) do
  sleep 3
  arg = getDetails 'NewAccountInformation'

  if page.has_content?(arg["OpportunityDetailsPage"])
    puts "Successfully see the #{arg["OpportunityDetailsPage"]} page"

    if page.has_css?("#opp3_ileinner")
      puts "Successfully see the #{arg["OpportunityNameField"]} field"
      sleep 4
      if find("#opp3_ileinner").text == $opportunity_name
        puts "Successfully created the opportunity record: #{$opportunity_name}"
      else
        raise "Failed to created the opportunity record: #{$opportunity_name}"
      end
    else
      raise "Failed to see the #{arg["OpportunityNameField"]} field"
    end

  else
    raise "Failed to created the #{arg["OpportunityDetailsPage"]} page"
  end
end



And(/^I click on the "([^"]*)" link from "([^"]*)" page$/) do |account_name, account_details|
  begin
    sleep 4

    if page.has_content?(account_details)
      puts "Successfully see the #{account_details} page"

      within all(".pbSubsection")[0] do

        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|

          if row.all("td")[0].text == account_name
            puts "Successfully see the #{account_name} record"
            result = true
            row.all("td")[1].first("div").first("a").click

            puts "Successfully clicked the #{account_name} record"
            sleep 5
            break
          end
        end
        putstr "Failed to see the #{account_name} field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{account_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while clicking the #{account_name} link from #{account_details} page"
  end
end


And(/^I verify the "([^"]*)" required pickList field$/) do |type|
  begin
    sleep 2
    if page.has_content?(type)
      puts "Successfully see the #{type} field"

      if page.has_xpath?("//label[text()='#{type}']/ancestor::td[1]/following-sibling::td[1]/div[@class='requiredInput']//select")
        puts "Successfully see the required field: #{type}"
      else
        putstr "Failed to see the required field: #{type}"
      end
    else
      putstr "Failed to see the #{type} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} required pickList field"
  end
end



And(/^I able to see the "([^"]*)" default value "([^"]*)"$/) do |type, default_value|
  begin
   sleep 3

    if page.has_css?("#acc6")
      if page.has_select?("acc6", :selected => default_value)
        puts "Successfully see the #{type} default value: #{default_value}"
      else
        putstr "Failed to see the #{type} default value: #{default_value}"
      end
    else
      putstr "Failed to see the #{type} #{default_value} default value"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} default value #{default_value}"
  end
end


