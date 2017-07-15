

When(/^I open the existing opportunity$/) do
  begin
    sleep 4
    arg = getDetails 'NewAssetInformation'

    if page.has_css?(".listItemPad")
      all(".listItemPad")[18].click
      sleep 5
      puts "Successfully clicked the opportunity pagination"
    end

    unless page.has_content? arg["NoOpportunitiesMessage"]

      result = false
      all(:xpath, '//div/table/tbody/tr/td[4]/div/a').each do |case_record|
        puts "Successfully find the opportunity record"

        if case_record.text.include? arg["AssetOpportunityName"]
          sleep 3
          case_record.click
          sleep 3
          puts "Successfully open the opportunity record"
          result = true
          break
        end
      end
      putstr "Failed to see the opportunity record" unless result
      sleep 3
    else
      putstr "No Opportunity records found"
    end
  rescue Exception => ex
    putstr "Error occurred while opening the existing opportunity record"
  end
end


And(/^I verify the "([^"]*)" date field$/) do |warranty_end_date|
  begin
    sleep 2
    $asset_warranty_end_date = false
    if page.has_content?(warranty_end_date)
      puts "Successfully see the #{warranty_end_date} date field"
      unless page.has_xpath?("//span[@class='dateInput']/input[@type='text']/following-sibling::span[@class='dateFormat']")
        puts "Successfully see the #{warranty_end_date} date field is read only"
        $asset_warranty_end_date = true
      else
        putstr "Failed to see the #{warranty_end_date} date field is editable"
      end
    else
      putstr "Failed to see the #{warranty_end_date} date field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{warranty_end_date} date is visible"
  end
end


When(/^I verify the asset "([^"]*)" text field should be visible in the left column under "([^"]*)" section$/) do |asset_name, asset_information|
  begin
    sleep 3
    if page.has_content?(asset_name)
      puts "Successfully see the #{asset_name} field"

      if page.has_xpath?("//label[text()='#{asset_name}']/preceding::h3[text()='#{asset_information}']")
        puts "#{asset_name} text field is visible in the left column under #{asset_information} section"

      else
        putstr "#{asset_name} text field is not visible under #{asset_information} section"
      end
    else
      putstr "Failed to see the #{asset_name} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{asset_name} text field is visible in the left column under #{asset_information} section"
  end
end


# And(/^I verify the "([^"]*)" text field should be editable only for OpsRep & OpsMgr$/) do |asset_name|
#   #begin
#     sleep 3
#     arg = getDetails 'NewAssetInformation'

#     if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit")
#       if page.has_content?(asset_name)
#         puts "Successfully see the #{asset_name} field"
#         puts "Under First Block"
#          within all(".pbSubsection")[1] do
#           puts "Inside PB Subsection"
#          #within(".pbSubsection") do
#           tr = first("tbody").all("tr")
#           sleep 3
#           result = false
#           tr.each do |row|
#             if row.all("td")[0].text.include? asset_name
#               result = true
#               puts"The result is #{result}"
#               if page.has_xpath?("//label[text()='#{asset_name}']/parent::td/following-sibling::td[1]//input")
#                 if row.all("td")[1].first("div").first("input")[:type] == arg["AssetsTextBox"]
#                   puts "#{asset_name} text box field is visible in the left column with editable permissions"
#                   break
#                 else
#                   putstr "#{asset_name} text box field is visible with read only permissions"
#                 end
#               else
#                 putstr "#{asset_name} text box field is visible with read only permissions"
#               end
#             end
#           end
#           putstr "Failed to see the #{asset_name} field" unless result
#           sleep 3
#          end
#      else
#        putstr "Failed to see the #{asset_name} field"
#      end
#     else
#       if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
#         if page.has_content?(asset_name)
#           puts "Successfully see the #{asset_name} field"

#            within all(".pbSubsection")[1] do
#            #within(".pbSubsection") do
#             tr = first("tbody").all("tr")
#             sleep 3
#             result = false
#             tr.each do |row|
#               if row.all("td")[0].text.include? asset_name
#                 result = true
#                 if page.has_xpath?("//label[text()='#{asset_name}']/parent::td/following-sibling::td[1]//input")
#                   if row.all("td")[1].first("div").first("input")[:type] == arg["AssetsTextBox"]
#                     putstr "#{asset_name} text box field is visible with editable permissions"
#                     break
#                   else
#                     puts "#{asset_name} text box field is visible in the left column with read only permissions"
#                   end
#                 else
#                   puts "#{asset_name} text box field is visible in the left column with read only permissions"
#                 end
#               end
#             end
#             putstr "Failed to see the #{asset_name} field" unless result
#             sleep 3
#             end
#         else
#           putstr "Failed to see the #{asset_name} field"
#         end
#       end
#     end
#   #rescue Exception => ex
#     #putstr "Error occurred while verifying the #{asset_name} text box field is visible in the left column with editable permissions"
#   #end
# end



When(/^I click the existing "([^"]*)" record$/) do |asset|
  begin
    sleep 3
    arg = getDetails 'NewAssetInformation'

    if page.has_css?(".list")
      puts "Successfully see the #{asset} records"
      within(".list") do
        tr = first("tbody").all(".dataRow")
        sleep 3
        tr.each do |row|

          if row.first("th").first("a").text.include? arg["NewAssetName"]

            row.first("th").first("a").click
            sleep 4
            puts "Successfully clicked the #{asset} record"
            break
          else
            putstr "Failed to see the #{asset} record"
          end
        end
      end
    else
      putstr "Failed to see the #{asset} records"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the existing #{asset} records"
  end
end


And(/^I should not able to see the "([^"]*)" section under "([^"]*)"$/) do |section_name, related_list|
  begin
    sleep 3
    unless (page.has_content?(section_name)) && (page.has_content?(related_list))
      puts "Unable to see the #{section_name} section under #{related_list}"
    else
      putstr "Able to see the #{section_name} section under #{related_list}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{section_name} section under #{related_list}"
  end
end


Then(/^I verify the "([^"]*)" button should not available by Sales Rep$/) do |new_button|
  begin
    sleep 3

    if (ENV['UserRole'] == "MarkemOperationManagerSit") || (ENV['UserRole'] == "MarkemOperationRepSit") || (ENV['UserRole'] == "MarkemAdmin") || (ENV['UserRole'] == "MarkemSalesOperationSit") || (ENV['UserRole'] == "MarkemSalesManagerSit")
      if page.has_button?(new_button)
        puts "Successfully click the #{new_button} button"
      else
        putstr "Failed to see the #{new_button} button"
      end
    else
      if (ENV['UserRole'] == "MarkemSalesRepSit")
        unless page.has_button?(new_button)
          puts "Unable to see the the #{new_button} button"
        else
          putstr "Able to see the #{new_button} button"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{new_button} button"
  end
end


When(/^I click on the "([^"]*)" button is not available by Sales Rep$/) do |new_button|
  begin
   sleep 3
   if (ENV['UserRole'] == "MarkemOperationManagerSit") || (ENV['UserRole'] == "MarkemOperationRepSit") || (ENV['UserRole'] == "MarkemAdmin") || (ENV['UserRole'] == "MarkemSalesOperationSit") || (ENV['UserRole'] == "MarkemSalesManagerSit")
     if page.has_button?(new_button)
       sleep 3
       click_on new_button
       sleep 2
       puts "Successfully click the #{new_button} button"
     else
       putstr "Failed to see the #{new_button} button"
     end
   else
     if (ENV['UserRole'] == "MarkemSalesRepSit")
       unless page.has_button?(new_button)
         puts "Unable to see the the #{new_button} button"
       else
         sleep 3
         click_on new_button
         sleep 2
         putstr "Able to see the #{new_button} button"
       end
     end
   end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{new_button} button"
  end
end


When(/^I verify the "([^"]*)" section is visible under "([^"]*)" section$/) do |service_information, asset_information|
  begin
    sleep 2
    $assets_fields = false
    if page.has_content?(service_information)
      puts "Successfully see the #{service_information} section"
      $assets_fields = true

      if page.has_xpath?("//h3[text()='#{asset_information}']/parent::div/following-sibling::div[@id='head_2_ep']/h3[text()='#{service_information}']")
        puts "Successfully see the #{service_information} section is visible under #{asset_information} section"

      else
        putstr "Failed to see the #{service_information} section is visible under #{asset_information} section"
      end
    else
      putstr "Failed to see the #{service_information} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{service_information} section is visible under #{asset_information} section"
  end
end


When(/^I verify the asset "([^"]*)" pickList field should be visible in the left column under "([^"]*)" section$/) do |asset_currency, asset_information|
  begin
    sleep 3
    if page.has_content?(asset_currency)
      puts "Successfully see the #{asset_currency} field"

      if page.has_xpath?("//label[text()='#{asset_currency}']/preceding::h3[text()='#{asset_information}']")
        puts "#{asset_currency} pickList field is visible in the left column under #{asset_information} section"

      else
        putstr "#{asset_currency} pickList field is not visible under #{asset_information} section"
      end
    else
      putstr "Failed to see the #{asset_currency} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{asset_currency} pickList field is visible in the left column under #{asset_information} section"
  end
end


When(/^I verify the "([^"]*)" pickList field should be editable for all users except salesOps$/) do |field|
  begin
    sleep 3

     if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if page.has_content?(field)
        puts "Successfully see the #{field} field"
        within(".pbSubsection") do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text.include? field
              result = true
              if page.has_xpath?("//label[text()='#{field}']/parent::td/following-sibling::td[1]//select")
                assets_values = row.all("td")[1].first("div").first("select").all('option').collect(&:text)
                if assets_values.count > 0
                  puts "#{field} pickList field is visible in the left column with editable permissions"
                  break
                else
                  putstr "#{field} pickList field is visible with read only permissions"
                end
              else
                putstr "#{field} pickList field is visible with read only permissions"
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
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(field)
          puts "Successfully see the #{field} field"
          within(".pbSubsection") do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text.include? field
                if page.has_xpath?("//label[text()='#{field}']/parent::td/following-sibling::td[1]//select")
                    assets_values = row.all("td")[1].first("div").first("select").all('option').collect(&:text)
                    if assets_values.count > 0
                      putstr "#{field} pickList field is visible in the left column with editable permissions"
                      result = true
                      break
                    end
                else
                  puts "#{field} pickList field is visible with read only permissions"
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
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList field should be visible in the left column with editable permissions"
  end
end


When(/^I verify the "([^"]*)" pickList field values$/) do |asset_currency|
  begin
    sleep 2
    arg = getDetails 'NewAssetInformation'

    sleep 3
    if page.has_content?(asset_currency)
      puts "Successfully see the #{asset_currency} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if page.has_xpath?("//label[text()='#{asset_currency}']/parent::td/following-sibling::td[1]//select")

          within(".pbSubsection") do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text.include? asset_currency

                $asset_currency_values = row.all("td")[1].first("div").first("select").all('option').collect(&:text)
                result = true

                puts "Successfully see the #{asset_currency} pickList"
              end
            end
            putstr "#{asset_currency} pickList field is not visible" unless result
            sleep 3
          end

            if $asset_currency_values.include? arg["AssetCurrencyUSD"]
              puts "Successfully see the #{asset_currency} pickList value: #{arg["AssetCurrencyUSD"]}"
            else
              putstr "Failed to see the #{asset_currency} pickList value: #{arg["AssetCurrencyUSD"]}"
            end

        else
          putstr "#{asset_currency} pickList field is not visible"
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if page.has_xpath?("//label[text()='#{asset_currency}']/parent::td/following-sibling::td[1]//select")

            within(".pbSubsection") do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[0].text.include? asset_currency

                  $asset_currency_values = row.all("td")[1].first("div").first("select").all('option').collect(&:text)
                  result = true

                  puts "Successfully see the #{asset_currency} pickList"

                end
              end
              putstr "#{asset_currency} pickList field is not visible" unless result
              sleep 3
            end

            if $asset_currency_values.include? arg["AssetCurrencyUSD"]
              puts "Successfully see the #{asset_currency} pickList value: #{arg["AssetCurrencyUSD"]}"
            else
              putstr "Failed to see the #{asset_currency} pickList value: #{arg["AssetCurrencyUSD"]}"
            end

        else
          putstr "#{asset_currency} pickList field is not visible"
        end
       end
     end
    else
      putstr "Failed to see the #{asset_currency} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{asset_currency} pickList values"
  end
end


When(/^I verify the asset "([^"]*)" field should be visible under "([^"]*)" field$/) do |field_name, above_field_name|
  begin
    sleep 2
    $assets_fields = false
    if page.has_content?(field_name)
      puts "Successfully see the #{field_name} field"
      $assets_fields = true

      if page.has_xpath?("//label[text()='#{above_field_name}']/ancestor::tr[1]/following-sibling::tr[1]/child::td[1]/label[text()='#{field_name}']")
        puts "Successfully see the #{field_name} field is visible under #{above_field_name} field"

      else
        putstr "Failed to see the #{field_name} field is visible under #{above_field_name} field"
      end

    else
      putstr "Failed to see the #{field_name} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field_name} field is visible under #{above_field_name} filed"
  end
end


When(/^I verify the "([^"]*)" field values$/) do |priority|
  begin
    sleep 2
    arg = getDetails 'AssetsPriorityPickListValues'

    sleep 3
    if page.has_content?(priority)
      puts "Successfully see the #{priority} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if $assets_fields == true

          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == priority

                $priority_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                result = true

                puts "Successfully see the #{priority} pickList"

              end
            end
            putstr "#{priority} pickList field is not visible" unless result
            sleep 3
          end

          if $priority_values.include?arg["AssetsPriorityLow"]
            puts "Successfully see the #{priority} pickList value: #{arg["AssetsPriorityLow"]}"
          else
            putstr "Failed to see the #{priority} pickList value: #{arg["AssetsPriorityLow"]}"
          end

          if $priority_values.include?arg["AssetsPriorityHigh"]
            puts "Successfully see the #{priority} pickList value: #{arg["AssetsPriorityHigh"]}"
          else
            putstr "Failed to see the #{priority} pickList value: #{arg["AssetsPriorityHigh"]}"
          end

        else
          putstr "#{priority} pickList field is not visible"
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if $assets_fields == true

            within all(".pbSubsection")[1] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[0].text == priority

                  $priority_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  result = true

                  puts "Successfully see the #{priority} pickList"

                end
              end
              putstr "#{priority} pickList field is not visible" unless result
              sleep 3
            end

            if $priority_values.include?arg["AssetsPriorityLow"]
              puts "Successfully see the #{priority} pickList value: #{arg["AssetsPriorityLow"]}"
            else
              putstr "Failed to see the #{priority} pickList value: #{arg["AssetsPriorityLow"]}"
            end

            if $priority_values.include?arg["AssetsPriorityHigh"]
              puts "Successfully see the #{priority} pickList value: #{arg["AssetsPriorityHigh"]}"
            else
              putstr "Failed to see the #{priority} pickList value: #{arg["AssetsPriorityHigh"]}"
            end

          end
        else
          putstr "#{priority} pickList field is not visible"
        end
      end
    else
      putstr "Failed to see the #{priority} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{priority} pickList values"
  end
end


When(/^I able to see the asset "([^"]*)" pickList values$/) do |reason_code|
  begin
    sleep 2
    arg = getDetails 'AssetsReasonCodePickListValues'

    sleep 3
    if page.has_content?(reason_code)
      puts "Successfully see the #{reason_code} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if $assets_fields == true

          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == reason_code

                $reason_code_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                result = true

                puts "Successfully see the #{reason_code} pickList"

              end
            end
            putstr "#{reason_code} pickList field is not visible" unless result
            sleep 3
          end


          if $reason_code_values.include?arg["AssetsReasonCodeClientReplacement"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeClientReplacement"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeClientReplacement"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodeCompetitorReplacement"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeCompetitorReplacement"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeCompetitorReplacement"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodeDidNotUse"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeDidNotUse"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeDidNotUse"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodePriceRepair"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodePriceRepair"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodePriceRepair"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodeOutOfBusiness"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeOutOfBusiness"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeOutOfBusiness"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodeSpecialtyUse"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSpecialtyUse"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSpecialtyUse"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodeBackupUnit"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeBackupUnit"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeBackupUnit"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodeStandaloneUnit"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeStandaloneUnit"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeStandaloneUnit"]}"
          end

          if $reason_code_values.include?arg["AssetsReasonCodeSeasonal"]
            puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSeasonal"]}"
          else
            putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSeasonal"]}"
          end

        else
          putstr "#{reason_code} pickList field is not visible"
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if $assets_fields == true

            within all(".pbSubsection")[1] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[0].text == reason_code

                  $reason_code_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  result = true

                  puts "Successfully see the #{reason_code} pickList"

                end
              end
              putstr "#{reason_code} pickList field is not visible" unless result
              sleep 3
            end


            if $reason_code_values.include?arg["AssetsReasonCodeClientReplacement"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeClientReplacement"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeClientReplacement"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodeCompetitorReplacement"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeCompetitorReplacement"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeCompetitorReplacement"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodeDidNotUse"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeDidNotUse"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeDidNotUse"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodePriceRepair"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodePriceRepair"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodePriceRepair"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodeOutOfBusiness"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeOutOfBusiness"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeOutOfBusiness"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodeSpecialtyUse"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSpecialtyUse"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSpecialtyUse"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodeBackupUnit"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeBackupUnit"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeBackupUnit"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodeStandaloneUnit"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeStandaloneUnit"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeStandaloneUnit"]}"
            end

            if $reason_code_values.include?arg["AssetsReasonCodeSeasonal"]
              puts "Successfully see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSeasonal"]}"
            else
              putstr "Failed to see the #{reason_code} pickList value: #{arg["AssetsReasonCodeSeasonal"]}"
            end

          end
        else
          putstr "#{reason_code} pickList field is not visible"
        end
      end
    else
      putstr "Failed to see the #{reason_code} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{reason_code} pickList values"
  end
end




When(/^I able to see the asset "([^"]*)" pickList field values$/) do |service_choice|
  begin
    sleep 2
    arg = getDetails 'AssetsServiceChoicePickListValues'

    sleep 3
    if page.has_content?(service_choice)
      puts "Successfully see the #{service_choice} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if $assets_fields == true

          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == service_choice

                $service_choice_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                result = true

                puts "Successfully see the #{service_choice} pickList"

              end
            end
            putstr "#{service_choice} pickList field is not visible" unless result
            sleep 3
          end


          if $service_choice_values.include?arg["AssetsServiceChoiceContract"]
            puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceContract"]}"
          else
            putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceContract"]}"
          end

          if $service_choice_values.include?arg["AssetsServiceChoiceOnDemand"]
            puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceOnDemand"]}"
          else
            putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceOnDemand"]}"
          end

          if $service_choice_values.include?arg["AssetsServiceChoiceParty"]
            puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceParty"]}"
          else
            putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceParty"]}"
          end

          if $service_choice_values.include?arg["AssetsServiceChoiceInHouse"]
            puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceInHouse"]}"
          else
            putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceInHouse"]}"
          end

          if $service_choice_values.include?arg["AssetsServiceChoiceNone"]
            puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceNone"]}"
          else
            putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceNone"]}"
          end

        else
          putstr "#{service_choice} pickList field is not visible"
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if $assets_fields == true

            within all(".pbSubsection")[1] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == service_choice

                  $service_choice_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                  result = true

                  puts "Successfully see the #{service_choice} pickList"

                end
              end
              putstr "#{service_choice} pickList field is not visible" unless result
              sleep 3
            end

            if $service_choice_values.include?arg["AssetsServiceChoiceContract"]
              puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceContract"]}"
            else
              putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceContract"]}"
            end

            if $service_choice_values.include?arg["AssetsServiceChoiceOnDemand"]
              puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceOnDemand"]}"
            else
              putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceOnDemand"]}"
            end

            if $service_choice_values.include?arg["AssetsServiceChoiceParty"]
              puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceParty"]}"
            else
              putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceParty"]}"
            end

            if $service_choice_values.include?arg["AssetsServiceChoiceInHouse"]
              puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceInHouse"]}"
            else
              putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceInHouse"]}"
            end

            if $service_choice_values.include?arg["AssetsServiceChoiceNone"]
              puts "Successfully see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceNone"]}"
            else
              putstr "Failed to see the #{service_choice} pickList value: #{arg["AssetsServiceChoiceNone"]}"
            end

          end
        else
          putstr "#{service_choice} pickList field is not visible"
        end
      end
    else
      putstr "Failed to see the #{service_choice} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{service_choice} pickList values"
  end
end


When(/^I able to see the asset "([^"]*)" field values$/) do |service_choice_reason|
  begin
    sleep 2
    arg = getDetails 'AssetsServiceChoiceReasonPickListValues'

    sleep 3
    if page.has_content?(service_choice_reason)
      puts "Successfully see the #{service_choice_reason} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if $assets_fields == true

          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == service_choice_reason

                $service_choice_reason_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                result = true

                puts "Successfully see the #{service_choice_reason} pickList"

              end
            end
            putstr "#{service_choice_reason} pickList field is not visible" unless result
            sleep 3
          end


          if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonPrice"]
            puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonPrice"]}"
          else
            putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonPrice"]}"
          end

          if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonTimeMaterials"]
            puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonTimeMaterials"]}"
          else
            putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonTimeMaterials"]}"
          end

          if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonConvenience"]
            puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonConvenience"]}"
          else
            putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonConvenience"]}"
          end

          if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonServiceType"]
            puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonServiceType"]}"
          else
            putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonServiceType"]}"
          end

          if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonRequirements"]
            puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonRequirements"]}"
          else
            putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonRequirements"]}"
          end

          if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonNoPerceivedValue"]
            puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonNoPerceivedValue"]}"
          else
            putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonNoPerceivedValue"]}"
          end

        else
          putstr "#{service_choice_reason} pickList field is not visible"
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if $assets_fields == true

            within all(".pbSubsection")[1] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == service_choice_reason

                  $service_choice_reason_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                  result = true

                  puts "Successfully see the #{service_choice_reason} pickList"

                end
              end
              putstr "#{service_choice_reason} pickList field is not visible" unless result
              sleep 3
            end

            if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonPrice"]
              puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonPrice"]}"
            else
              putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonPrice"]}"
            end

            if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonTimeMaterials"]
              puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonTimeMaterials"]}"
            else
              putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonTimeMaterials"]}"
            end

            if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonConvenience"]
              puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonConvenience"]}"
            else
              putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonConvenience"]}"
            end

            if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonServiceType"]
              puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonServiceType"]}"
            else
              putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonServiceType"]}"
            end

            if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonRequirements"]
              puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonRequirements"]}"
            else
              putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonRequirements"]}"
            end

            if $service_choice_reason_values.include?arg["AssetsServiceChoiceReasonNoPerceivedValue"]
              puts "Successfully see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonNoPerceivedValue"]}"
            else
              putstr "Failed to see the #{service_choice_reason} pickList value: #{arg["AssetsServiceChoiceReasonNoPerceivedValue"]}"
            end

          end
        else
          putstr "#{service_choice_reason} pickList field is not visible"
        end
      end
    else
      putstr "Failed to see the #{service_choice_reason} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{service_choice_reason} pickList values"
  end
end


When(/^I able to see the asset "([^"]*)" field should be visible under "([^"]*)" field$/) do |service_choice_reason, service_choice|
  begin
    sleep 2
    $assets_fields = false
    if page.has_content?(service_choice_reason)
      puts "Successfully see the #{service_choice_reason} field"
      $assets_fields = true

      if page.has_xpath?("//label[text()='#{service_choice}']/ancestor::tr[1]/following-sibling::tr[1]/child::td[3]/label[text()='#{service_choice_reason}']")
        puts "Successfully see the #{service_choice_reason} field is visible under #{service_choice} field"

      else
        putstr "Failed to see the #{service_choice_reason} field is visible under #{service_choice} field"
      end

    else
      putstr "Failed to see the #{service_choice_reason} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{service_choice_reason} field is visible under #{service_choice} field"
  end
end


When(/^I verify the "([^"]*)" text field should be visible in the right column under "([^"]*)" section$/) do |asset_owner, asset_information|
  begin
    sleep 3
    if page.has_content?(asset_owner)
      puts "Successfully see the #{asset_owner} field"

      if page.has_xpath?("//label[text()='#{asset_owner}']/preceding::h3[text()='#{asset_information}']")
        puts "#{asset_owner} lookup field is visible in the right column under #{asset_information} section"

      else
        putstr "#{asset_owner} lookup field is not visible under #{asset_information} section"
      end
    else
      putstr "Failed to see the #{asset_owner} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{asset_owner} lookup field is visible in the right column under #{asset_information} section"
  end
end


When(/^I verify the asset "([^"]*)" date field should be visible in the right column under "([^"]*)" section$/) do |field, asset_information|
  begin
    sleep 3
    if page.has_content?(field)
      puts "Successfully see the #{field} field"

      if page.has_xpath?("//label[text()='#{field}']/preceding::h3[text()='#{asset_information}']")
        puts "#{field} date field is visible in the right column under #{asset_information} section"

      else
        putstr "#{field} date field is not visible under #{asset_information} section"
      end
    else
      putstr "Failed to see the #{field} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} date field is visible in the right column under #{asset_information} section"
  end
end



When(/^I able to see the "([^"]*)" text field should be editable for all users except salesOps$/) do |field|
  begin
    sleep 3
    arg = getDetails 'NewAssetInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      within(".pbSubsection") do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[2].text == field
            result = true
            if page.has_xpath?("//label[text()='#{field}']/parent::td/following-sibling::td[1]//input")
              if row.all("td")[3].first("span").first("input")[:type] == arg["AssetsTextBox"]
                puts "#{field} field is visible in the right column with editable permissions"
                break
              else
                putstr "#{field} field is not visible with read only permissions"
              end
            else
              putstr "#{field} field is not visible with read only permissions"
            end
          end
        end
        putstr "Failed to see the #{field} field" unless result
        sleep 3
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        within(".pbSubsection") do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == field
              result = true
              if page.has_xpath?("//label[text()='#{field}']/parent::td/following-sibling::td[1]//input")
                if row.all("td")[3].first("span").first("input")[:type] == arg["AssetsTextBox"]
                  putstr "#{field} field is visible in the right column with editable permissions"
                  break
                else
                  puts "#{field} field is not visible in the right column with read only permissions"
                end
              else
                puts "#{field} field is not visible in the right column with read only permissions"
              end
            end
          end
          putstr "Failed to see the #{field} field" unless result
          sleep 3
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} field is visible in the right column with read only permissions"
  end
end


When(/^I verify the "([^"]*)" lookup field should be visible in the left column under "([^"]*)" section$/) do |source_opportunity, asset_information|
  begin
    sleep 3
    if page.has_content?(source_opportunity)
      puts "Successfully see the #{source_opportunity} field"

      if page.has_xpath?("//label[text()='#{source_opportunity}']/preceding::h3[text()='#{asset_information}']")
        puts "#{source_opportunity} lookup field is visible in the left column under #{asset_information} section"

      else
        putstr "#{source_opportunity} lookup field is not visible under #{asset_information} section"
      end
    else
      putstr "Failed to see the #{source_opportunity} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{source_opportunity} lookup field is visible in the left column under #{asset_information} section"
  end
end


When(/^I verify the "([^"]*)" lookup field should be editable for all users except salesOps$/) do |source_opportunity|
  begin
    sleep 3
    arg = getDetails 'NewAssetInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      within(".pbSubsection") do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == source_opportunity
            result = true
            if page.has_xpath?("//label[text()='#{source_opportunity}']/parent::td/following-sibling::td[1]//input")
              if row.all("td")[1].first("span").first("input")[:type] == arg["AssetsTextBox"]
                puts "#{source_opportunity} look-up field is visible in the left column with editable permissions"
                break
              else
                putstr "#{source_opportunity} look-up field is not visible with read only permissions"
              end
            else
              putstr "#{source_opportunity} look-up field is not visible with read only permissions"
            end
          end
        end
        putstr "Failed to see the #{source_opportunity} field" unless result
        sleep 3
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        within(".pbSubsection") do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == source_opportunity
              result = true
              if page.has_xpath?("//label[text()='#{source_opportunity}']/parent::td/following-sibling::td[1]//input")
                if row.all("td")[1].first("span").first("input")[:type] == arg["AssetsTextBox"]
                  putstr "#{source_opportunity} look-up field is visible in the left column with editable permissions"
                  break
                else
                  puts "#{source_opportunity} look-up field is not visible in the left column with read only permissions"
                end
              else
                puts "#{source_opportunity} look-up field is not visible in the left column with read only permissions"
              end
            end
          end
          putstr "Failed to see the #{source_opportunity} field" unless result
          sleep 3
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{source_opportunity} look-up field is visible in the left column with editable permissions"
  end
end

When(/^I fill the asset required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewAssetInformation'

    $asset_name = "#{arg["AssetName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#Name")
      puts "Successfully see the Asset Name field"
      find("#Name").send_keys $asset_name
    else
      putstr "Failed to find the Asset Name field"
    end


    if page.has_css?("#Account")
      puts "Successfully see the Account field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Account Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["AssetAccountName"])
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
      putstr "Failed to find the Account field"
    end


    if page.has_css?("#Contact")
      puts "Successfully see the Contact field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Contact Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["AssetContactName"])
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
      putstr "Failed to find the Contact field"
    end


    if page.has_css?("#SerialNumber")
      puts "Successfully see the Serial Number field"
      find("#SerialNumber").send_keys arg["AssetSerialNumber"]
    else
      putstr "Failed to find the Serial Number field"
    end

    puts "Successfully fill the asset required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the asset required fields"
  end
end


Then(/^I able to see the asset created successfully$/) do
  begin
    sleep 3
    arg = getDetails 'NewAssetInformation'

    if page.has_content? arg["AssetDetailsPage"]
      puts "Successfully see the #{arg["AssetDetailsPage"]} page"

      if find(".pageDescription").text == $asset_name
        puts "Successfully created the Asset: #{$asset_name}"
      else
        putstr "Failed to created the Asset: #{$asset_name}"
      end

      within all(".pbSubsection")[0] do
        if find("#Name_ileinner").text.include? $asset_name
          puts "Successfully created the Asset: #{$asset_name}"
        else
          putstr "Failed to created the Asset: #{$asset_name}"
        end
      end

    else
      putstr "Failed to create the New Asset"
    end

  rescue Exception => ex
    putstr "Error occurred while creating the Asset: #{$asset_name}"
  end
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field picklist options for asset$/) do |select_field|
  begin
    if (ENV['UserRole'] == "Admin")
      sleep 5
      arg=get_PickList_Options "PicklistOptions"
      resultArray=[]
      actualArrayOption=[]
      expectedArrayOption=[]

      if page.has_select?(select_field)
        actualArrayOption=find_field(select_field).all('option').collect(&:text)
      elsif page.has_xpath?('//td[text()="'"#{select_field}"'"]')
        writeFailure "The dropdown - #{select_field} - is appearing with - R Permission -"
      elsif page.has_xpath?('//*[text()="'"#{select_field}"'"]')==false
        writeFailure "The dropdown - #{select_field} - is not present over the page"
        next
      end
      expectedArrayOption=arg[select_field]
      resultArray=expectedArrayOption.sort-actualArrayOption.sort
      if resultArray.count==0
        puts "The expected options for the field - #{select_field} - is present"
      else
        writeFailure "The following options from - #{select_field} -  dropdown is missing"
        writeFailure resultArray
      end
      resultArray=actualArrayOption.sort-expectedArrayOption.sort
      if resultArray.count!=0
        writeFailure "The following extra options are appearing in  - #{select_field} -  dropdown"
        writeFailure resultArray
      end
      sleep 5
    end
  rescue Exception => ex
    writeFailure "Error while verifying - #{select_field} - picklist option"
    writeFailure ex.message
  end
end



Then(/^I verify the "([^"]*)" text field should be editable only for OpsRep & OpsMgr$/) do |value|
 begin
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit")

    if page.has_field?(value)
      puts "#{value} field is visible with editable permission"
      elsif page.has_content?(value)
      writeFailure "#{value} field is visible with readable permission"
    else
        writeFailure "#{value} field is not visible"
    end

  else
   if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_field?(value)
      puts "#{value} field is visible with editable permission"
      elsif page.has_content?(value)
      writeFailure "#{value} field is visible with readable permission"
      else
        writeFailure "#{value} field is not visible"
      end
    end
  end
    rescue Exception => ex
    writeFailure "Error while verifying - #{value} - text field"
    writeFailure ex.message
end
end
