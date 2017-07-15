@Assets_feature
Feature: All scenarios related to Assets feature

  Background: Login to the Application
    Given I login to the "Elekta" application
    Then I able to see the logged in to "Elekta" application


  @US-004309 @US-004322 @US-004404 @OpsMgr_Assets @OpsRep_Assets
  Scenario: Add new fields in Assets tab, Add Start Date, Add RLM section,Add "Frequency of Use"
    When I click on "Assets" from "All Tabs" page
    Then I able to see the "Recent Assets" page
    When I click on the "New" button
    Then I able to see the "Asset Edit" page
    And I verify the "Parent / Child" field is visible in the "left" column under "Asset Information"
    And I verify the section "0" field "Parent / Child" index "0" and "1" is editable for all users except "OperationManager OperationRep"
    And I verify the section "0" pickList field "Parent / Child" index "0" and "1" values is editable for all users except "OperationManager OperationRep"
    And I verify the "RLM" section is visible under "Asset Information"
    And I verify the "Health Status" field is visible in the "left" column under "RLM"
    And I verify the section "1" field "Health Status" index "0" and "1" is editable for all users except "SalesOperation"
    And I verify the section "1" pickList field "Health Status" index "0" and "1" values is editable for all users except "SalesOperation"
    And I select the "Health Status" pickList value "Green"
    And I verify the section "1" field "Health Status Reason" index "0" and "1" is editable for all users except "SalesOperation"
    And I verify the "Health Status Reason" pickList values
    And I select the "Health Status" pickList value "Red"
    And I verify the section "1" field "Health Status Reason" index "0" and "1" is editable for all users except "SalesOperation"
    And I able to see the "Health Status Reason" pickList field values
    And I verify the "Upsell Likelihood" field is visible in the "left" column under "RLM"
    And I verify the section "1" field "Upsell Likelihood" index "0" and "1" is editable for all users except "SalesOperation"
    And I verify the section "1" pickList field "Upsell Likelihood" index "0" and "1" values is editable for all users except "SalesOperation"
    And I verify the "Onboarding" field is visible in the "left" column under "RLM"
    And I verify the section "1" field "Onboarding" index "0" and "1" is editable for all users except "SalesOperation"
    And I verify the section "1" pickList field "Onboarding" index "0" and "1" values is editable for all users except "SalesOperation"
    And I verify the "Competitor Name" field is visible in the "right" column under "RLM"
    And I verify the section "1" text box field "Competitor Name" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Business Value" field is visible in the "right" column under "RLM"
    And I verify the section "1" text box field "Business Value" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Upsell Products" field is visible in the "right" column under "RLM"
    And I verify the section "1" field "Upsell Products" index "2" and "3" is editable for all users except "SalesOperation"
    And I verify the section "1" pickList field "Upsell Products" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Frequency of Use" field is visible in the "left" column under "RLM"
    And I verify the section "1" field "Frequency of Use" index "0" and "1" is editable for all users except "SalesOperation"
    And I verify the section "1" pickList field "Frequency of Use" index "0" and "1" values is editable for all users except "SalesOperation"
    When I fill the asset required fields
    And I click on "Save" button from new "Asset Edit" page
    Then I able to see the asset created successfully
