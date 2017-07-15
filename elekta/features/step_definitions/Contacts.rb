

And(/^I fill the all contact required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewContactInformation'

    $contact_name = "#{arg["ContactLastName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#name_lastcon2")
      puts "Successfully see the Last Name field"
      find("#name_lastcon2").send_keys $contact_name
    else
      putstr "Failed to find the Last Name field"
    end

    if page.has_css?("#con4")
      puts "Successfully see the Account Lookup field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Account Name Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["ContactAccountName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        table=all("tbody")[0]
        table.all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Account Lookup field"
    end
    puts "Successfully fill the all contact required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the all contact required fields"
  end
end


And(/^I able to see the contact created successfully$/) do
  begin
    sleep 3
    arg = getDetails 'NewContactInformation'

    unless page.has_content?(arg["NoContactsMessage"])
      result = false
      all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |contact|
        if contact.text.include? $contact_name
          puts "Successfully find the contact record: #{$contact_name}"
          contact.click
          puts "Successfully click the contact: #{$contact_name}"
          result = true
          break
        end
      end
      putstr "Failed to find the contact record: #{$contact_name}" unless result
      sleep 3
    else
      putstr "No contacts found"
    end
  rescue Exception => ex
    putstr "Error occurred while opening the contact: #{$contact_name}"
  end
end

Then(/^I able to see the "([^"]*)" created successfully$/) do |contact|
  begin
   sleep 3
   if page.has_css?(".topName")
     if find(".topName").text == $contact_name
       puts "Successfully created the #{contact}: #{$contact_name}"
     else
       raise "Failed to created the #{contact}: #{$contact_name}"
     end
     within all(".pbSubsection")[0] do
      if find("#con2_ileinner").text == $contact_name
        puts "Successfully created the #{contact}: #{$contact_name}"
      else
        raise "Failed to created the #{contact}: #{$contact_name}"
      end
     end
   else
     raise "Failed to created the #{contact}: #{$contact_name}"
   end
  rescue Exception => ex
    raise "Error occurred while verifying the created #{contact} record: #{$contact_name}"
  end
end
