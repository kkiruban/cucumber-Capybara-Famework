@mcafee

Feature:All scenarios related to Tasks feature

  @US-004280 @US-004342 @US-004341 @US-004359 @US-004360 @admin-rlt @om-rlt @or-rlt @sm-rlt @sr-rlt
  Scenario: US-004280 US-004342 US-004341 US-004359 US-004360 Add fields to RLI
    Given I should navigate to opportunity tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    Then I should see "Entitlement Row ID" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Original McAfee SFDC Opportunity" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Renewable Line Item ID" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Existing Entitlement Row ID" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Onboarding" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Existing Entitlement Node Count" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Existing Grant Number" field with read and write permission for Ops Manager and Ops Rep
    And I should see Onboarding field picklist values in renewable line item page
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    When I click on renewal opportunity under renewable line item detail section
    Then I should see content "Opportunity Detail"
    When I click on manage renewals button under renewable line item