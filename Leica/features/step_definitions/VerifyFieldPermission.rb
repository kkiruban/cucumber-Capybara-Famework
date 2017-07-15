#Step to verify the drop down options appearing against requirement
Then(/^I should verify "([^"]*)" entity field permission$/) do |block_Name|
  begin
    sleep 5
    Capybara.default_wait_time =1
    field_With_Permission=[]
    arg=getDataFrom_FieldPermission_YmlFile block_Name

    if (ENV['UserRole'].include? "OperationManager")
      fieldPermissionArraay="Field_Permission_OpsMgr"
    elsif (ENV['UserRole'].include? "OperationRep")
      fieldPermissionArraay="Field_Permission_OpsRep"
    elsif (ENV['UserRole'].include? "Admin")
      fieldPermissionArraay="Field_Permission_Admin"
    elsif (ENV['UserRole'].include? "SalesRep")
      fieldPermissionArraay="Field_Permission_SalesRep"
    elsif (ENV['UserRole'].include? "SalesManager")
      fieldPermissionArraay="Field_Permission_SalesMgr"
    elsif (ENV['UserRole'].include? "SalesOperation")
      fieldPermissionArraay="Field_Permission_SalesOps"
    end

    
    field_With_Permission=arg[fieldPermissionArraay]
    field_With_Permission.each do |field|
      #puts field
      temp=[]      
      temp=field.split("_")
      if temp[1]== "W"
        if page.has_xpath?('//*[text()="'"#{temp[0]}"'"]')
          if page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
            puts "The field  - #{temp[0]} - is present with - RW - permission"
          elsif page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
            writeFailure "The field  - #{temp[0]} - is present with - READ ONLY - permission"
          else
            writeFailure "The field  - #{temp[0]} - is NOT present with - RW - permission"
          end
        else
          writeFailure "The field  - #{temp[0]} - is NOT present over the page"
        end
      end
      if temp[1]=="R"
        if page.has_xpath?('//*[text()="'"#{temp[0]}"'"]')
          if page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
            puts "The field  - #{temp[0]} - is present with - READ ONLY - permission"
          elsif page.has_xpath?('//*[text()="'"#{temp[0]}"'"]/following-sibling::td[1][not(*)]')
            puts "The field  - #{temp[0]} - is present with - READ ONLY - permission"
          elsif page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
            writeFailure "The field  - #{temp[0]} - is not present with - RW - permission"
          else
            writeFailure "The field  - #{temp[0]} - is NOT present over the page"
          end
        end
      end
    end
  rescue Exception => ex
    writeFailure "Error while verifying - #{block_Name} - picklist option"
    writeFailure ex.message
  end
  Capybara.default_wait_time =30
end

#Step to verify the drop down options appearing against requirement
Then(/^I should verify "([^"]*)" entity fields under expected section$/) do |block_Name|
  begin
    sleep 5
    Capybara.default_wait_time =1
    temp=[]
    field_With_Permission=[]
    arg=getDataFrom_FieldSection_YmlFile block_Name    
    field_With_Permission=arg["Field_Section"]
    field_With_Permission.each do |field|
      #puts field
      temp=field.split("_")
      
      if page.has_xpath?('//*[text()="'"#{temp[0]}"'"]') and page.has_xpath?('//*[text()="'"#{temp[1]}"'"]')
        
        if page.has_xpath?('//*[text()="'"#{temp[1]}"'"]/ancestor::div[contains(@class,"DetailBlock")]//td[text()="'"#{temp[0]}"'"]')
          puts "The field - #{temp[0]} - is present under - #{temp[1]} - section"
        else
          writeFailure"The field  - #{temp[0]} - is NOT present under - #{temp[1]} - section"
        end
        #end
      elsif page.has_xpath?('//*[text()="'"#{temp[1]}"'"]')==false
        writeFailure "The section  - #{temp[1]} - is NOT present over the page"
      elsif page.has_xpath?('//*[text()="'"#{temp[0]}"'"]')==false
        writeFailure "The field - #{temp[0]} - is NOT present over the page"
      else
        writeFailure "FAIL - Verify the field - #{temp[0]} - and section - #{temp[1]} -"
      end
     
    end
    #  rescue Exception => ex
    #    writeFailure "Error while verifying - #{block_Name} - picklist option"
    #    writeFailure ex.message
  end
  Capybara.default_wait_time =30
end

#Step to verify the drop down options appearing against requirement
Then(/^I should verify "([^"]*)" entity field type$/) do |block_Name|
  begin
    sleep 5
    Capybara.default_wait_time =1
    field_With_Permission=[]
    arg=getDataFrom_Field_Type_YmlFile block_Name
    field_With_Permission=arg["Field_Type_AllUser"]
    field_With_Permission.each do |field|
      #puts field
      #    puts "--------------"
      #    puts arg[field]
      #    puts "--------------"
      temp=field.split("_")
      #    puts "--------------"
      #    puts "temp[0]   --------     #{temp[0]}"
      #    puts "temp[1]   --------     #{temp[1]}"
      #    puts "--------------"

      field_type=temp[1]
      case field_type
      when "text"

        Capybara.default_wait_time =10
        if page.has_xpath?('(//label[text()="'"#{temp[0]}"'"]/ancestor::td[1]/following-sibling::td[1]//input[@type="text"])[1]')
          puts "The field  - #{temp[0]} - is present as - TEXT - field type"
        elsif page.has_xpath?('//td[text()="'"#{temp[0]}"'"]')
          writeFailure "The field  - #{temp[0]} - is present with - R - permission"
        else
          writeFailure "The field  - #{temp[0]} - is - NOT - present as a - TEXT - field type"

        end
        #step 'I click Save button from top button row'
        Capybara.default_wait_time =30

      when "checkbox"

        Capybara.default_wait_time =10
        if page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/ancestor::td[1]/following-sibling::td[1]/input[@type="checkbox"]')
          puts "The field  - #{temp[0]} - is present as - CHECKBOX - field type"
        elsif page.has_xpath?('//td[text()="'"#{temp[0]}"'"]')
          writeFailure "The field  - #{temp[0]} - is present with - R - permission"
        else
          writeFailure "The field  - #{temp[0]} - is - NOT - present as a - CHECKBOX - field type"
        end
        Capybara.default_wait_time =30

      when "multiSelect"

        Capybara.default_wait_time =1
        if page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/parent::td[1]/following-sibling::td[1]//select[@multiple]')
          puts "The - #{temp[0]} - field is -  multi select picklist Type -"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "The field - #{temp[0]} - is - Not multi select picklist Type  -"
        end
        Capybara.default_wait_time =30

      when "lookup"

        Capybara.default_wait_time =1
        if page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/ancestor::td[1]/following-sibling::td[1]//img[@class="lookupIcon"]')
          puts "The field - #{temp[0]} - is present as lookup field"
        else
          writeFailure "The field - #{temp[0]} - is NOT a lookup field"
        end
        Capybara.default_wait_time =30


      when "picklist"
        
        Capybara.default_wait_time =1
        if page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/parent::td[1]/following-sibling::td[1]//select')
          puts "The - #{temp[0]} - field is -  picklist Type -"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "The field - #{temp[0]} - is - Not picklist Type  -"
        end
        Capybara.default_wait_time =30

      when "date"
        
        Capybara.default_wait_time =1
        if page.has_xpath?('//label[text()="'"#{temp[0]}"'"]/parent::td[1]/following-sibling::td[1]/*[contains(@class,"dateInput")]')
          puts "The - #{temp[0]} - field is -  Date Type -"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "The field - #{temp[0]} - is - Not Date Type  -"
        end 
        Capybara.default_wait_time =30

      else
        puts "The field type - #{temp[0]} - is not defiend"

      end

    end
  rescue Exception => ex
    writeFailure "Error while verifying - #{block_Name} - picklist option"
    writeFailure ex.message
  end
  Capybara.default_wait_time =30
end

#Step to verify the drop down options appearing against requirement
Then(/^I should verify "([^"]*)" entity fields appearing above or below of certain field$/) do |block_Name|
  begin
    sleep 5
    Capybara.default_wait_time =1
    temp=[]
    field_With_Permission=[]
    arg=getDataFrom_Field_Appearing_Above_Or_Below_YmlFile block_Name
    field_With_Permission=arg["Field_Array"]
    field_With_Permission.each do |field|
      # => puts field
      temp=field.split("_")
      Capybara.default_wait_time =1
      if page.has_xpath?('//*[text()="'"#{temp[1]}"'"]/ancestor::tr[1]/following-sibling::tr[1]//*[text()="'"#{temp[0]}"'"]')
        if page.has_xpath?('//tr/td[1]//*[text()="'"#{temp[1]}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{temp[1]}"'"]')==true
          if page.has_xpath?('//tr/td[1]//*[text()="'"#{temp[0]}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{temp[0]}"'"]')==true
            puts "The field -#{temp[0]} - is present under - #{temp[1]}"
          end
        end
        if page.has_xpath?('//tr/td[2]//*[text()="'"#{temp[1]}"'"]')==true or page.has_xpath?('//tr/td[2][text()="'"#{temp[1]}"'"]')==true
          if page.has_xpath?('//tr/td[2]//*[text()="'"#{temp[0]}"'"]')==true or page.has_xpath?('//tr/td[2][text()="'"#{temp[0]}"'"]')==true
            puts "The field -#{temp[0]} - is present under - #{temp[1]}"
          end
        end
      else
        writeFailure "The field -#{temp[0]} - is NOT present under - #{temp[1]}"
        #fail(ArgumentError.new('Fail'))
      end
      Capybara.default_wait_time =30

    end
    #  rescue Exception => ex
    #    writeFailure "Error while verifying - #{block_Name} - picklist option"
    #    writeFailure ex.message
  end
  Capybara.default_wait_time =30
end
