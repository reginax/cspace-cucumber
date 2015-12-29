@administration
#Created by Forest Yang on 12/22/2015
Feature: Term List Management

  #Test1 
  Scenario: Editing a term list name, source, and description
    Given user is on the "Administration" page
      And user selects the "Term List Management" tab
      And user clicks on a term list
    Then the "Cancel changes" button should not be clickable
      And user enters "Changedname" in the "Administration" "Name" field
      And user enters "Changeddescription" in the "Administration" "Description" field
      And user enters "Changedsource" in the "Administration" "Source" field
      And user clicks the "+" button above the "Terms (values)" table
      And user clicks the "Cancel changes" button
    Then the fields should return to original values
      And user enters "Changedname" in the "Administration" "Name" field
      And user enters "Changeddescription" in the "Administration" "Description" field
      And user enters "Changedsource" in the "Administration" "Source" field
      And user clicks the "+" button above the "Terms (values)" table
      And user clicks the "Save" button
    Then "Changedname" should be in the "Administration" "Name" field
    Then "Changeddescription" should be in the "Administration" "Description" field
    Then "Changedsource" should be in the "Administration" "Source" field
  #Test2: Inactivating a term, continued from above
      And user selects "Inactive" from dropdown in a term row under "Status"
      And user clicks the "Save" button
    Then the term's status should be displayed as "Inactive"
      And user navigates to a procedure containing the term list
      And user clicks relevant field
    Then the dropdown should contain the term list
    Then the term list should be greyed out
    Given user is on the "Administration" page
      And user selects the "Term List Management" tab
      And user clicks on the same term list
      And user selects "Active" from dropdown in term row under "Status"
      And user clicks the "Save" button
    Then the term's status should be displayed as "Active"
      And user navigates to a procedure containing the term list
      And user clicks relevant field
    Then the dropdown should contain the term
    Then the term list should be clickable
    Then close the browser

  #Test3
  Scenario: Adding a term
    Given user is on the "Administration" page
      And user selects the "Term List Management" tab
      And user clicks on a term list
      And user clicks the "+" button above the "Terms (values)" table
    Then a new row should appear in the "Terms (values)" table
      And user fills out the row
      And user selects "Active" from dropdown in term row under "Status"
      And user clicks the "Save" button
    Then the "Terms (values)" table should contain the new term
    Then the "Terms (values)" table should be in alphabetical order
    Then close the browser

  #Test 4
  Scenario: Editing an existing term
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Intake"
      And user enters "Existing Term Test" in the "Intake" "Intake Entry Number" field
      And user enters "found dead" in the "Intake" "Field Collection Method" field
      And the user saves the record
    Given user is on the "Administration page"
      And user selects the "Term List Management" tab
      And user clicks on "collectionmethod" term list
      And user changes "Term Name" for "found dead" to "found deadest"
      And user clicks the "Save" button
      And user enters "Existing Term Test" in the top nav search field
      And selects "Intake" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "Existing Term Test"
    Then the titlebar should contain "Intake"
    Then "found deadest" should be in the "Intake" "Field Collection Method" field
    Then close the browser

  #Test 5
  Scenario: Deleting a term
    Given user is on the "Administration" page
      And user selects the "Term List Management" tab
      And user clicks on a term list
      And user clicks the "x" button in the first row of the "Terms (values)" table
    Then the "Terms (values)" table should not contain the term
      And user clicks the "Save" button
    Then the "Terms (values)" table should not contain the term
      And user navigates to a procedure containing the term list
      And user clicks relevant field
    Then the dropdown should not contain the term
    Then close the term

  #Test 6
  Scenario: Attempting to delete an in-use term
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
      And user enters "Fillmeup" in the "Intake" "Intake Entry Number" field
      And the user saves the record
    Given user is on the "Administration" page
      And user selects the "Term List Management" tab
      And user clicks on "Entry Method" 
    Then "intake:intake-entryMethod" should be in the "Used By(field)" field
      And user clicks the "x" button to the right of "In Person"
    Then an error message should appear
      And user clicks the "Ok" button
    Then close the browser


  #Test 7
  Scenario: Changing the default value of used by field and testing null value
    Given user is on the "Administration" page
      And user selects the "Term List Management" tab
      And user clicks on a term list
      And user changes default value of a row in "Used By (field)" list
      And user checks the checkbox under "Include null value"
      And user clicks the "Save" button
    Then the default value should still be selected
    Then the checkbox under "Include null value" should be checked
      And user navigates to a procedure containing the term list
    Then the term list should have the new default
    Then the term list should contain a "Please select a value" entry
    Given user is on the "Administration" page
      And user selects the "Term List Management" tab
      And user clicks on the same term list
      And user changes default value of a row in "Used By (field)" list
      And user unchecks the checkbox under "Include null value"
      And user clicks the "Save" button
      And user navigates to a procedure containing the term list
    Then the term list should have the new default
    Then the term list should not contain a "Please select a value" entry
    Then close the browser

  #Test 8
  Scenario: Keyboard accessibility
    Given user is on the "Administration page"
      And user tabs to "Term List Management" tab
      And user presses enter
      And user tabs to the "Administration" "Name" field
      And user types "Keyboard only name"
      And user tabs to the "+" button above the "Terms (values)" table
      And user presses enter
    Then "Keyboard only name" should be in the "Administration" "Name" field
    Then there should be a blank row
    Then the "Save" button should be reachable
    Then the "Cancel changes" button should be reachable
    Then the "Delete" button should be reachable
    Then close the browser