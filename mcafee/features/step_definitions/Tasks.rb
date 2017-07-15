

When(/^I click on "([^"]*)" button from "([^"]*)" section$/) do |new, my_task|
  begin
    sleep 3
    if page.has_xpath?("//input[@title='New Task']")
      find(:xpath,"//input[@title='New Task']").click
      sleep 2
      puts "Successfully click the #{new} button from #{my_task} section"
    else
      putstr "Failed to see the #{new} button from #{my_task} section"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{new} button from #{my_task} section"
  end
end


And(/^I able to see the "([^"]*)" tasks pickList fields$/) do |field|
  begin
    sleep 2
    arg = getDetails 'NewTaskInformation'

      if page.has_css?("#p3")

        puts "Successfully see the #{field} pickList field"

          $task_types = []

          all(:xpath,"//select[@id='p3']/option").each do |options|

            $task_types << options.text
          end

          if $task_types.include?arg["TaskEmail"]
            puts "Successfully see the #{field} pickList value: #{arg["TaskEmail"]}"
          else
            putstr "Failed to see the #{field} pickList value: #{arg["TaskEmail"]}"
          end

          if $task_types.include?arg["TaskFax"]
            puts "Successfully see the #{field} pickList value: #{arg["TaskFax"]}"
          else
            putstr "Failed to see the #{field} pickList value: #{arg["TaskFax"]}"
          end

          if $task_types.include?arg["TaskPhoneCalls"]
            puts "Successfully see the #{field} pickList value: #{arg["TaskPhoneCalls"]}"
          else
            putstr "Failed to see the #{field} pickList value: #{arg["TaskPhoneCalls"]}"
          end

          if $task_types.include?arg["TaskStandard"]
            puts "Successfully see the #{field} pickList value: #{arg["TaskStandard"]}"
          else
            putstr "Failed to see the #{field} pickList value: #{arg["TaskStandard"]}"
          end

      else
        putstr "Failed to see the #{field} pickList field"
      end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList values"
  end
end


And(/^I fill the task required fields$/) do
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Name Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> arg["TaskContactName"])
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


    page.driver.browser.switch_to.window(main)
    sleep 4
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Related To Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> arg["TaskRelatedTo"])
    sleep 2
    find_button('Go!').click
    sleep 2
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      sleep 3
      all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 4

    within all(".pbSubsection")[1] do

      if page.has_select?(arg["TasksPriorityField"])
        select(arg["TasksPriorityValue"], :from => arg["TasksPriorityField"])
      end

      if page.has_select?(arg["TasksStatusField"])
        select(arg["TasksStatusValue"], :from => arg["TasksStatusField"])
      end

      if page.has_content?(arg["TasksDueDateField"])
        fill_in arg["TasksDueDateField"],:with => arg["TasksDueDateValue"]
      end

    end
    sleep 2

     within all(".pbSubsection")[2] do

        $create_task = "#{arg["TaskSubjectName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

        sleep 3
        if page.has_content?(arg["TasksSubjectField"])
          fill_in arg["TasksSubjectField"], :with => $create_task
        end

        sleep 3
        if page.has_content?(arg["TasksCommentsField"])
          fill_in arg["TasksCommentsField"],:with => arg["TaskComments"]
        end

        if page.has_select?(arg["TaskDirectionField"])
          select(arg["TaskDirectionValue"], :from => arg["TaskDirectionField"])
        end
     end

    sleep 3
    puts "Successfully fill the task required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the task required fields"
  end
end


Then(/^I able to see the created "([^"]*)" successfully$/) do |task_type|
  begin
  sleep 3
  arg = getDetails 'NewTaskInformation'

  if page.has_content?(arg["MyTasksSection"])
    puts "Successfully see the #{arg["MyTasksSection"]} section"
    sleep 3
    if page.has_css?(".pShowMore")
      sleep 3
      puts "Successfully see the Task Pagination"
      within(".pShowMore") do
        first("a").click
      end
      puts "Successfully clicked the Task Pagination"
      sleep 3
    end
    sleep 3
    unless page.has_content?(arg["NoOpenTasksMessage"])
     within(".bMyTask") do
      within(".list") do
       if first("tbody").all(".dataRow").count > 0
         tr = first("tbody").all(".dataRow")
         sleep 3
         result = false
         tr.each do |row|
           if row.all("td")[2].all("a")[0].text == $create_task
             puts "Successfully created the #{task_type} Task: #{$create_task}"
             result = true
           end
         end
         putstr "Failed to create the #{task_type} Task: #{$create_task}" unless result
         sleep 3
       else
         putstr "No Tasks are available"
       end
      end
     end
    else
      putstr "You have no open tasks scheduled for this period"
    end
  else
    putstr "Failed to created the #{task_type} Task"
  end
  rescue Exception => ex
    putstr "Error occurred while creating the #{task_type} Task"
  end
end


When(/^I select the "([^"]*)" pickList value from "([^"]*)" section$/) do |option, section|
  sleep 3
  if page.has_content?(section)
    puts "Successfully see the #{section} section"
   if page.has_css?("#tasklist_mode")
      puts "Successfully see the #{section} pickList"
      sleep 2
      result = false
      find("#tasklist_mode").all('option').each do |record_type|

        if record_type.text.to_s == option.to_s
          puts "Successfully see the #{section} pickList value: #{option}"
          result = true
          sleep 3
          find("#tasklist_mode").send_keys option
          puts "Successfully selected the #{section} pickList value: #{option}"
          sleep 4
        end
      end
      raise "Failed to see the #{section} pickList value: #{option}" unless result
      sleep 3
    else
      putstr "Failed to see the #{section} pickList"
    end
  else
    putstr "Failed to see the #{section} section"
  end
end


