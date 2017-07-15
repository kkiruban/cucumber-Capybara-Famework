@wk-legal @RLI
Feature:
  In order test wk legal tasks entities
  As a tester
  And I should verify as per client requirement

  @US-004300 @all-user-rli
  Scenario: US-004300 Update RLI and RLI Picklist
    Given I should navigate to salesforce Home page
    Then I should see salesforce home page succesfully
    When I search existing opportunity and click
    Then I should see "Renewable Line Item" section on opportunity page layout
    When I click on "New Renewable Line Item" button under Renewable Line Item section
    Then I should see following:
      """
      Renewable Line Item
      """
    When I enter all mandantory fields to create a new Renewable Line Item
    And I click on "Save" button in renewable line item section
    And I click on "Edit" button from top row
    Then I should see "WK Status" field with read and write permission for all except salesops user
    And I should see "WK Cancellation Date" field with read and write permission for all except salesops user
    And I should see "Previous Contract Number" field with read and write permission for all except salesops user
    And I should see "AM Project" field with read and write permission for all except salesops user
    And I should see "Existing Line Item" field with read and write permission for all except salesops user
    And I should see "Previous Line Item" field with read and write permission for all except salesops user
    And I should see "Future Renewal Exist" field with read and write permission for all except salesops user
    And I should see "Future Renewal Exist Flag" field with read and write permission for all except salesops user
    And I should see "Existing Contract Number" field with read and write permission for all except salesops user
    And I should see "Asset Location" field with read and write permission for all except salesops user
    And I should verify WK Status picklist values in Renewable Line Item page layout
    And I should verify Renewal Status picklist values in Renewable Line Item page layout
    And I should verify SSI Sub Result Reason picklist values in Renewable Line Item page layout
    But I should not see "Renewal Target" field
    And I should not see "Renewal Target Multiplier" field
    When I select "Renewal" from "Batch Type"
    And I click on "Save" button in renewable line item section
    And I click on renewal opportunity in renewable line item page layout
    When I click on "Manage Renewals" button under Renewable Line Item section