@mcafee @contact
Feature:
  In order to validate Contact section
  As a tester
  I should validate the functionalities as per test case

 Background:
    Given I should navigate to Contact tab in saleforce application

  @US-004279 @admin-con @om-con @or-con @sm-con @sr-con @so-con
  Scenario: US-004277 Add field to page Layout    
    Then I should see contact page successfully
    When I follow on "New" button
    Then I should see "Do Not Call" field with read only permission for all users
    And I should see "Fax Opt Out" field with read only permission for all users
    And I should see "Email Opt Out" field with read only permission for all users
    And I should see "Has Opted Out Of Mail" field with read and write permission for all except salesops user
    When I enter all mandantory fields to create random new contact
    And I click on "Save" button on top button row

 @US-004336 @All_Users_Contacts
  Scenario: US-004336 Added permissions to flex fields
   When I follow on "New" button
   Then I should see content "New Contact"
   Then I check that Do Not Call checkbox is read only for all users
   Then I check that Fax Opt Out checkbox is read only for all users
   Then I check that Email Opt Out checkbox is read only for all users
   Then I check that Has Opted Out Of Mail text field is editable for all users excepts SalesOps