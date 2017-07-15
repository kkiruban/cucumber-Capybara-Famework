@wk-legal @Quotes
Feature:
  In order test wk legal tasks entities
  As a tester
  And I should verify as per client requirement

  @US-004299 @All-user-quote
  Scenario: US-004299 Update Quote  and Quote  Picklist
    Given I should navigate to salesforce Home page
    Then I should see salesforce home page succesfully
    When I search existing opportunity and click
    Then I should see "Quotes" section on opportunity page layout
    When I click on "New Quote" button under quotes section
    Then I should see following:
      """
      Quote
      New Quote
      """
   When I enter all mandantory field to create a new quote
   And I click on "Save" button from top row
   Then I should see "Quote Line Items" section on quote page layout
   When I click on Add line item button under Quote Line Items section
   And I search random product and select product name
   And I click on select button in product selection page
   And I enter quantity field value to add products to quote from standard price book
   And I click on "Save" button under add quote line items to page
   When I click on "Start Sync" button from top row