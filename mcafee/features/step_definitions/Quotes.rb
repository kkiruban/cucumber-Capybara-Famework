
Then(/^I should see Upsell\/Cross\-sell picklist value in quote line item layout$/) do
  if page.has_field?("Upsell/Cross-Sell")
    actualvalues = find_field("Upsell/Cross-Sell", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Upsell","Cross-sell"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Upsell/Cross-Sell  picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Upsell/Cross-Sell  picklist"
    end
  else
    writeFailure "Upsell/Cross-Sell field not visible"
  end
end


When(/^I fill the all quote required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewQuotesInformation'

    $quote_name = "#{arg["NewQuoteName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"


    within all(".pbSubsection")[0] do

      if page.has_css?("#Name")
        puts "Successfully see the Quote Name field"
        find("#Name").send_keys $quote_name
      else
        putstr "Failed to see the Quote Name field"
      end

      sleep 4

     if page.has_content?(arg["QuoteTypeField"])
       puts "Successfully see the #{arg["QuoteTypeField"]} field"

        select(arg["QuoteTypeValue"], :from => arg["QuoteTypeField"], :match => :first)

          puts "Successfully selected the #{arg["QuoteTypeField"]} value: #{arg["QuoteTypeValue"]}"
     else
        putstr "Failed to see the #{arg["QuoteTypeField"]} field"
     end


     if page.has_content?(arg["QuoteTypeYearField"])
        puts "Successfully see the #{arg["QuoteTypeYearField"]} field"

        select(arg["QuoteTypeYearValue"], :from => arg["QuoteTypeYearField"])

        puts "Successfully selected the #{arg["QuoteTypeYearField"]} value: #{arg["QuoteTypeYearValue"]}"
     else
        putstr "Failed to see the #{arg["QuoteTypeYearField"]} field"
     end

    end

    puts "Successfully fill the quote required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the quote required fields"
  end
end


Then(/^I able to see the quote created successfully$/) do
  begin
    sleep 3
    if page.has_css?(".pageDescription")
      if find(".pageDescription").text == $quote_name
        puts "Successfully created the Quote: #{$quote_name}"
      else
        putstr "Failed to created the Quote: #{$quote_name}"
      end
      within all(".pbSubsection")[0] do
        if find("#Name_ileinner").text == $quote_name
          puts "Successfully created the Quote: #{$quote_name}"
        else
          putstr "Failed to created the Quote: #{$quote_name}"
        end
      end
    else
      putstr "Failed to created the Quote: #{$quote_name}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created Quote record: #{$quote_name}"
  end
end


And(/^I select the "([^"]*)" price book$/) do |standard_price_book|
  begin
    sleep 4
    if page.has_css?("#p1")
      puts "Successfully see the price book pickList"
      find("#p1").send_keys standard_price_book
      sleep 4
      puts "Successfully selected the #{standard_price_book} price book"

      within("#bottomButtonRow") do
        first("input").click
      end
      sleep 5
      puts "Successfully save the #{standard_price_book} price book"
    else
      puts "Products created with price book"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{standard_price_book} price book"
  end
end


And(/^I verify the "([^"]*)" section from "([^"]*)" page$/) do |partner_opportunity, quote_edit_page|
  begin
    sleep 3

    if page.has_content?(quote_edit_page)
       puts "Successfully see the #{quote_edit_page} page"

        if page.has_content?(partner_opportunity)
          puts "Successfully see the #{partner_opportunity} section"
        else
          putstr "Failed to see the #{partner_opportunity} section"
        end
    else
      putstr "Failed to see the #{quote_edit_page} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{quote_edit_page} section from #{quote_edit_page} page"
  end
end


And(/^I verify the "([^"]*)" field should be read only for all users$/) do |local_currency|
  begin
    sleep 4

    within all(".pbSubsection")[1] do
      tr = first("tbody").all("tr")
      sleep 3
      result = false
      tr.each do |row|
        if row.all("td")[0].text == local_currency
          puts "Successfully see the #{local_currency} field"
          sleep 3
          begin
            row.all("td")[1].first("div").double_click
            result = true
          rescue
            puts "Successfully see the #{local_currency} field is Read Only"
          end
        end
      end
      putstr "Failed to see the #{local_currency} field" unless result
      sleep 3
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{local_currency} field is Read Only"
  end
end


And(/^I able to see the "([^"]*)" related section$/) do |quote_line_items|
  begin
    sleep 4

    within(".listRelatedObject.quoteLineItemBlock") do

      if page.has_content?(quote_line_items)
        puts "Successfully see the #{quote_line_items} related section"
      else
        putstr "Failed to see the #{quote_line_items} related section"
      end

    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{quote_line_items} related section"
  end
end


When(/^I select the the products$/) do
  begin
    sleep 4
    arg = getDetails "NewQuotesInformation"

    if page.has_css?("#search")
      puts "Successfully see the product search field"
      find("#search").send_keys arg["OpportunityProductName"]
      sleep 3
      within(".searchFilterButtons.productButtons") do
        click_on arg["FindProductSearchButton"]
      end
      sleep 3
    else
      putstr "Failed to see the product search field"
    end
    sleep 4

    within("#undefined_grid") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["SingleProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the the product"
            break
          else
            puts "Product is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
    sleep 5
    click_on arg["ProductSelectButton"]
    puts "Successfully selected the products"
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the product"
  end
end


When(/^I create the quote "([^"]*)" record$/) do |add_quote_line_items|
  begin
    sleep 4
    arg = getDetails "NewQuotesInformation"

    find(:xpath,"//label[text()='#{arg["ProductQuantityField"]}']/ancestor::tr[1]/following-sibling::tr[2]/td[6]/input[@type='text']").set arg["ProductQuantity"]
    sleep 3
    puts "Successfully entered the #{arg["ProductQuantityField"]} value: #{arg["ProductQuantity"]}"

    find(:xpath,"//label[text()='#{arg["ProductSalesPriceField"]}']/ancestor::tr[1]/following-sibling::tr[2]/td[8]/input[@type='text']").set arg["ProductSalesPrice"]
    sleep 4
    puts "Successfully entered the #{arg["ProductSalesPriceField"]} value: #{arg["ProductSalesPrice"]}"

    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6
    puts "Successfully created the #{add_quote_line_items} record"
  rescue Exception => ex
    putstr "Error occurred while creating the #{add_quote_line_items} record"
  end
end


And(/^I verify the "([^"]*)" status from "([^"]*)" page$/) do |start_sync, quote_details|
  begin
    sleep 4
    arg = getDetails 'NewQuotesInformation'

    if page.has_content?(quote_details)
      puts "Successfully see the #{quote_details} page"

      within("#topButtonRow") do

        if page.has_button?(start_sync)
          puts "Successfully see the #{start_sync} button"
        else
          if page.has_button?(arg["QuoteStopSyncButton"])
            puts "Successfully see the #{arg["QuoteStopSyncButton"]} button"
            click_on arg["QuoteStopSyncButton"]
            sleep 5
          else
            putstr "Failed to see the #{arg["QuoteStopSyncButton"]} button"
          end
        end
      end
    else
      putstr "Failed to see the #{quote_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{start_sync} status from #{quote_details} page"
  end
end

And(/^I able to see the "([^"]*)" pop up window$/) do |sync_pop_up_window|
  begin
    sleep 4
    arg = getDetails 'NewQuotesInformation'

    if page.has_css?("#syncQuoteOverlayTitle")
      puts "Successfully see the #{sync_pop_up_window} pop up window"

      if page.has_content?(arg["QuoteSyncAttentionMessage"])
        sleep 5
        within("#syncQuoteOverlay_buttons") do
          if page.has_button?(arg["QuoteSyncAttentionContinueButton"])
            puts "Successfully see the #{arg["QuoteSyncAttentionContinueButton"]} button"

            first("input").click
            #click_on arg["QuoteSyncAttentionContinueButton"]

            puts "Successfully clicked the #{arg["QuoteSyncAttentionContinueButton"]} button"
          else
            putstr "Failed to see the #{arg["QuoteSyncAttentionContinueButton"]} button"
          end

        end
        sleep 5
        if page.has_content?(sync_pop_up_window)
          puts "Successfully see the #{sync_pop_up_window} pop up window"
        else
          putstr "Failed to see the #{sync_pop_up_window} pop up window"
        end

      else

        if page.has_content?(sync_pop_up_window)
          puts "Successfully see the #{sync_pop_up_window} pop up window"
        else
          putstr "Failed to see the #{sync_pop_up_window} pop up window"
        end
      end

    else
      putstr "Failed to see the #{sync_pop_up_window} pop up window"
    end

  rescue Exception => ex
    putstr "Error occurred while verify the #{sync_pop_up_window} pop up window"
  end
end


And(/^I click on the "([^"]*)" button in "([^"]*)" pop up window$/) do |sync, sync_pop_up_window|
  begin
    sleep 4

    if page.has_css?("#syncQuoteOverlay_buttons")
      puts "Successfully see the #{sync_pop_up_window} pop up window"

      within("#syncQuoteOverlay_buttons") do
        if page.has_button?(sync)
          puts "Successfully see the #{sync} button"
          click_on sync
          puts "Successfully clicked the #{sync} button"
        else
          putstr "Failed to see the #{sync} button"
        end
      end

    else
      putstr "Failed to see the #{sync_pop_up_window} pop up window"
    end

  rescue Exception => ex
    putstr "Error occurred while verify the #{sync_pop_up_window} pop up window"
  end
end


And(/^I able to see the "([^"]*)" success message$/) do |sync_complete|
  begin
    sleep 4

    if page.has_css?(".messageTable")
      puts "Successfully see the #{sync_complete} pop up window"

      if page.has_content?(sync_complete)
        puts "Successfully see the #{sync_complete} message"

        if page.has_css?(".messageText")
          puts "Successfully see the #{sync_complete} message"
        else
          putstr "Failed to see the #{sync_complete} message"
        end
      else
        putstr "Failed to see the #{sync_complete} message"
      end

    else
      putstr "Failed to see the #{sync_complete} pop up window"
    end

  rescue Exception => ex
    putstr "Error occurred while verify the #{sync_complete} pop up window"
  end
end
