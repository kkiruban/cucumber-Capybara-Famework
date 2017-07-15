@wk-legal @tasks
Feature:
  In order test wk legal tasks entity
  As a tester
  And I should verify as per client requirement

  @US-004304 @all-users-tasks
  Scenario: US-004304 Task
    Given I should navigate to salesforce Home page
    Then I should see salesforce home page succesfully
    When I click on new button from my tasks section
    Then I should see following:
      """
      New Task
      Select Task Record Type
      """
    When I select "Task - Standard" from "Record Type of new record"
    And I click on continue button in select task record type page
    Then I should see following:
      """
      Task
      New Task
      """
    And I should see Sub Type picklist value in new task page
    When I enter all mandantory field to create a new task under task standard record type
    And I click on "Save" button from top row
    But I should not see "CSM Details" section in task page layout
    And I should not see "VF page" section in task page layout