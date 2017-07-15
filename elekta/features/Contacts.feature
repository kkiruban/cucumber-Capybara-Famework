@Contacts_feature
Feature: All scenarios related to Contacts feature

  Background: Login to the Application
    Given I login to the "Elekta" application
    Then I able to see the logged in to "Elekta" application


  @US-004306 @OpsMgr_contacts @OpsRep_contacts @SalesMgr_contacts @SalesRep_contacts @Admin_contacts @SalesOps_contacts
  Scenario: Configure Contact
    When I click on the "Contacts" tab
    Then I able to see the "Contacts" page
    When I click on the "New" button
    Then I able to see the "Contact Edit" page
    And I verify the section "0" pickList field "Role" index "0" and "1" values is editable for all users except "SalesOperation"
    When I fill the all contact required fields
    And I click on "Save" button from new "Contacts Edit" page
    Then I able to see the "Contact" created successfully
