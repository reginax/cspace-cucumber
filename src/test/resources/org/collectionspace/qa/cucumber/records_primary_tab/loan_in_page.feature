# Created by Alan Kwok on 11/13/2015
# needs to be completed

@recordsprimarytab
Feature: Loan In Page Testing

  #Check
  Scenario: Loan In Number
  	Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Loan In Number"
    When user clicks on the "Select number pattern" button
    And user selects "Loan In" from dropdown in "Type" row
    Then "LI2015.1.60" should be in the "Loan In Number" field
    #I don't know how to test the increment by one, might be wrong.
    When user selects "Loan In" from dropdown in "Type" row
    Then "LI2015.1.61" should be in the "Loan In Number" field
    And close the browser
  
  #Check
  Scenario: Lender and Loan In number displayed on new
    Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user enters "test1234" in the "Loan In Number" field
    And user enters "John Doe" in the "Lender" field
    And user selects "John Doe" from dropdown in "John Doe" row
    Then the titlebar should contain "test1234 - John Doe"
    #This part is harder to test
    When user clicks "+" button next to the "Lender" field
    And user enters "Albert Smith" in the new "Lender" field
    And user selects "Albert Smith" from dropdown in "Albert Smith" row
    And user selects the radio button next to "Albert Smith"
    And user clicks on the Save button
    Then the titlebar should contain "test1234 - Albert Smith"
    And close the browser
  
  #Incomplete
  Scenario: All fields saved on new Loan In record
  	Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And #all fields should be filled in
    And user clicks on the bottom Save button
    Then #A "New Record successfully created" message should appear along with the current time
    And #After the success message appear, All the fields should contain the same value as you entered/selected
    And #After the success message appear, The name authorities should be displayed under Integrated Vocabularies
    And #After the success message appear, The newlines should still be present in text areas
    And close the browser

  #Incomplete
  Scenario: All fields saved on edited Loan In record
    Given user is on the "Find and Edit" page
    And selects "Loan In" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the loan in records
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
    And selects "Loan In" from the top nav search record type select field
    And clicks on the top nav search submit button
    And selects Loan In "xxx" #fix
    And user clears all fields of the "xxx" record
    And user enters "xxx" in the "Loan In Number" field
    And user clicks on the Save button
    Then #a success message from save should appear
    And the titlebar should contain "xxx"
    And all fields of the "xxx" record should be empty
    When user clears the "Loan In Number" field
    And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Loan In Number"
    And the record should not be saved #NOT be saved
    And close the browser

  #Incomplete
  Scenario: Deletion of Loan In Record
  	Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user enters "deleteloantest123" in the "Loan In Number" field
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
    When selects "Loan In" from the top nav search record type select field
    And user enters "deleteloantest123" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should not contain "deleteloantest123"
    And close the browser

  #Incomplete
  Scenario: Deletion of Loan In Record with Relationships
    Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user enters "loandelete1" in the "Loan In Number" field
    And user clicks on the Save button
    And user selects the "Loan Out" tab
    And user clicks the "Add record" button
    And user clicks the "Create" button
    And user enters "loanout123" in the "Loan Out Number" field
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
    When selects "Loan In" from the top nav search record type select field
    And user enters "loandelete1" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should not contain "loandelete1"
    And close the browser

  Scenario: Folding and Unfolding boxes
    Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user clicks on the "Fold" symbol next to "Loans In Information"
    Then the "Loans In Information" section should fold
    And the "Fold" symbol next to "Loans In Information" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Loans In Information"
    Then the "Loans In Information" section should unfold
    And the "Fold" symbol next to "Loans In Information" should be a unfolded symbol
    And close the browser

#Warnings

  #Incomplete
  Scenario: Cancel Changes buttons
    Given user is on the "Find and Edit" page
    And selects "Loan In" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the loan in records
    And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
    When user enters "testnote" in the "Loan In Note" field
    And user clicks the "Cancel Changes" button on the top
    Then nothing should be in the "Loan In Note" field
    When user enters "testnote" in the "Entry Note" field
    And user clicks the "Cancel Changes" button on the bottom
    Then nothing should be in the "Loan In Note" field
    When user clicks on the Save button
    And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
    And close the browser

  #Incomplete
  Scenario: Warning on attempting to leave edited page on new loan in record
    Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user enters "test5678" in the "Loan In Number" field
    #Finish

  #Incomplete
  Scenario: Warning on attempting to leave edited page on edited loan in record
    Given user is on the "Find and Edit" page
    And selects "Loan In" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the loan in records
    #Finish

  Scenario: Warning on attempting to add related object or procedures to unsaved Loan In
    Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
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
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user presses "Tab"
    Then #the first field should be accessable
    When #user repeats pressing "Tab" on all repeatable fields
    Then #all fields should be accessable
    And close the browser

  #Incomplete
  Scenario: Vocabulary Fields usable via keyboard only
  	Given user is on the "Create New" page
    And selects the "Loan In" radio button on the Create New page
    And clicks on the Create button
    And user presses "Tab" #until reaching the "Depositor" field
    And user enters "James" in the "Depositor" field #possibly incorrect
    Then #FINISH
    And close the browser

