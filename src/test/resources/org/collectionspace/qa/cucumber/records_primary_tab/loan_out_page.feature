# Created by on Alan Kwok at 11/15/2015
# needs to be completed

@recordsprimarytab
Feature: Loan Out Page Testing

  #Check
  Scenario: Loan Out Number
  	Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And user enters "James" in the "Borrower" field
    And user selects "James Adams" from dropdown in "James Adams" row
    And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Loan Out Number"
    When user clicks on the "Select number pattern" button
    And user selects "Loan Out" from dropdown in "Type" row
    Then "LO2015.1.38" should be in the "Loan Out Number" field
    #I don't know how to test the increment by one, might be wrong.
    When user selects "Loan Out" from dropdown in "Type" row
    Then "LO2015.1.39" should be in the "Loan Out Number" field
    And close the browser

  #Check
  Scenario: Borrower and Loans Out number displayed on new
    Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And user enters "testloanout1234" in the "Loan Out Number" field
    And user enters "John Doe" in the "Borrower" field
    And user selects "John Doe" from dropdown in "John Doe" row
    Then the titlebar should contain "testloanout1234 - John Doe"
    #This part is harder to test
    When user clicks "+" button next to the "Borrower" field
    And user enters "Albert Smith" in the new "Borrower" field
    And user selects "Albert Smith" from dropdown in "Albert Smith" row
    And user selects the radio button next to "Albert Smith"
    And user clicks on the Save button
    Then the titlebar should contain "testloanout1234 - Albert Smith"
    And close the browser

  #Incomplete
  Scenario: All fields saved on new Loans Out record
    Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And #all fields should be filled in
    And user clicks on the bottom Save button
    Then #A "New Record successfully created" message should appear along with the current time
    And #After the success message appear, All the fields should contain the same value as you entered/selected
    And #After the success message appear, The name authorities should be displayed under Integrated Vocabularies
    And #After the success message appear, The newlines should still be present in text areas
    And close the browser

  #Incomplete
  Scenario: All fields saved on edited Loans Out record
    Given user is on the "Find and Edit" page
    And selects "Loan Out" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the loan out records
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
    And selects "Loan Out" from the top nav search record type select field
    And clicks on the top nav search submit button
    And selects Loan Out "xxx" #fix
    And user clears all fields of the "xxx" record
    And user enters "xxx" in the "Loan Out Number" field
    And user clicks on the Save button
    Then #a success message from save should appear
    And the titlebar should contain "xxx"
    And all fields of the "xxx" record should be empty
    When user clears the "Loan Out Number" field
    And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Loan Out Number"
    And the record should not be saved #NOT be saved
    And close the browser

  #Incomplete
  Scenario: Deletion of Loan Out Record
    Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And user enters "deleteloanouttest123" in the "Loan Out Number" field
    And user clicks on the delete button
    Then the delete button should not be clickable
    When user clicks on the delete button
    Then the delete button should not be clickable
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
    When selects "Loan Out" from the top nav search record type select field
    And user enters "deleteloanouttest123" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should not contain "deleteloanouttest123"
    And close the browser
  
  #Incomplete
  Scenario: Deletion of Loan Out Record with Relationships
    Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And user enters "loandelete2" in the "Loan Out Number" field
    And user clicks on the Save button
    And user selects the "Loan Out" tab
    And user clicks the "Add record" button
    And user clicks the "Create" button
    And user enters "loanout456" in the "Loan Out Number" field
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
    When selects "Loan Out" from the top nav search record type select field
    And user enters "loandelete2" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should not contain "loandelete2"
    And close the browser

  Scenario: Folding and Unfolding boxes
    Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And user clicks on the "Fold" symbol next to "Loans Out Information"
    Then the "Loans Out Information" section should fold
    And the "Fold" symbol next to "Loans Out Information" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Loans Out Information"
    Then the "Loans Out Information" section should unfold
    And the "Fold" symbol next to "Loans Out Information" should be a unfolded symbol
    And close the browser

  #Warnings

  #Incomplete
  Scenario: Cancel Changes buttons
    Given user is on the "Find and Edit" page
    And selects "Loan Out" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the loan out records
    And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
    When user enters "testnote" in the "Loan Out Note" field
    And user clicks the "Cancel Changes" button on the top
    Then nothing should be in the "Loan Out Note" field
    When user enters "testnote" in the "Entry Note" field
    And user clicks the "Cancel Changes" button on the bottom
    Then nothing should be in the "Loan Out Note" field
    When user clicks on the Save button
    And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
    And close the browser

  #Incomplete
  Scenario: Warning on attempting to leave edited page on new loan out record
    Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And user enters "loanout5678" in the "Loan Out Number" field
    #Finish

  #Incomplete
  Scenario: Warning on attempting to leave edited page on edited loan out record
    Given user is on the "Find and Edit" page
    And selects "Loan Out" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the loan out records
    #Finish

  Scenario: Warning on attempting to add related object/procedures to unsaved Loans Out
    Given user is on the "Create New" page
    And selects the "Loan Out" radio button on the Create New page
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
    And selects the "Loan Out" radio button on the Create New page
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
    And selects the "Loan Out" radio button on the Create New page
    And clicks on the Create button
    And user presses "Tab" #until reaching the "Borrower" field
    And user enters "James" in the "Borrower" field #possibly incorrect
    Then #FINISH
    And close the browser

