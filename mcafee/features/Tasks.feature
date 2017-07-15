@Tasks_feature
Feature: All scenarios related to Tasks feature

  Background: Login to the Application
    Given I login to the "McAfee" application
    Then I able to see the logged in to "McAfee" application


  @Tasks-001 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Create Task
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" tasks pickList fields


  @Tasks-001 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - Email
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Email" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Email" successfully


  @Tasks-001 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - Fax
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Fax" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Fax" successfully


  @Tasks-001 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - Phone Calls
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Phone Calls" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Phone Calls" successfully


  @Tasks-001 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - Standard
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Standard" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Standard" successfully
