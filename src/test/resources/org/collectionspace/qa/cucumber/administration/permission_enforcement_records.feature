@administration
#Created by Forest Yang on 12/22/2015
Feature: Permission Enforcement

  #There will probably not be sufficient stepdefs for this one ...

  #Test31
  Scenario: Create New Page
    Given user is logged in as "User I" 
    Given user is on the "Create New" page
    Then Radio button for Record Type A is not present
    Then Radio button for Record Type B is not present
    Then Radio button for Record Type C is present 
      And clicks on the Create button 
    Then new record should be created
      And user fills out required fields for record
      And the user saves the record
    Then the record is successfully saved
    Then the "Delete" button should not be present
    Then close the browser

  #Test33
  Scenario: Search
    Given user is logged in as "User I"
    Given user is on the "Find and Edit" page
    Then dropdown in search row should not contain "Record Type A"
    Then dropdown in search row should contain "Record Type B"
    Then dropdown in search row should contain "Record Type C"
    Then dropdown in search row should contain "Record Type D"
    Then dropdown in top nav search row should not contain "Record Type A"
    Then dropdown in top nav search row should contain "Record Type B"
    Then dropdown in top nav search row should contain "Record Type C"
    Then dropdown in top nav search row should contain "Record Type D"
      And user clicks "Advanced Search"
    Then the titlebar should contain "Advanced Search"
    Then dropdown in "Select record type" row should not contain "Record Type A"
    Then dropdown in "Select record type" row should contain "Record Type B"
    Then dropdown in "Select record type" row should contain "Record Type C"
    Then dropdown in "Select record type" row should contain "Record Type D"
    Then close the browser

  #Test35
  Scenario: Records still in edit mode
    Given user is logged in as "User I"
    Given user is on the "My Collectionspace" page
      And selects "Record Type C" from the top nav search record type select field
      And clicks on the top nav search submit button
    Then user is redirected to the "Find and Edit" page
    Then dropdown in search row should not contain "Record Type A"
    Then dropdown in search row should contain "Record Type B"
    Then dropdown in search row should contain "Record Type C"
    Then dropdown in search row should contain "Record Type D"
      And user clicks on a record that has a record of Type A, B, and D related
   #Test37 continued from Test35: Listing of records in sidebar of Write Record
    Then the sidebar should not contain "Record Type A"
    Then the sidebar should contain "Record Type B"
    Then the sidebar should contain "Record Type D"
   #Test39 continued from Test37: Adding records from Write Record
    Then the add button is present for "Record Type D"
      And user clicks the add button for "Record Type D"
    Then the dropdown in the dialog should contain "Record Type D"
    Then the dropdown in the dialog should not contain "Record Type A"
    Then the dropdown in the dialog should not contain "Record Type B"
      And user adds a record of "Record Type D"
    Then the record is successfully related.
   #Test41 continued from Test39: Secondary Tab of Write Record
    Then the "Record Type A" tab is not present
    Then the "Record Type B" tab is present
    Then the "Record Type D" tab is present
      And user selects the "Record Type B" tab
      And user clicks on a "Record Type B" record
    Then the record should be read only
    Then the add button is not present
      And user selects the "Record Type D" tab
      And user clicks on a "Record Type D" record
    Then the record should be editable
    Then the add button is present
    Then the "Create New" button is present
   #Test43 continued from Test41: Record Read Only Mode
      And user clicks on a "Record Type B" related record that has a record of Type A, C, and D related
    Then the record should be read only
    Then the "Cancel" button is not present
    Then the "Save" button is not present
    Then the "Delete" button is not present
   #Test45 continued from Test43: Right sidebar from Read record
    Then the sidebar should not contain "Record Type A"
    Then the sidebar should contain "Record Type C"
    Then the sidebar should contain "Record Type D"
    Then the sidebar should not contain the add button
   #Test47 continued from test45: Secondary Tab of read record:
    Then the "Record Type A" tab is not present
   #Is this a mistake? the wiki says the record of type B should have a related record of type B...
    Then the "Record Type B" tab is present
    Then the "Record Type D" tab is present
      And user selects the "Record Type B" tab
      And user clicks on a "Record Type B" record
    Then the record should be read only
    Then the add button is not present
      And user selects the "Record Type D" tab
      And user clicks on a "Record type D" record
    Then the record should be editable
    Then the add button is not present
    Then the "Delete" button is not present
    Then close the browser




