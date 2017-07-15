@elekta @Multicurrency
Feature:
  In order test elekta multicurrency entity
  As a tester
  And I should verify as per client requirement

  @US-004308 @07062017-v1.8-2 @admin-mc @om-mc @or-mc @sm-mc @sr-mc
  Scenario Outline: US-004308 Setup Multi-Currency -RLI
    Given I should navigate to salesforce Home page
    Then I should see salesforce home page succesfully
    When I click on Opportunity tab from all tabs section
    Then I should see Opportunity page succesfully
    And I should see following:
      """
      Opportunities
      Home
      """
    When I click on new button
    When I select "Opportunity - Edit" from "Record Type of new record"
    Then I should see following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I click on continue button to create a new opportunity
    Then I should see following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see create Opportunity page succesfully
    When I enter all mandantory fields to create new random opportunity
    And I check "Renewal" checkbox in opportunity page layout
    And I click on "Save" button from top row
    Then I should see "Renewable Line Item" section
    When I click on "New Renewable Line Item" button in opportunity page layout
    And I enter all required fields to create new random renewable line item
    Then I should see Previous Local Currency Code picklist values in new Renewable Line Item page layout
    And I select "<Currency_Code>" from "Previous Local Currency Code"
    And I fill in "Quantity" with "1"
    And I fill in "Previous Local Currency Amount" with "<Currency_Amount>"
    And I click on "Save" button in new Renewable Line Item page layout
    Then I should see "Renewable Line Item Detail" section
    When I click on Renewal Opportunity under Renewable Line Item Detail section
    Then I should see "Opportunity Detail" section
    And I should see "<Renewal_Target_value>" in "Renewal Target" field
    And I should see "<Local_Renewal_Target_value>" in "Local Renewal Target" field

    Examples:
      | Currency_Code | Renewal_Target_value | Currency_Amount | Local_Renewal_Target_value |
      | EUR           | USD 1.00             | 0.89000         | EUR 0.89                   |
      | GBP           | USD 1.00             | 0.780000        | GBP 0.78                   |
      | CAD           | USD 1.00             | 1.330000        | CAD 1.33                   |
      | CHF           | USD 1.00             | 0.970000        | CHF 0.97                   |
      | BRL           | USD 1.00             | 3.270000        | BRL 3.27                   |
      | CNY           | USD 1.00             | 6.810000        | CNY 6.81                   |
      | CZK           | USD 1.00             | 0.043000        | CZK 0.04                   |
      | DKK           | USD 1.00             | 6.670000        | DKK 6.67                   |
      | JPY           | USD 1.00             | 110.840000      | JPY 110.84                 |
      | MXN           | USD 1.00             | 18.040000       | MXN 18.04                  |
      | NOK           | USD 1.00             | 8.500000        | NOK 8.50                   |
      | PLN           | USD 1.00             | 3.800000        | PLN 3.80                   |
      | SEK           | USD 1.00             | 8.750000        | SEK 8.75                   |
      | SGD           | USD 1.00             | 0.720000        | SGD 0.72                   |
      | TRY           | USD 1.00             | 3.510000        | TRY 3.51                   |
      | ZAR           | USD 1.00             | 12.890000       | ZAR 12.89                  |

  @US-004308 @admin-mc @om-mc @or-mc @sm-mc @sr-mc
  Scenario Outline: US-004308 Setup Multi-Currency -Quote
    Given I should navigate to salesforce Home page
    Then I should see salesforce home page succesfully
    When I click on Opportunity tab from all tabs section
    Then I should see Opportunity page succesfully
    And I should see following:
      """
      Opportunities
      Home
      """
    When I click on new button
    When I select "Opportunity - Edit" from "Record Type of new record"
    Then I should see following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I click on continue button to create a new opportunity
    Then I should see following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see create Opportunity page succesfully
    When I enter all mandantory fields to create new random opportunity
    And I check "Renewal" checkbox in opportunity page layout
    And I click on "Save" button from top row
    Then I should see "Quotes" section
    When I click on "New Quote" button in opportunity page layout
    Then I should see following:
      """
      Opportunities
      Home
      """
    And I should see "Financial and Coverage Details" section
    And I should see "Local Currency Code" field with read and write permission for all except salesops user
    When I fill all mandantory field to create a new random quote
    And I select "<Currency_Code>" from "Local Currency Code"
    And I click on "Save" button from top row
    Then I should see "Quote Line Items (Standard Price Book)" section
    When I click on "Add Line Item" button in opportunity page layout
    And I search existing product and select that product
    And I fill in "Quantity" with "1"
    And I fill in "Local Currency Amount" with "<Currency_Amount>"
    And I click on "Save" button in new Renewable Line Item page layout
    And I should see "<Total_Price>" in "Total Price" field
    And I should see "<Local_Currency>" in "Local Currency" field

    Examples:
      | Currency_Code | Total_Price | Currency_Amount | Local_Currency |
      | EUR           | USD 1.00    | 0.89000         | EUR 0.89       |
      | GBP           | USD 1.00    | 0.780000        | GBP 0.78       |
      | CAD           | USD 1.00    | 1.330000        | CAD 1.33       |
      | CHF           | USD 1.00    | 0.970000        | CHF 0.97       |
      | BRL           | USD 1.00    | 3.270000        | BRL 3.27       |
      | CNY           | USD 1.00    | 6.810000        | CNY 6.81       |
      | CZK           | USD 1.00    | 0.043000        | CZK 0.04       |
      | DKK           | USD 1.00    | 6.670000        | DKK 6.67       |
      | JPY           | USD 1.00    | 110.840000      | JPY 110.84     |
      | MXN           | USD 1.00    | 18.040000       | MXN 18.04      |
      | NOK           | USD 1.00    | 8.500000        | NOK 8.50       |
      | PLN           | USD 1.00    | 3.800000        | PLN 3.80       |
      | SEK           | USD 1.00    | 8.750000        | SEK 8.75       |
      | SGD           | USD 1.00    | 0.720000        | SGD 0.72       |
      | TRY           | USD 1.00    | 3.510000        | TRY 3.51       |
      | ZAR           | USD 1.00    | 12.890000       | ZAR 12.89      |
