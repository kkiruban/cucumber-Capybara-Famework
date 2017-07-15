@leica @opportunityProduct

Feature:
    In order to test Opportunity Product
    As a tester
    And I should test opportunity product as per client requirement

    @US-004285 @om-op @or-op @sm-op @sr-op
    Scenario: US-004285 Opportunity Product Object
    Given I should navigate to opportunity tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on any existing Opportunity Product
    Then I should see "Local Currency Code" field with read and write permission for all except salesops user
    And I should see "Local Currency Amount" field with read only permission for all users
    And I select "Renewal" from "Batch Type"
    And I click on "Save" button from top row