@elekta @opportunity
Feature:
  In order test wk legal Opportunity entity
  As a tester
  And I should verify as per client requirement

    @US-004305 @US-004355 @US-004323 @US-004328 @07062017-v1-8-4 @US-004402 @om-opp @or-opp @sm-opp
  Scenario: US-004305 US-004355 US-004323 US-004328 Update Opportunity and Opportunity Picklist
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
   And I should see "Sub Stage" field with read and write permission for all except salesops user
   And I should see "Perpetual Agreement" field with read and write permission for all except salesops user
   And I should see "Batch Type" field with read and write permission for Ops Manager and Ops Rep
   And I should see "Billing Frequency" field with read and write permission for Ops Manager and Ops Rep
   And I should see "PO Required" field with read and write permission for all except salesops user
   And I should see "New Contract Number" field with read and write permission for Ops Manager Ops Rep and Sales Manager
   And I should see Sub Stage picklist values in new opportunity page layout
   And I should see Batch Type picklist values in new opportunity page layout
   And I should see Client Region picklist values in new opportunity page layouts
   And I should see Client Territory picklist values in new opportunity page layouts
   And I should see Billing Frequency picklist values in new opportunity page layout
   And I should verify Price Book is marked as mandantory field in new opportunity page layout
   When I select "RNA" from "Client Region"
   Then I should see "Client Sub-Region" field with read and write permission for Ops Manager and Ops Rep
   And I should see Client Sub-Region picklist values in new opportunity page layout
   When I enter all mandantory fields to create new random opportunity
   And I click on "Save" button from top row
   Then I should see "Local Renewal Target" field with read only permission for all users