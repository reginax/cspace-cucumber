# Created by Alan Kwok on 11/15/2015
# needs to be completed

@recordsprimarytab
Feature: Exhibition Page Testing

  #Check
  Scenario: Error on no Exhibition Number
  	Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Exhibition Number"
    When user clicks on the "Select number pattern" button
      And user selects "Exhibition" from dropdown in "Type" row
    Then "EXH2015.32" should be in the "Exhibition Number" field
    #I don't know how to test the increment by one, might be wrong.
    When user selects "Exhibition" from dropdown in "Type" row
    Then "EXH2015.33" should be in the "Exhibition Number" field
      And close the browser

  #Check
  Scenario: Exhibition Number and Title displayed on new
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user enters "testexhibition1234" in the "Exhibition Number" field
      And user enters "Grand Opening" in the "Exhibition Title" field
    Then the titlebar should contain "testexhibition1234 - Grand Opening"
      And close the browser

  #Incomplete
  Scenario: All fields saved on new Exhibition Planning record
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And #all fields should be filled in
      And user clicks on the bottom Save button
    Then #A "New Record successfully created" message should appear along with the current time
      And #After the success message appear, All the fields should contain the same value as you entered/selected
      And #After the success message appear, The name authorities should be displayed under Integrated Vocabularies
      And #After the success message appear, The newlines should still be present in text areas
      And close the browser

  #Incomplete
  Scenario: All fields saved on edited Exhibition Planning record
    Given user is on the "Find and Edit" page
      And selects "Exhibition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And #selects one of the Exhibition records
      And #all fields should be filled in
      And user clicks on the bottom Save button
    Then #A "New Record successfully created" message should appear along with the current time
      And #After the success message appear, All the fields should contain the same value as you entered/selected
      And #After the success message appear, The name authorities should be displayed under Integrated Vocabularies
      And #After the success message appear, The newlines should still be present in text areas
      And close the browser

  #To Do
  Scenario: Integrated Vocabulary display and pivoting

  #Incomplete
  Scenario: Removing values from all fields
    Given user is on the "Find and Edit" page
      And selects "Exhibition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And selects Exhibition **** #fix
      And user clears all fields of the "****" record
      And user enters "****" in the "Exhibition Number" field
      And user clicks on the Save button
    Then #a success message from save should appear
      And the titlebar should contain "****"
      And all fields of the "****" record should be empty
    When user clears the "Exhibition Number" field
      And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Exhibition Number"
      And the record should not be saved #NOT be saved
      And close the browser

  #Incomplete
  Scenario: Deletion of Exhibition Record
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user enters "deleteexhibitiontest123" in the "Exhibition Number" field
      And user clicks on the delete button
    Then the "delete" button should not be clickable
    When user clicks on the delete button
    Then the "delete" button should not be clickable
    When user clicks on the Save button
    Then the record is successfully saved
    When user clicks on the delete button
    Then delete confirmation dialogue should appear
    When user clicks cancel button
    Then the delete confirmation dialogue should disappear
      And #nothing else should happen
    When user clicks on the delete button
    Then delete confirmation dialogue should appear
    When user clicks close button
    Then the delete confirmation dialogue should disappear
      And #nothing else should happen
    When user clicks on the delete button
    Then delete confirmation dialogue should appear
    When user clicks the confirmation delete button
    Then deletion should be confirmed in a dialogue
      And #you should be redirected to Find and Edit page
    When selects "Exhibition" from the top nav search record type select field
      And user enters "deleteexhibitiontest123" in the top nav search field
      And clicks on the top nav search submit button
    Then the search results should not contain "deleteexhibitiontest123"
      And close the browser
  
  #Incomplete
  Scenario: Deletion of Exhibition Record with Relationships
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user enters "exhibitiondelete2" in the "Exhibition Number" field
      And user clicks on the Save button
      And user selects the "Loan In" tab
      And user clicks the "Add record" button
      And user clicks the "Create" button
      And user enters "loanin4567" in the "Loan In Number" field
      And user clicks on the Save button
      And user selects the "Current Record" tab
      And user clicks on the delete button
    Then deletion should be confirmed in a dialogue
      And the deletion dialogue should contain "and its relationships" #New step def
    When user clicks cancel button
    Then the delete confirmation dialogue should disappear
      And #nothing else should happen
    When user clicks on the delete button
    Then delete confirmation dialogue should appear
      And the deletion dialogue should contain "and its relationships"
    When user clicks close button
    Then the delete confirmation dialogue should disappear
      And #nothing else should happen
    When user clicks on the delete button
    Then delete confirmation dialogue should appear
      And the deletion dialogue should contain "and its relationships"
    When user clicks the confirmation delete button
    Then deletion should be confirmed in a dialogue
      And #you should be redirected to Find and Edit page
    When selects "Exhibition" from the top nav search record type select field
      And user enters "exhibitiondelete2" in the top nav search field
      And clicks on the top nav search submit button
    Then the search results should not contain "exhibitiondelete2"
      And close the browser

  Scenario: Folding and Unfolding boxes
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user clicks on the "Fold" symbol next to "Exhibition Information"
    Then the "Loans Out Information" section should fold
      And the "Fold" symbol next to "Loans Out Information" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Exhibition Information"
    Then the "Loans Out Information" section should unfold
      And the "Fold" symbol next to "Loans Out Information" should be a unfolded symbol
      And close the browser

  #Warnings

  #Incomplete
  Scenario: Cancel Changes buttons
    Given user is on the "Find and Edit" page
      And selects "Exhibition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And #selects one of the Exhibition records
      And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
    When user enters "testnote" in the "General Notes" field
      And user clicks the "Cancel Changes" button on the top
    Then nothing should be in the "General Notes" field
    When user enters "testnote" in the "Entry Note" field
        And user clicks the "Cancel Changes" button on the bottom
    Then nothing should be in the "General Notes" field
    When user clicks on the Save button
      And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
      And close the browser

  #Incomplete
  Scenario: Warning on attempting to leave edited page on new Exhibition record
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user enters "exhibition5678" in the "Exhibition Number" field
    #Finish

  #Incomplete
  Scenario: Warning on attempting to leave edited page on edited Exhibition record
    Given user is on the "Find and Edit" page
      And selects "Exhibition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And #selects one of the Exhibition records
    #Finish

  Scenario: Warning on attempting to add related object/procedures to unsaved Exhibition Planning record
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user clicks on "Add" on the sidebar next to "Cataloging"
    Then the error message bar should appear with "Please save the record you are creating before trying to relate other records to it"
    When user clicks on "Add" on the sidebar next to "Procedures"
    Then the error message bar should appear with "Please save the record you are creating before trying to relate other records to it"
      And close the browser

#Keyboard Navigation

  #Incomplete
  Scenario: All fields available via the keyboard
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user presses "Tab"
    Then #the first field should be accessable
    When #user repeats pressing "Tab" on all repeatable fields
    Then #all fields should be accessable
    #Finish and add the other buttons that are special cases
      And close the browser

  #Incomplete
  Scenario: Vocabulary Fields usable via keyboard only
    Given user is on the "Create New" page
      And selects the "Exhibition" radio button on the Create New page
      And clicks on the Create button
      And user presses "Tab" #until reaching the "Sponsor" field
      And user enters "James" in the "Sponsor" field #possibly incorrect
    Then #FINISH
      And close the browser

