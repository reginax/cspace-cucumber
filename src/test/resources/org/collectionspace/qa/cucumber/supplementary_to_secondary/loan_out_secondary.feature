#created by Forest Yang on Christmas Day 2015

@supplementarysecondary
Feature: Loan Out Secondary Tab

  #Test 1
  Scenario: Basic Secondary Tab Testing
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
      And user enters "1234321" in the "Cataloging" "Identification Number" field
      And user selects the "Loan Out" tab
    Then "No related record selected" should be displayed
      And user clicks the "+ Add Record" button
      And user clicks the "Create" button
    Then an empty form should be present
    Then "Creating new record..." should be displayed
    Then the "Cancel changes" button at the top of the page should not be clickable
    Then the "Cancel changes" button at the bottom of the page should not be clickable
    Then the "Delete Relation" button at the top of the page should not be clickable
    Then the "Delete Relation" button at the bottom of the page should not be clickable
      And user clicks the "Select number pattern" button
      And user selects something from dropdown in "Loan Out Number" row
    Then the "Cancel changes" button at the top of the page should be clickable
    Then the "Cancel changes" button at the bottom of the page should be clickable
    Then the "Delete Relation" button at the top of the page should be clickable
    Then the "Delete Relation" button at the bottom of the page should be clickable
      And user fills in required fields for "Loan Out" record
      And the user saves the record
    Then the record entry should be displayed under "Related Loan Out Records"
      And user clicks the newly created record 
    Then the "Cancel changes" button at the top of the page should not be clickable
    Then the "Cancel changes" button at the bottom of the page should not be clickable
    Then the "Delete Relation" button at the top of the page should be clickable
    Then the "Delete Relation" button at the bottom of the page should be clickable
      And user selects the "Current Record" tab
      And the user saves the record
    Given user is on the "My Collectionspace" page
      And user enters "1234321" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And the user clicks on result with text "1234321"
    Then the related record should appear in the sidebar
      And the user clicks on the related record
    Then "1234321" should appear in the sidebar
    Then close the browser

  #Test 3
  Scenario: Search to Relate Dialog
    Given user is on the "My Collectionspace" page
      And user enters "1234231" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And the user clicks on result with text "1234231"
      And user selects the "Loan Out" tab
      And user clicks the "+ Add Record" button
      And user presses the "Esc" key
    Then no changes should occur
      And user clicks the "+ Add Record" button
      And user clicks the search button
    Then a list of records should appear
      And user marks two records
      And user clicks the "Add to Current Record" button
    Then the dialog should be dismissed
    Then the newly added records should be displayed under "Related Loan Out Records"
    Then the newly added records should appear in the sidebar
      And user clicks on a newly added record
    Then an "Edit Record" form for the newly added record should be displayed
    Then close the browser

  #Test 9
  Scenario: Keyboard Navigation
    Given user is on a blank "Cataloging" record
      And user tabs to "Loan Out" tab
      And user presses enter
      And user tabs to the "+ Add New" button
      And user presses enter
    Then each field should be reachable by keyboard
      And user tabs to the "Save" button
      And user presses enter
    Then the record is successfully saved
    Then the newly created record should be reachable by keyboard
    Then close the record