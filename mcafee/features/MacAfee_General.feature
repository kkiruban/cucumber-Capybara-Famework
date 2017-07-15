@McAfee @general
Feature: General
  In order to validate general test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application  

  @US-004272 @Admin_general
  Scenario: US-004272 Business Hours
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Business Hours" link
    Then I check that "Global" is visible
#    Then I check that "APAC" is visible
#    Then I check that "EMEA" is visible
    And I click "Global" link
    Then I verify the Business Hours details

@US-004274 @Admin_general
  Scenario: US-004274 Calendars
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Fiscal Year" link
    And I should see year as "2016" start date as "12/27/2015" and end date as "12/31/2016"
    And I should see year as "2017" start date as "1/1/2017" and end date as "12/30/2017"
    And I should see year as "2018" start date as "12/31/2017" and end date as "12/29/2018"
    And I should see year as "2019" start date as "12/30/2018" and end date as "12/28/2019"
    And I should see year as "2020" start date as "12/29/2019" and end date as "12/26/2020"
    And I should see year as "2021" start date as "12/27/2020" and end date as "12/31/2020"

  @US-004277 @Admin_general
  Scenario: US-004277 Enable History Tracking for new fields on Account Object
    Given I click on username in the top right corner then select setup
    When I expand "Customize" from app setup
    And I expand Accounts link
    And I expand Fields link
    Then I verify implementation status reason history tracking
    Then I verify health status reason history tracking
    Then I verify business value history tracking

@US-004271 @Admin_general
  Scenario: US-004271 Base Config
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I expand "Manage Currencies" from administration setup
    And I click on "Manage Currency" button under currency
    And I check that "AUD" currency code is available
    And I check that "CAD" currency code is available
    And I check that "CHF" currency code is available
    And I check that "CNY" currency code is available
    And I check that "DKK" currency code is available
    And I check that "EUR" currency code is available
    And I check that "GBP" currency code is available
    And I check that "HKD" currency code is available
    And I check that "IDR" currency code is available
    And I check that "INR" currency code is available
    And I check that "KRW" currency code is available
    And I check that "MYR" currency code is available
    And I check that "NOK" currency code is available
    And I check that "NZD" currency code is available
    And I check that "PHP" currency code is available
    And I check that "PLN" currency code is available
    And I check that "RUB" currency code is available
    And I check that "SEK" currency code is available
    And I check that "SGD" currency code is available
    And I check that "TWD" currency code is available
    And I check that "USD" currency code is available
    And I check that "ZAR" currency code is available

  @US-004271 @Admin_general
  Scenario: US-004271 Base Config
    Given I click on username in the top right corner then select setup
    And I expand "Manage Users" from administration setup
    And I click on users link
    Then I verify users profile
    Then I check that "User Profiles" matches "Users" tab in config guid

  @US-004346 @Admin_general
  Scenario: US-004346 Proactive Rules
   Given I click on all tabs
   When I click on proactive rules
   And I click on "90 DIA Quotes EMEA"
   Then I verify that proactive rule is not active

  @US-004347 @Admin_general
  Scenario: US-004347 mappings
   Given I click on all tabs
   When I click on servicesource setup
   And I click on mappings
   And I clik on link "Renewal Relationship → Opportunity Line Item" under mappings
   And I should see "Internal Name" as "quantiy" and Action as "Required Field" and Opportunity Product Line Field as "quantiy" and Renewal Relationship Field as "quantiy"
#   And I check Opportunity Product Line fields based on Renewal Line Items
   And I select "Quote → Opportunity" under Choose a mapping to edit
   And I check that Opportunity and Opportunity Line Item fields are updated by the Quote and Quote Line Item fields
   And I select "Opportunity → Quote" under Choose a mapping to edit
   And I check that Quote and Quote Line Item fields are populated from the Opportunity and Opportunity Line Items
   And I select "Quote → Quote" under Choose a mapping to edit   
   And I check that which fields are copied from reseller quote to distributor quote
   And I select "No Service Reason Codes" under Choose a mapping to edit





