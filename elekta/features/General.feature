@General_feature
Feature: All scenarios related to General feature

  Background: Login to the Application
    Given I login to the "Elekta" application
    Then I able to see the logged in to "Elekta" application


  @US-004303 @US-004348 @Admin_general
  Scenario: Base Config, Add/Remove Users
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Manage Users" link
    Then I able to see the "Users" name
    When I click on "Users" link
    Then I able to see the "All Users" page
    And I verify users profile
    And I "User Profiles" should match "Users" tab in config guid


  @US-004303 @Admin_general
  Scenario: Theatres, Currency
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Manage Currencies" name
    When I click on "Manage Currencies" link
    Then I able to see the "Currency" page
    When I click on "Manage Currencies" button from "Currency" page
    Then I able to see the "Active Currencies" section
    And I verify the "Active Currency" values


  @US-004303 @Admin_general
  Scenario: Verify business Hours
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Business Hours" name
    When I click on "Business Hours" link
    Then I able to see the "Organization Business Hours" page
    And I verify the "NALA" business hour zone is active
    And I verify the "EMEA" business hour zone is active
    And I verify the "APAC (KL)" business hour zone is active
    When I click on "NALA" time zone "(GMT-05:00) Central Daylight Time (America/Chicago)"
    Then I able to see the "Organization Business Hours" page
    Then I able to see "NALA" "Business Hours" is "8:00 AM	to	12:00 AM" and "12:00 AM to 5:00 PM" details
    When I click on "Business Hours" link
    Then I able to see the "Organization Business Hours" page
    When I click on "EMEA" time zone "(GMT+00:00) Greenwich Mean Time (GMT)"
    Then I able to see the "Organization Business Hours" page
    Then I able to see "EMEA" "Business Hours" is "8:00 AM	to	12:00 AM" and "12:00 AM to 5:00 PM" details
    When I click on "Business Hours" link
    Then I able to see the "Organization Business Hours" page
    When I click on "APAC (KL)" time zone "(GMT+08:00) Singapore Time (Asia/Singapore)"
    Then I able to see the "Organization Business Hours" page
    Then I able to see "APAC (KL)" "Business Hours" is "8:00 AM	to	12:00 AM" and "12:00 AM to 5:00 PM" details



  @US-004303 @Admin_general
  Scenario: Custom calendar
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Fiscal Year" name
    When I click on "Fiscal Year" link
    Then I able to see the "Organization Fiscal Year Edit" page
    And I able to see the "Fiscal Year Start Month" is "May"


  @US-004303 @Admin_general
  Scenario: NS_HA Custom Settings
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Develop" link
    Then I able to see the "Custom Settings" name
    When I click on "Custom Settings" link
    Then I able to see the "Custom Settings" home page
    When I click on the "Manage" link next to "HA/NS"
    And I verify the "House Account Approval" and "No Service Approval" checkboxes are checked
    And I verify the "House Account Renewal Amount" and "No Service Renewal Amount" is set to "-1.00"


  @US-004303 @Admin_general
  Scenario: Validation Rule
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Customize" link
    Then I able to see the "Opportunities" name
    When I click on the "Opportunities" customized link
    When I click on "Validation Rules" link
    Then I able to see the "Opportunity Validation Rules" page
    And I verify the "Stage_Closed_Sale" rule is unchecked


