

Then(/^I able to see the "([^"]*)" home page$/) do |name|
  begin
    sleep 2
    if page.has_content? name
      puts "Successfully see the the #{name} page"
    else
      raise "Failed to see the #{name} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} page"
  end
end


Then(/^I following "([^"]*)" details should be visible:$/) do |business_hours, text|
  begin
    sleep 3
    if page.has_content? text
      puts "Successfully see the the #{business_hours} name"
    else
      raise "Failed to see the #{business_hours} name"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{business_hours} name"
  end
end


And(/^I verify users profile$/) do
  begin
    sleep 3
    if page.has_css?(".fewerMore")
      within(".fewerMore") do
        if page.has_content?("more")
          click_on 'more'
          sleep 4
          puts "Successfully navigate to the all pagination page"
        end
      end
    end

    sleep 2
    within(".list") do
      if first("tbody").all(".dataRow").count > 0
        tr = first("tbody").all(".dataRow")
        $full_name = []
        sleep 3
        tr.each do |row|
          $full_name << row.first("th").first("a").text
        end
        sleep 2
        users_actions = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[1]/input')
        users_alias = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[2]/a')
        user_name = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[3]/a')
        user_role = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[5]/a')
        user_profile = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[7]/a')
        $active_users = []
        sleep 3
        users_actions.each_with_index do |user , i|
          $active_users << {
              'users_actions' => users_actions[i],
              'users_alias' => users_alias[i].text,
              'user_name' => user_name[i].text,
              'user_role' => user_role[i],
              'user_profile' => user_profile[i].text,
          }
        end
        $active_users
      else
        putstr "Failed to see the all users"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while reading the users information"
  end
end


And(/^I "([^"]*)" should match "([^"]*)" tab in config guid$/) do |user_profile, users|
  begin
    sleep 5
    counter = 0
    arg = getGeneralDetails 'AdminUsers'
    excel = WIN32OLE.new('Excel.Application')
    excel.visible = true
    dir_path = Dir.pwd.gsub('/','\\')
    file_path = "#{dir_path}#{arg["File_Path"]}"

    workbook = excel.Workbooks.Open(file_path)
    worksheet = workbook.WorkSheets(arg["SheetName"])
    worksheet.select

    i = arg["Start_Row"]
    Capybara.default_max_wait_time = 5


    for counter in i..worksheet.UsedRange.Rows.Count

      lastName=arg["LastName"]+i.to_s
      lastName=worksheet.Range(lastName).Value

      if lastName.nil?
        putstr "Last Name is empty under: #{arg["LastName"]+i.to_s}"
      else
        lastName=lastName.strip
      end

      firstName=arg["FirstName"]+i.to_s
      firstName=worksheet.Range(firstName).Value

      if firstName.nil?
        putstr "First Name is empty under: #{arg["FirstName"]+i.to_s}"
      else
        firstName=firstName.strip
      end

      userName=arg["UserName"]+i.to_s
      userName=worksheet.Range(userName).Value

      if userName.nil?
        putstr "User Name is empty under: #{arg["UserName"]+i.to_s}"
      else
        userName=userName.strip
      end

      persona=arg["Persona"]+i.to_s
      persona=worksheet.Range(persona).Value

      if persona.nil? == false
        persona=persona.strip
      end

      profile=arg["Profile"]+i.to_s
      profile=worksheet.Range(profile).Value

      if profile.nil?
        putstr "Profile is empty under: #{arg["Profile"]+i.to_s}"
      else
        profile=profile.strip
      end


      excel_full_name = "#{lastName}, #{firstName}"


      if $full_name.include? excel_full_name
        puts "Successfully see the Full Name: #{excel_full_name}"
      else
        putstr "Failed to see the Full Name: #{excel_full_name}"
      end

      user_name = "#{userName}#{arg["UserRefer"]}"

      result = false
      $active_users.each do |product|
        if product['user_name'] == user_name
          result = true
          puts "Successfully see the User Name: #{user_name}"
          unless profile.nil?

            if product['user_profile'] == profile
              puts "Successfully see the User Profile: #{profile}"
            else
              putstr "Failed to see the User Profile: #{profile}"
            end
          else
            putstr "User Profile is empty under: #{arg["Profile"]+i.to_s}"
          end

         end
       end
       putstr "Failed to see the User Name: #{user_name}" unless result
       sleep 3

      i=i+1
    end
    excel.Quit();
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying #{user_profile} the #{users} config data"
  end
end


And(/^I verify the "([^"]*)" menu is visible$/) do |opportunities_with_tasks|
  begin
    sleep 4

    if page.has_css?(".searchGrids")
      puts "Successfully see the grid search menu"

      within(".searchGrids") do
        find(".arrow").click
        sleep 3
      end

      if page.has_content? opportunities_with_tasks
        puts "Successfully see the #{opportunities_with_tasks} menu"
      else
        putstr "Failed to see the #{opportunities_with_tasks} menu"
      end

    else
      putstr "Failed to see the grid search menu"
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{opportunities_with_tasks} menu is visible"
  end
end


Then(/^I able to see fiscal calendar should shows:$/) do |text|
  begin
    sleep 3
    if page.has_content? text
      puts "Successfully see the the fiscal calendar"
    else
      raise "Failed to see the fiscal calendar"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the fiscal calendar"
  end
end


And(/^I able to see the "([^"]*)" is "([^"]*)"$/) do |fiscal_year, month|
  begin
    sleep 6
    if page.has_css?("#fy_start_month")
      sleep 4
      puts "Successfully see the #{fiscal_year} field"
      result = false
      all("#fy_start_month").each do |options|

        if options.text.include? month
          result = true
          puts "Successfully see the #{fiscal_year} is #{month}"
          break
        end
      end
      putstr "Failed to find the #{fiscal_year} is #{month}" unless result
    else
      putstr "Failed to see the #{fiscal_year} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{fiscal_year} is #{month}"
  end
end


Then(/^I able to see "([^"]*)" "([^"]*)" is "([^"]*)" and "([^"]*)" details$/) do |name, business_hours, mon_business_hrs, fri_business_hrs|
  begin
    sleep 4
    arg = getDetails 'GeneralInformation'

    if page.has_css?(".businessHours")
      puts "Successfully see the the #{name} #{business_hours} section"

      within(".businessHours") do
        if first("tbody").all("tr").count > 0

          $monday_hours = "#{first("tbody").all("tr")[1].all("td")[1].text} #{first("tbody").all("tr")[1].all("td")[2].text} #{first("tbody").all("tr")[1].all("td")[3].text}"

          $friday_hours = "#{first("tbody").all("tr")[5].all("td")[1].text} #{first("tbody").all("tr")[5].all("td")[2].text} #{first("tbody").all("tr")[5].all("td")[3].text}"


          if first("tbody").all("tr")[0].all("td")[0].text == arg["EMEASunday"] && (first("tbody").all("tr")[0].all("td")[1].text == arg["BusinessHoursSunday"])
            puts "Successfully see the #{arg["EMEASunday"]} #{business_hours}: #{arg["BusinessHoursSunday"]}"
          else
            putstr "Failed to see the #{arg["EMEASunday"]} #{business_hours}: #{arg["BusinessHoursSunday"]}"
          end

          if first("tbody").all("tr")[1].all("td")[0].text == arg["EMEAMonday"] && ($monday_hours.delete(' ').include? mon_business_hrs.to_s.gsub!(/\s+/, ''))
            puts "Successfully see the #{arg["EMEAMonday"]} #{business_hours}: #{$monday_hours}"
          else
            putstr "Failed to see the #{arg["EMEAMonday"]} #{business_hours}: #{$monday_hours}"
          end

          if first("tbody").all("tr")[2].all("td")[0].text == arg["EMEATuesday"] && (first("tbody").all("tr")[2].all("td")[1].text == arg["BusinessHoursTueToThur"])
            puts "Successfully see the #{arg["EMEATuesday"]} #{business_hours}: #{arg["BusinessHoursTueToThur"]}"
          else
            putstr "Failed to see the #{arg["EMEATuesday"]} #{business_hours}: #{arg["BusinessHoursTueToThur"]}"
          end

          if first("tbody").all("tr")[3].all("td")[0].text == arg["EMEAWednesday"] && (first("tbody").all("tr")[3].all("td")[1].text == arg["BusinessHoursTueToThur"])
            puts "Successfully see the #{arg["EMEAWednesday"]} #{business_hours}: #{arg["BusinessHoursTueToThur"]}"
          else
            putstr "Failed to see the #{arg["EMEAWednesday"]} #{business_hours}: #{arg["BusinessHoursTueToThur"]}"
          end

          if first("tbody").all("tr")[4].all("td")[0].text == arg["EMEAThursday"] && (first("tbody").all("tr")[4].all("td")[1].text == arg["BusinessHoursTueToThur"])
            puts "Successfully see the #{arg["EMEAThursday"]} #{business_hours}: #{arg["BusinessHoursTueToThur"]}"
          else
            putstr "Failed to see the #{arg["EMEAThursday"]} #{business_hours}: #{arg["BusinessHoursTueToThur"]}"
          end

          if first("tbody").all("tr")[5].all("td")[0].text == arg["EMEAFriday"] && ($friday_hours.delete(' ') == fri_business_hrs.delete(' '))
            puts "Successfully see the #{arg["EMEAFriday"]} #{business_hours}: #{$friday_hours}"
          else
            putstr "Failed to see the #{arg["EMEAFriday"]} #{business_hours}: #{$friday_hours}"
          end

          if (first("tbody").all("tr")[6].all("td")[0].text == arg["EMEASaturday"]) && (first("tbody").all("tr")[6].all("td")[1].text == arg["BusinessHoursSaturday"])
            puts "Successfully see the #{arg["EMEASaturday"]} #{business_hours}: #{arg["BusinessHoursSaturday"]}"
          else
            putstr "Failed to see the #{arg["EMEASaturday"]} #{business_hours}: #{arg["BusinessHoursSaturday"]}"
          end

        else
          putstr "Failed to see the #{name} #{business_hours}"
        end
      end
    else
      putstr "Failed to see the #{name} #{business_hours} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} #{business_hours} name"
  end
end



And(/^I verify the "([^"]*)" check box is enabled$/) do |rule_name|
  begin
    sleep 3
    if page.has_xpath?("//td[text()='#{rule_name}']/following-sibling::td/img[@title='Checked']")
      puts "Successfully see the #{rule_name} rule check box is enabled"

    else
      putstr "Failed to see the #{rule_name} rule check box is not enabled"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{rule_name} check box is enabled"
  end
end


And(/^I verify the "([^"]*)" rule checkbox should be unchecked$/) do |rule_name|
  begin
    sleep 3
    if page.has_xpath?("//a[text()='#{rule_name}']/parent::th/following-sibling::td[4]//img[@title='Not Checked']")
      puts "Successfully see the #{rule_name} rule is not active"

    else
      putstr "Failed to see the #{rule_name} rule is active"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{rule_name} rule check box is active"
  end
end


When(/^I click on the "([^"]*)" customized link$/) do |cases|
  begin
  sleep 3
    within("#Customize_child") do

      if page.has_content?(cases)
         puts "Successfully see the #{cases} customized link"
         click_on cases
         sleep 4
      else
        putstr "Failed to see the #{cases} customized link"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{cases} customized link"
  end
end


Then(/^I able to see the "([^"]*)" section$/) do |section|
  begin
    sleep 2
    if page.has_content? section
      puts "Successfully see the the #{section} section"
    else
      putstr "Failed to see the #{section} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{section} section"
  end
end


And(/^I verify the "([^"]*)" values$/) do |active_currencies|
  begin
    sleep 3
    arg = getDetails "ActiveCurrenciesPickListValues"

    $pickList_values = []

    $pickList_values =  arg["ActiveCurrenciesValues"].split(",")
    sleep 3

    within all(".listRelatedObject.setupBlock")[0] do

      $pickList_values.each do |value|

        if page.has_content? value
          puts "Successfully see the #{active_currencies} value: #{value}"
        else
          putstr "Failed to see the #{active_currencies} value: #{value}"
        end
      end

    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{active_currencies} value"
  end
end


When(/^I click on the "([^"]*)" link next to "([^"]*)"$/) do |manage, ha_ns|
  begin
    sleep 2
    if page.has_content? ha_ns
      puts "Successfully see the the #{ha_ns} custom setting name"
      within(".listRelatedObject.setupBlock") do
      within(".list") do
        if first("tbody").all(".dataRow").count > 0
          tr = first("tbody").all(".dataRow")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("th")[0].text == ha_ns
              result = true
              sleep 3
              if row.all("td")[0].first("a").text == manage
                puts "Successfully see the #{manage} link next to #{ha_ns}"
                row.all("td")[0].first("a").click
                sleep 4
                break
              else
                putstr "Failed to see the #{manage} link next to #{ha_ns}"
              end
            end
          end
          putstr "Failed to see the #{ha_ns} custom setting name" unless result
        else
          raise "No #{ha_ns} custom settings are available"
        end
      end
    end
    else
      raise "Failed to see the #{ha_ns} custom setting name"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{manage} link next to #{ha_ns}"
  end
end


And(/^I verify the "([^"]*)" and "([^"]*)" checkboxes are checked$/) do |house_account_approval, no_service_approval|
  begin
    sleep 2
    if (page.has_content? house_account_approval) && (page.has_content? no_service_approval)
      puts "Successfully see the the #{house_account_approval} and #{no_service_approval} fields"
      within(".pbSubsection") do
        if first("tbody").all("tr").count > 0
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("th")[1].text == house_account_approval
              result = true
              sleep 3
              if row.all("td")[1].first("span").first("img")[:title] == "Checked"
                puts "Successfully see the #{house_account_approval} check box is checked"
              else
                putstr "Failed to see the #{house_account_approval} check box is checked"
              end

            elsif row.all("th")[1].text == no_service_approval
              result = true
              sleep 3
              if row.all("td")[1].first("span").first("img")[:title] == "Checked"
                puts "Successfully see the #{no_service_approval} check box is checked"
                break
              else
                putstr "Failed to see the #{no_service_approval} check box is checked"
              end
            end
          end
          putstr "Failed to see the #{house_account_approval} and #{no_service_approval} fields" unless result
        else
          raise "Unable to find the HA and NS section"
        end
      end
    else
      putstr "Failed to see the #{house_account_approval} and #{no_service_approval} fields"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{house_account_approval} and #{no_service_approval} checkboxes are checked"
  end
end


And(/^I verify the "([^"]*)" and "([^"]*)" is set to "([^"]*)"$/) do |ha_renewal_amount, ns_renewal_amount, value|
  begin
    sleep 2
    if (page.has_content? ha_renewal_amount) && (page.has_content? ns_renewal_amount)
      puts "Successfully see the the #{ha_renewal_amount} and #{ns_renewal_amount} fields"
      within(".pbSubsection") do
        if first("tbody").all("tr").count > 0
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("th")[0].text == ha_renewal_amount
              result = true
              sleep 3
              if row.all("td")[0].first("span").text.include? value
                puts "Successfully see the #{ha_renewal_amount} value: #{value}"
              else
                putstr "Failed to see the #{ha_renewal_amount} value: #{value}"
              end

            elsif row.all("th")[0].text == ns_renewal_amount
              result = true
              sleep 3
              if row.all("td")[0].first("span").text.include? value
                puts "Successfully see the #{ns_renewal_amount} value: #{value}"
              else
                putstr "Failed to see the #{ns_renewal_amount} value: #{value}"
              end
            end
          end
          putstr "Failed to see the #{ha_renewal_amount} and #{ns_renewal_amount} fields" unless result
        else
          raise "Unable to find the HA and NS section"
        end
      end
    else
      putstr "Failed to see the #{ha_renewal_amount} and #{ns_renewal_amount} fields"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{ha_renewal_amount} and #{ns_renewal_amount} value: #{value}"
  end
end



And(/^I verify the "([^"]*)" rule is unchecked$/) do |stage_closed_sale|
  begin
    sleep 2
    if (page.has_content? stage_closed_sale)
      puts "Successfully see the the #{stage_closed_sale} rule"
      within("#ValidationFormulaList_body") do
        if first("tbody").all(".dataRow").count > 0
          tr = first("tbody").all(".dataRow")
          sleep 3
          result = false
          tr.each do |row|
            if row.first("th").first("a").text == stage_closed_sale
              result = true
              sleep 3
              if row.all("td")[5].first("img")[:title] == "Not Checked"
                puts "#{stage_closed_sale} rule is unchecked"
              else
                putstr "#{stage_closed_sale} rule is checked"
              end
            end
          end
          putstr "Failed to see the #{stage_closed_sale} rule" unless result
        else
          raise "Unable to find the Validation Rules section"
        end
      end
    else
      putstr "Failed to see the #{stage_closed_sale} rule"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{stage_closed_sale} rule is unchecked"
  end
end


And(/^I verify the "([^"]*)" business hour zone is active$/) do |business_hour_zone|
  begin
    sleep 2
    if page.has_content? business_hour_zone
      puts "Successfully see the the #{business_hour_zone} business hour zone"

      within(".listRelatedObject.setupBlock") do
        within(".list") do
          if first("tbody").all(".dataRow").count > 0
            tr = first("tbody").all(".dataRow")
            sleep 3
            result = false
            tr.each do |row|
              if row.first("th").first("a").text == business_hour_zone
                result = true
                sleep 3
                if row.all("td")[1].first("img")[:title] == "Checked"
                  puts "Successfully see the #{business_hour_zone} business hour zone is active"
                  break
                else
                  putstr "Failed to see the #{business_hour_zone} business hour zone is not active"
                end
              end
            end
            putstr "Failed to see the #{business_hour_zone} business hour zone" unless result
          else
            raise "Failed to see the #{business_hour_zone} business hour zone"
          end
        end
      end
    else
      raise "Failed to see the #{business_hour_zone} business hour zone"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{business_hour_zone} business hour zone is active"
  end
end



When(/^I click on "([^"]*)" time zone "([^"]*)"$/) do |business_hour_zone, time_zone|
  begin
    sleep 2
    if page.has_content? business_hour_zone
      puts "Successfully see the the #{business_hour_zone} business hour zone"
      within(".listRelatedObject.setupBlock") do
        within(".list") do
          if first("tbody").all(".dataRow").count > 0
            tr = first("tbody").all(".dataRow")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == time_zone
                result = true
                sleep 3
                if row.first("th").first("a").text == business_hour_zone
                  puts "Successfully see the business hour zone: #{business_hour_zone}"
                  row.first("th").first("a").click
                  sleep 4
                  break
                else
                  putstr "Failed to see the business hour zone: #{business_hour_zone}"
                end
              end
            end
            putstr "Failed to see the #{business_hour_zone} business hour zone" unless result
          else
            raise "Failed to see the #{business_hour_zone} business hour zone"
          end
        end
      end
    else
      raise "Failed to see the #{business_hour_zone} business hour zone"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{business_hour_zone} business hour zone"
  end
end