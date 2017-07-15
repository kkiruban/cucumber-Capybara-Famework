

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


And(/^I verify the "([^"]*)" section is visible under "([^"]*)"$/) do |rlm, asset_information|
  begin
    sleep 2
    if page.has_content?(rlm)
      puts "Successfully see the #{rlm} section"

      if page.has_xpath?("//h3[text()='#{asset_information}']/ancestor::div[1]/following-sibling::div/following-sibling::div//h3[text()='#{rlm}']")
        puts "#{rlm} section is visible under #{asset_information}"
      else
        putstr "#{rlm} section is not visible under #{asset_information}"
      end
    else
      putstr "Failed to see the #{rlm} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{rlm} section is visible under #{asset_information}"
  end
end


And(/^I select the "([^"]*)" pickList value "([^"]*)"$/) do |health_status, value|
  begin
    sleep 3
    within all(".pbSubsection")[1] do

      if page.has_select?(health_status)
        select(value, :from => health_status)
      end
      puts "Successfully selected the #{health_status} pickList value: #{value}"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{health_status} pickList value #{value}"
  end
end


And(/^I verify the "([^"]*)" pickList values$/) do |health_status_reason|
  #begin
    sleep 3
    arg = getDetails "HealthStatusReasonGreenPickListValues"

    field_name = health_status_reason.delete(' ')

    $field_pickList_values = []
    $pickList_values = []

    $pickList_values =  arg[field_name+"GreenValues"].split(",")

    if page.has_content?(health_status_reason)
      puts "Successfully see the #{health_status_reason} field"

      within all(".pbSubsection")[1] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|

          if (row.all("td")[0].text == health_status_reason)
            result = true

            if (row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text).count > 0)

              $field_pickList_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

              puts "#{health_status_reason} pickList field visible with edit permissions"

              $pickList_values.each do |value|

                if $field_pickList_values.include? value
                  puts "Successfully see the #{health_status_reason} pickList value: #{value}"
                else
                  putstr "Failed to see the #{health_status_reason} pickList value: #{value}"
                end
              end
              break
            else
              putstr "#{health_status_reason} field is visible with read only permissions"
              break
            end
          end
        end
        putstr "Failed to see the #{health_status_reason} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{health_status_reason} field"
    end
  #rescue Exception => ex
  #  putstr "Error occurred while verifying the #{field} field is visible with edit permissions"
  #end
end


And(/^I able to see the "([^"]*)" pickList field values$/) do |health_status_reason|
  #begin
  sleep 3
  arg = getDetails "HealthStatusReasonRedPickListValues"

  field_name = health_status_reason.delete(' ')

  $field_pickList_values = []
  $pickList_values = []

  $pickList_values =  arg[field_name+"RedValues"].split(",")

  if page.has_content?(health_status_reason)
    puts "Successfully see the #{health_status_reason} field"

    within all(".pbSubsection")[1] do
      tr = first("tbody").all("tr")
      sleep 3
      result = false
      tr.each do |row|

        if (row.all("td")[0].text == health_status_reason)
          result = true

          if (row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text).count > 0)

            $field_pickList_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

            puts "#{health_status_reason} pickList field visible with edit permissions"

            $pickList_values.each do |value|

              if $field_pickList_values.include? value
                puts "Successfully see the #{health_status_reason} pickList value: #{value}"
              else
                putstr "Failed to see the #{health_status_reason} pickList value: #{value}"
              end
            end
            break
          else
            putstr "#{health_status_reason} field is visible with read only permissions"
            break
          end
        end
      end
      putstr "Failed to see the #{health_status_reason} pickList field" unless result
      sleep 3
    end
  else
    putstr "Failed to see the #{health_status_reason} field"
  end
  #rescue Exception => ex
  #  putstr "Error occurred while verifying the #{field} field is visible with edit permissions"
  #end
end