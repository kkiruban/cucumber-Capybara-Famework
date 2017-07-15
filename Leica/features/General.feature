Feature: General
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I navigate to "Home" tab in salesforce application

  @US-004267 @Admin_Generals
  Scenario: Enable Multi-Currency
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Manage Currencies"
    And I clicked the button "Manage Currencies" over the page
    And I should see the "Available Currency Code"

  @US-004267 @Admin_Generals
  Scenario: Business Hours
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I click "Business Hours" link under "Company Profile"
    And I should see the link "NALA" over the page
    And I should see the link "EMEA" over the page
    And I clicked the link "NALA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"

  @US-004282 @Admin_Generals
  Scenario: Users
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I clicked the link "Users"
    Then I should verify users

  @US-004266 @Admin_Generals
  Scenario: Proactive Rules for NALA Quoting team
    When I navigate to "Proactive Rules" tab in the application
    And I clicked the link "90 DIA Quotes - Renewal"
    And I should see content "SUN; MON; TUE; WED; THU"
    Then I should see rule "Stage" is "=" to "Not Contacted"
    And I should see rule "Sum of Quote Request Case" is "=" to "0"
    And I should see rule "Earliest Expiration Date" is "<" to "NEXT_N_DAYS:90"
    And I should see rule "SSI Theatre" is "=" to "NALA"
    And I should see rule "Batch Type" is "=" to "Renewal"
    And I should see rule "Run Time" is "=" to "1:00:00 AM"
    When I navigate to "Proactive Rules" tab in the application
    And I clicked the link "150 DIA Quotes - Renewal"
    And I should see content "SUN; MON; TUE; WED; THU"
    Then I should see rule "Stage" is "=" to "Not Contacted"
    And I should see rule "Sum of Quote Request Case" is "=" to "0"
    And I should see rule "Earliest Expiration Date" is "<" to "NEXT_N_DAYS:150"
    And I should see rule "SSI Theatre" is "=" to "NALA"
    And I should see rule "Batch Type" is "=" to "Warranty"
    And I should see rule "Run Time" is "=" to "1:00:00 AM"
