
When(/^I click on "([^"]*)" from "([^"]*)" page$/) do |tab, context|
  begin
    sleep 3
    if page.has_css?(".allTabsArrow")
      puts "Successfully find the #{context} plus icon"
      find(".allTabsArrow").click
      sleep 3
      if page.has_content? context
        first(:link, tab).click
        sleep 3
        puts "Successfully navigated to the #{tab} page"
      else
        putstr "Failed to navigated to the #{tab} page"
      end
    else
      putstr "Failed to find the #{context} plus icon"
    end
  rescue Exception => ex
    putstr "Error occurred while navigate to the #{tab} tab"
  end
end


And(/^I should see "([^"]*)" pickList field with default value$/) do |lead_source|
  begin
    sleep 3
    arg = getDetails 'NewLeadInformation'

    if page.has_css?("#lea5")
      if page.has_select?("lea5", :selected => arg["LeadSourceODS"])
        puts "Successfully see the #{lead_source} default value: #{arg["LeadSourceODS"]}"
      else
        putstr "Failed to see the #{lead_source} default value: #{arg["LeadSourceODS"]}"
      end
    else
      putstr "Failed to see the #{lead_source} #{arg["LeadSourceOther"]} pickList value"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{lead_source} pickList values"
  end
end


And(/^I fill the all lead required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewLeadInformation'

    $lead_name = "#{arg["LastName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"


    if page.has_css?("#lea13")
      puts "Successfully see the Lead Status field"
      find("#lea13").send_keys arg["LeadStatus"]
    else
      putstr "Failed to find the Lead Status field"
    end

    if page.has_css?("#name_lastlea2")
      puts "Successfully see the Last Name field"
      find("#name_lastlea2").send_keys $lead_name
    else
      putstr "Failed to find the Last Name field"
    end

    if page.has_css?("#lea3")
      puts "Successfully see the company field"
      find("#lea3").send_keys arg["Company"]
    else
      putstr "Failed to find the company field"
    end


    if page.has_content?(arg["AccountNameField"])
      puts "Successfully see the #{arg["AccountNameField"]} field"

      page.driver.browser.window_handles.first
      main = page.driver.browser.window_handles.first
      find("img[alt='Account Name Lookup (New Window)").click
      sleep 2
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["AccountNameValue"])
      sleep 5
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
      end
      sleep 2
      page.driver.browser.switch_to.window(main)
      sleep 2

    else
      putstr "Failed to find the #{arg["AccountNameField"]} field"
    end

    $first_email = "#{arg["FirstEmail"]}#{Time.now.strftime('%m%d_%H%M_%S')}"
    $lead_email =  "#{$first_email}#{arg["LeadEmail"]}"

    if page.has_content?(arg["LeadEmailField"])
      puts "Successfully see the #{arg["LeadEmailField"]} field"
      fill_in arg["LeadEmailField"],:with => $lead_email
      puts "Successfully fill the #{arg["LeadEmailField"]} field"

    else
      putstr "Failed to see the #{arg["LeadEmailField"]} field"
    end

    if page.has_content?(arg["EstimatedAmountField"])
      puts "Successfully see the #{arg["EstimatedAmountField"]} field"
      fill_in arg["EstimatedAmountField"],:with => arg["EstimatedAmountValue"]
      puts "Successfully fill the #{arg["EstimatedAmountField"]} field"

    else
      putstr "Failed to see the #{arg["EstimatedAmountField"]} field"
    end


    if page.has_content?(arg["EstimatedCloseDateField"])
      puts "Successfully see the #{arg["EstimatedCloseDateField"]} field"
      fill_in arg["EstimatedCloseDateField"],:with => arg["EstimatedCloseDateValue"]
      puts "Successfully fill the #{arg["EstimatedCloseDateField"]} field"

    else
      putstr "Failed to see the #{arg["EstimatedCloseDateField"]} field"
    end

    puts "Successfully fill the all lead required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the all lead required fields"
  end
end


And(/^I able to see the lead created successfully$/) do
  begin
    sleep 3
    if page.has_css?(".topName")
      if find(".topName").text == $lead_name
        puts "Successfully created the Lead: #{$lead_name}"
      else
        putstr "Failed to created the Lead: #{$lead_name}"
      end
      within all(".pbSubsection")[0] do
        if find("#lea2_ileinner").text == $lead_name
          puts "Successfully created the Lead: #{$lead_name}"
        else
          raise "Failed to created the Lead: #{$lead_name}"
        end
      end
    else
      raise "Failed to created the Lead: #{$lead_name}"
    end
  rescue Exception => ex
    raise "Error occurred while verifying the created Lead record: #{$lead_name}"
  end
end


And(/^I verify the converted "([^"]*)" and "([^"]*)" is visible in related list$/) do |contacts, opportunities|
  begin
    sleep 5

    within(".listRelatedObject.contactBlock") do

      if page.has_content?(contacts)
        puts "Successfully see the #{contacts} related section"

        within(".list") do
          tr = first("tbody").all(".dataRow")

          if first("tbody").all(".dataRow").count > 0
            sleep 3
            result = false
            tr.each do |row|

              if row.first("th").first("a").text.include? $lead_name
                puts "Successfully see the converted #{contacts} name"
                result = true
                break
                sleep 4
              end
            end
            putstr "Failed to see the converted #{contacts} name" unless result
          else
            putstr "No #{contacts} records are available"
          end
        end
      else
        putstr "Failed to see the #{contacts} related section"
      end
    end
    sleep 5

    within(".listRelatedObject.opportunityBlock") do

      if page.has_content?(opportunities)
        puts "Successfully see the #{opportunities} related section"

        within(".list") do
          tr = first("tbody").all(".dataRow")

          if first("tbody").all(".dataRow").count > 0
            sleep 3
            result = false
            tr.each do |row|

              if row.first("th").first("a").text.include? $create_opp
                puts "Successfully see the converted #{opportunities} name"
                result = true
                break
                sleep 4
              end
            end
            putstr "Failed to see the converted #{opportunities} name" unless result
          else
            putstr "No #{opportunities} records are available"
          end
        end
      else
        putstr "Failed to see the #{opportunities} related section"
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the converted #{contacts} and #{opportunities} is visible"
  end
end


Then(/^I able to see the lead updated successfully$/) do
  begin
    sleep 3
    arg = getDetails 'NewLeadInformation'

    if page.has_content? arg["LeadDetailPage"]
        puts "Successfully updated the Lead record"

      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

           if (row.all("td")[2].text == arg["LeadStatusField"])
              result = true

              if row.all("td")[3].first("div").text == arg["LeadStatusValue"]
                 puts "Successfully updated the #{arg["LeadStatusField"]} field: #{arg["LeadStatusValue"]}"
              else
                putstr "Failed to updated the #{arg["LeadStatusField"]} field: #{arg["LeadStatusValue"]}"
              end

           elsif (row.all("td")[2].text == arg["LeadDisqualificationReasonField"])

              if row.all("td")[3].first("div").text == arg["LeadDisqualificationReasonValue"]
                puts "Successfully updated the #{arg["LeadDisqualificationReasonField"]} field: #{arg["LeadDisqualificationReasonValue"]}"
                break
              else
                putstr "Failed to updated the #{arg["LeadDisqualificationReasonField"]} field: #{arg["LeadDisqualificationReasonValue"]}"
              end
            end
          end
          putstr "Failed to see the #{arg["LeadStatusField"]} and #{arg["LeadDisqualificationReasonField"]} fields" unless result
      end
    else
      raise "Failed to updated the Lead record"
    end
  rescue Exception => ex
    raise "Error occurred while verifying the updated Lead record"
  end
end
