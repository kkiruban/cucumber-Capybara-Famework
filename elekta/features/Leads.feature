@Lead_feature
Feature: All scenarios related to Lead feature

  Background: Login to the Application
    Given I login to the "Elekta" application
    Then I able to see the logged in to "Elekta" application


  @US-004169 @OpsMgr_leads @OpsRep_leads @SalesMgr_leads @SalesRep_leads @Admin_leads @SalesOps_leads
  Scenario: Added/Updated Leads object, Update pickList values
    When I click on "Leads" from "All Tabs" page
    Then I able to see the "Recent Leads" page
    When I click on the "New" button
    Then I able to see the "Lead Edit" page
    And I verify the "Account Name" field is visible in the "left" column under "Lead Information"
    And I verify the section "0" text box field "Account Name" index "0" and "1" values is editable for all users except "SalesOperation"
    And I verify the "Ship To Account" field is visible in the "left" column under "Lead Information"
    And I verify the section "0" text box field "Ship To Account" index "0" and "1" values is editable for all users except "SalesOperation"
    And I verify the "Likelihood" field is visible in the "left" column under "Lead Information"
    And I verify the section "0" field "Likelihood" index "0" and "1" is editable for all users except "SalesOperation"
    And I verify the section "0" pickList field "Likelihood" index "0" and "1" values is editable for all users except "SalesOperation"
    And I verify the section "0" pickList field "Lead Status" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Estimated Amount" field is visible in the "left" column under "Lead Information"
    And I verify the section "0" text box field "Estimated Amount" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Estimated Close Date" field is visible in the "left" column under "Lead Information"
    And I verify the section "0" text box field "Estimated Close Date" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Lead Source" field is visible in the "left" column under "Additional Information"
    And I verify the section "2" field "Lead Source" index "2" and "3" is editable for all users except "SalesOperation"
    And I verify the section "2" pickList field "Lead Source" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Lead Type" field is visible in the "left" column under "Additional Information"
    And I verify the section "2" field "Lead Type" index "2" and "3" is editable for all users except "SalesOperation"
    And I verify the section "2" pickList field "Lead Type" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Lead Sub-Type" field is visible in the "left" column under "Additional Information"
    And I verify the section "2" field "Lead Sub-Type" index "2" and "3" is editable for all users except "SalesOperation"
    And I verify the section "2" pickList field "Lead Sub-Type" index "2" and "3" values is editable for all users except "SalesOperation"
    When I fill the all lead required fields
    And I click on "Save" button from new "Lead Edit" page
    Then I able to see the lead created successfully
    When I click on "Edit" button from new "Lead Detail" page
    And I select the "Lead Status" is "Disqualified"
    And I verify the "Lead Disqualification Reason" field is visible in the "right" column under "Lead Information"
    Then I verify the section "0" pickList field "Lead Disqualification Reason" index "2" and "3" values is editable for all users except "SalesOperation"
    And I select the "Lead Disqualification Reason" is "Duplicate Lead"
    And I click on "Save" button from new "Lead Edit" page
    Then I able to see the lead updated successfully
