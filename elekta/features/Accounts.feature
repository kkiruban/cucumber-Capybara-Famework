@Accounts_feature
Feature: All scenarios related to Accounts feature

  Background: Login to the Application
    Given I login to the "Elekta" application
    Then I able to see the logged in to "Elekta" application
	
		
  @US-004306 @US-004325 @US-004321 @US-004325 @US-004406 @OpsMgr_accounts @OpsRep_accounts @SalesMgr_accounts @SalesRep_accounts @Admin_accounts @SalesOps_accounts
  Scenario: Update Account and Account PickList, Remove pickList value, Add Account new fields, Remove pickList value,Mandatory for "Type" field,Default value for "Type"
    When I click on the "Accounts" tab
    Then I able to see the "Accounts" page
    When I click on the "New" button
    Then I able to see the "Account Edit" page
    And I verify the "Type" required pickList field
    And I able to see the "Type" default value "Customer - Direct"
    And I verify the section "0" pickList field "Type" index "2" and "3" values is editable for all users except "SalesOperation"
    And I verify the "Client Company ID" required field
    And I verify the "Account Default Currency" field is visible in the "left" column under "Account Information"
    And I verify the section "0" field "Account Default Currency" index "0" and "1" is editable for all users except "SalesOperation"
    And I verify the section "0" pickList field "Account Default Currency" index "0" and "1" values is editable for all users except "SalesOperation"
    And I verify the "SREV Account Type" field is visible in the "right" column under "Account Information"
    And I verify the section "0" field "SREV Account Type" index "2" and "3" is editable for all users except "SalesOperation"
    And I verify the section "0" pickList field "SREV Account Type" index "2" and "3" values is editable for all users except "SalesOperation"
    And I fill the account required fields
    And I click on "Save" button from new "Account Edit" page
    Then I able to see the account created successfully
    And I should not able to see "Success Plans (Account)" "related list"
    And I should not able to see "CSM" "section"
    When I click on the "New Opportunity" button
    Then I able to see the "Select Opportunity Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Opportunity - Edit" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Opportunity Edit" page
    When I select the "Opportunity Currency" pickList value "USD - U.S. Dollar"
    When I fill the opportunity required fields
    And I click on "Save" button from new "Opportunity Edit" page
    Then I able to see the opportunity created successfully
    Then I able to see the "Opportunity Detail" page
    When I click on the "Account Name" link from "Opportunity Detail" page
    Then I able to see the "Account Detail" page
    And I verify the "Opportunities" related list fields

