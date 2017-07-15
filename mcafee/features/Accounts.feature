@mcafee @Account
Feature:
  In order to validate account section
  As a tester
  I should validate the functionalities as per test case

  @US-004277 @US-004337 @US-004338 @US-004362 @admin-acc @om-acc @or-acc @sm-acc @sr-acc @so-acc
  Scenario: US-004277 US-004337 US-004338 US-004362 Add Shipping Address
    Given I should navigate to Accounts tab in saleforce application
    Then I should see accounts page successfully
    When I follow on "New" button
    Then I should see "Shipping Address" field with read and write permission for all except salesops user
    And I should see "Implementation Status" field with read and write permission for all except salesops user
    And I should see "Implementation Status Reason" field with read and write permission for all except salesops user
    And I should see "Health Status" field with read and write permission for all except salesops user
    And I should see "Health Status Reason" field with read and write permission for all except salesops user
    And I should see "Competitor" field with read and write permission for all except salesops user
    And I should see "Upsell/Cross-sell Potential" field with read and write permission for all except salesops user
    And I should see "Upsell/Cross-sell Product" field with read and write permission for all except salesops user
    And I should see "RLM Tier" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Business Value" field with read and write permission for all except salesops user
    And I should see Implementation Status field picklist values in new account page
    And I should see Implementation Status Reason field picklist values in new account page
    And I should see Health Status field picklist values in new account page
    And I should see Health Status Reason field picklist values in new account page
    And I should see RLM Tier field picklist values in new account page
    And I should see Competitor field picklist values in new account page
    And I should see Upsell/Cross-sell Potential field picklist values in new account page
    And I should see Upsell/Cross-sell Product field picklist values in new account page
    And I should see Business Value field picklist values in new account page
    When I enter all mandantory fields to create a random new account 
    And I click on "Save" button on top button row