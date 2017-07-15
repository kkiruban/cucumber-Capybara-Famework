@Tasks_feature
Feature: All scenarios related to Tasks feature

  Background: Login to the Application
    Given I login to the "sitleica" application
    Then I able to see the logged in to "sitleica" application

  @US-004287 @AllUsr_tasks
  Scenario: Create Task Task Types by Persona
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" tasks pickList fields

  @US-004287 @AllUsr_tasks
  Scenario: Create Task - Emails
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Email" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I should not see the "CSM" section over the page
    And I should not see the "VF" section over the page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Email" successfully

  @US-004287 @AllUsr_tasks
  Scenario: Create Task - Fax
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Fax" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I should not see the "CSM" section over the page
    And I should not see the "VF" section over the page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Email" successfully

  @US-004287 @AllUsr_tasks
  Scenario: Create Task - Phone Calls
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Phone Calls" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I should not see the "CSM" section over the page
    And I should not see the "VF" section over the page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Phone Calls" successfully


  @US-004287 @AllUsr_tasks
  Scenario: Create Task - Standards
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Standard" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I should not see the "CSM" section over the page
    And I should not see the "VF" section over the page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Standard" successfully