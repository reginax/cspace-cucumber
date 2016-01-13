@supplementarysecondary
#created by Forest Yang on 1/6/2016
Feature: Condition Check Secondary Tab

  #Test1
  Scenario: Basic Secondary Tab Testing
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging"
      And user enters "Aligeiers" in the "Cataloging" "Identification Number" field
      And the user saves the record
      And user selects the "Condition" tab
    Then "No related record selected" should be displayed
      And user clicks the "+ Add Record" button
      And user clicks the "Create" button
    Then an empty form should be present
    Then "Creating a new record..." should be displayed
    Then the "Cancel changes" button at the bottom of the record should not be clickable
    Then the "Cancel changes" button at the top of the record should not be clickable
    Then the "Delete this relation." button at the bottom of the record should not be clickable
    Then the "Delete this relation." button at the top of the record should not be clickable
      And user enters "blastphemie" in the "Cataloging" "Condition Check/Assessment Reference Number" field
    Then the "Cancel changes" button at the bottom of the record should be clickable
    Then the "Cancel changes" button at the top of the record should be clickable
    Then "blastphemie" should be in the "Cataloging" "Condition Check/Assessment Reference Number" field
      And user fills in required fields for "Condition Check" record
      And user enters "alagrofortei" in the "Cataloging" "Condition Checker/Assessor" vocab field
      And user adds "alagrofortei" to "Local Persons"
      And the user saves the record
    Then the record entry should be displayed under "Related Condition Check Records"
      And user clicks on related record entry "blastphemie"
    Then the "Cancel changes" button at the bottom of the record should not be clickable
    Then the "Cancel changes" button at the top of the record should not be clickable
    Then the "Delete this relation." button at the bottom of the record should be clickable
    Then the "Delete this relation." button at the top of the record should be clickable
      And user selects the "Current Record" tab
      And the user saves the record
    Then the record is successfully saved
      And user enters "Aligeiers" in the top nav search field 
      And selects "Cataloging" from top nav search record type select field
      And the user clicks on result with text "Aligeiers"
    Then the titlebar should contain "Cataloging"
    Then "blastphemie" should appear in the Procedures sidebar
      And user clicks on "blastphemie" from Procedures sidebar
    Then the titlebar should contain "Condition Check" 
    Then "Aligeiers" should appear in the Cataloging sidebar
      And user clicks on "Aligeiers" from Cataloging sidebar
    Then the titlebar should contain "Cataloging"
  #Test3: Search to relate Dialog
      And user selects the "Condition" tab
      And user clicks the "+ Add Record" button
      And user presses the "Esc" key
    Then no changes should occur
      And user clicks the "+ Add Record" button
      And user clicks the search button
    Then a list of records should appear
      And user marks two records
      And user clicks the "Add to Current Record" button
    Then the dialog should be dismissed
    Then the newly added records should be displayed under "Related Condition Check Records"
    Then the newly added records should be in the Procedures sidebar
      And user clicks on a newly added record 
    Then an "Edit Record" form for the newly added record should be displayed
    Then close the browser

    #Test 9
  Scenario: Keyboard Navigation
    Given user is on a blank "Cataloging" record
      And user tabs to "Condition" tab
      And user presses enter
      And user tabs to the "+ Add New" button
      And user presses enter
    Then each field should be reachable by keyboard
      And user tabs to the "Save" button
      And user presses enter
    Then the record is successfully saved
    Then the newly created record should be reachable by keyboard
    Then close the record


