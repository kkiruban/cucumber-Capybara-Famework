@leica @RLI
Feature:
  In order to test RLI
  As a tester
  And I should test RLI as per client requirement

  @US-004286 @all-users-RLI
  Scenario: Renewable Line Item Object
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
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    Then I should see "Previous Local Currency Amount" field with read and write permission for all except salesops user
    And I should see "Previous Local Currency Code" field with read and write permission for all except salesops user
    And I should see "Service Group" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Service Status" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Full Instrument Description" field with read and write permission for Ops Manager and Ops Rep
    And I should see "End of Product Life" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Mission Critical" field with read and write permission for Ops Manager and Ops Rep
    And I should see "3rd Party Service Offerings" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Entitlement Enforcement In Country" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Product Group" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Service Product Description" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Equipment Creation Date" field with read and write permission for Ops Manager and Ops Rep
    And I should see "End of Service Life" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Customer Vertical" field with read and write permission for Ops Manager and Ops Rep
    And I should see "Customer Vertical Segment 2" field with read and write permission for Ops Manager and Ops Rep
    And I should see Batch Type picklist values for renewable line item page layout
    When I enter all mandantory fields to create new renewable line item
    And I click on Save button in create renewable line item page
    When I click on renewal opportunity under renewable line item detail section
    Then I should see content "Opportunity Detail"
    When I click on "Manage Renewals" button under renewable line item section

  @US-004286 @all-users-RLI
  Scenario: US-004286 Renewable Line Item Object
    Given I should navigate to opportunity tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on any existing RLI under Renewable Line Item
    And I click on "Edit" button from top row
    Then I should see SSI sub result reason picklist values when we select HA Already Renewed ARN from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA - Bad Data - BDT from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA - Duplicate - DUP from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA End Of Support EOL from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA Other OTH from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA - Previously Renewed Contract - REN from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA - Sales Pull Back - SPB from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA - Theater Swap - THS from Renewal Status
    And I should see SSI sub result reason picklist values when we select HA - Upgrade - EUG from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Bid - NBD from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Can not Reach Contact - CNC from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Client Product Replacement - PTR from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Competitive DVAR - SCV from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Competitive Service Loss Other - SCS from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Customer Cost-Benefit Decision - SCB from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Customer No Longer Exists - RNE from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Customer Satisfaction Driven - SSD from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - End of Service Life - PEL from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Not in Budget - NIB from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Other Data Management - RDM from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Outside Vendor Supporting - OVS from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Prefers Time & Materials - T&M from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Unsatisfied with Service - UWS from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Unresponsive VAR - RUV from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Unresponsive End User - REU from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Third Party Maintenance - SPM from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Switched to Competitor - STC from Renewal Status
    And I should see SSI sub result reason picklist values when we select NS - Product Decommissioned - PPD from Renewal Status