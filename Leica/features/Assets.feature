@Assets_feature
Feature: All scenarios related to Assets feature

  Background: Login to the Application
    Given I login to the "Leica" application
    Then I able to see the logged in to "Leica" application


  #@US-004288 @OpsMgr_Assets @OpsRep_Assets
  #Scenario: Create New Asset and verify required fields according to requirement

    #When I navigate to "Assets" tab in the application
    #Then I able to see the "Recent Assets" page
    #When I click on the "New" button
    #Then I able to see the "Asset Edit" page
    #And I verify the asset "Service Group" text field should be visible in the left column under "Asset Information" section
    #And I verify the "Service Group" text field should be editable only for OpsRep & OpsMgr
    #And I verify the asset "Service Status" text field should be visible in the left column under "Asset Information" section
    #And I verify the "Service Status" text field should be editable only for OpsRep & OpsMgr
    #When I fill the asset required fields
    #And I click on "Save" button from new "Asset Edit" page
    #Then I able to see the asset created successfully

  @US-004288 @SaleRep_Assets @SalesMgr_Assets @OpsRep_Assets @OpsMgr_Assets
  Scenario: Create New Asset and verify picklist according to requirement only for admin

    When I navigate to "Assets" tab in the application
    Then I able to see the "Recent Assets" page
    When I click on the "New" button
    Then I able to see the "Asset Edit" page
    And I verify the asset "Full Instrument Description" text field should be visible in the left column under "Asset Information" section
    And I verify the "Full Instrument Description" text field should be editable only for OpsRep & OpsMgr
    And I verify the asset "End of Product Life" text field should be visible in the left column under "Asset Information" section
    And I verify the "End of Product Life" text field should be editable only for OpsRep & OpsMgr
    And I verify the asset "Mission Critical" text field should be visible in the left column under "Asset Information" section
    And I verify the "Mission Critical" text field should be editable only for OpsRep & OpsMgr
    And I verify the asset "3rd Party Service Offerings" text field should be visible in the left column under "Asset Information" section
    And I verify the "3rd Party Service Offerings" text field should be editable only for OpsRep & OpsMgr
    And I verify the asset "Entitlement Enforcement In Country" text field should be visible in the left column under "Asset Information" section
    And I verify the "Entitlement Enforcement In Country" text field should be editable only for OpsRep & OpsMgr
    And I verify the asset "Product Group" text field should be visible in the left column under "Asset Information" section
    And I should see "Product Group" field with read only permission
    And I verify the "Service Product Description" text field should be visible in the right column under "Asset Information" section
    And I verify the "Service Product Description" text field should be editable only for OpsRep & OpsMgr
    And I verify the "Equipment Creation Date" text field should be visible in the right column under "Asset Information" section
    And I verify the "Equipment Creation Date" text field should be editable only for OpsRep & OpsMgr
    And I verify the "End of Service Life" text field should be visible in the right column under "Asset Information" section
    And I verify the "End of Service Life" text field should be editable only for OpsRep & OpsMgr
    And I verify the "Customer Vertical" text field should be visible in the right column under "Asset Information" section
    And I verify the "Customer Vertical" text field should be editable only for OpsRep & OpsMgr
    And I verify the "Customer Vertical Segment 2" text field should be visible in the right column under "Asset Information" section
    And I verify the "Customer Vertical Segment 2" text field should be editable only for OpsRep & OpsMgr
    #When I fill the asset required fields
    #And I click on "Save" button from new "Asset Edit" page
    #Then I able to see the asset created successfully














