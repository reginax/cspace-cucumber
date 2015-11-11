#created by Alan Kwok at 11/6/2015
#needs to be completed

@intake
Feature: Intake Page Testing

  Scenario: Error on no Intake Entry Number
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Intake Entry Number"
    When user clicks on the "Select number pattern" button
    And user selects "Intake" from dropdown in "Type" row
    Then "IN2015.136" should be in the "Intake Entry Number" field
    #I don't think 136 is constant, but I don't know how to test the increment by one.
    When user selects "Intake" from dropdown in "Type" row
    Then "IN2015.137" should be in the "Intake Entry Number" field
    And close the browser

  Scenario: Depositor and Identification number displayed on new
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user enters "test1234" in the "Intake Entry Number" field
    And user enters "John Doe" in the "Current Owner" field
    And user selects "John Doe" from dropdown in "John Doe" row
    Then the titlebar should contain "test1234 - John Doe"
    And close the browser

  Scenario: All fields saved on new intake record
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And #all fields should be filled in
    And user clicks on the bottom Save button
    Then #A "New Record successfully created" message should appear along with the current time
    And #After the success message appear, All the fields should contain the same value as you entered/selected
    And #After the success message appear, The name authorities should be displayed under Integrated Vocabularies
    And #After the success message appear, The newlines should still be present in text areas
    And close the browser

  Scenario: All fields saved on edited intake record
    Given user is on the "Find and Edit" page
    And selects "Intake" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the intakes
    And #all fields should be filled in
    And user clicks on the bottom Save button
    Then #A "New Record successfully created" message should appear along with the current time
    And #After the success message appear, All the fields should contain the same value as you entered/selected
    And #After the success message appear, The name authorities should be displayed under Integrated Vocabularies
    And #After the success message appear, The newlines should still be present in text areas
    And close the browser

  Scenario: Integrated Vocabulary display and pivoting

  Scenario: Removing values from all fields
    Given user is on the "Find and Edit" page
    And selects "Intake" from the top nav search record type select field
    And clicks on the top nav search submit button
    And selects Intake **** #fix
    And user clears all fields of the "****" record
    And user enters "****" in the "Intake Entry Number" field
    And user clicks on the Save button
    Then #a success message from save should appear
    And the titlebar should contain "****"
    And all fields of the "****" record should be empty
    When user clears the "Intake Entry Number" field
    And user clicks on the Save button
    Then the error message bar should appear with "Please specify an Intake Entry Number"
    And the record should not be saved #NOT be saved
    And close the browser

  Scenario: Deletion of Record
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user enters "delete123" in the "Intake Entry Number" field
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
    When selects "Intake" from the top nav search record type select field
    And user enters "delete123" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should not contain "delete123"
    And close the browser

  Scenario: Deletion of Record with Loan
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user enters "deleteloan1" in the "Intake Entry Number" field
    And user clicks on the Save button
    And user selects the "Loan In" tab
    And user clicks the "Add record" button
    And user clicks the "Create" button
    And user enters "loan123" in the "Loan In Number" field
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
    When selects "Intake" from the top nav search record type select field
    And user enters "deleteloan1" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should not contain "deleteloan1"
    And close the browser

  Scenario: Fold/Unfolding boxes
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user clicks on the "Fold" symbol next to "Object Entry Information"
    Then the "Object Entry Information" section should fold
    And the "Fold" symbol next to "Object Entry Information" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Object Entry Information"
    Then the "Object Entry Information" section should unfold
    And the "Fold" symbol next to "Object Entry Information" should be a unfolded symbol
    When user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should fold
    And the "Fold" symbol next to "Object Collection Information" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should unfold
    And the "Fold" symbol next to "Object Collection Information" should be a unfolded symbol
    When user clicks on the "Fold" symbol next to "Valuation"
    Then the "Valuation" section should fold
    And the "Fold" symbol next to "Valuation" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Valuation"
    Then the "Valuation" section should unfold
    And the "Fold" symbol next to "Valuation" should be a unfolded symbol
    When user clicks on the "Fold" symbol next to "Insurance"
    Then the "Insurance" section should fold
    And the "Fold" symbol next to "Insurance" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Insurance"
    Then the "Insurance" section should unfold
    And the "Fold" symbol next to "Insurance" should be a unfolded symbol
    When user clicks on the "Fold" symbol next to "Location"
    Then the "Location" section should fold
    And the "Fold" symbol next to "Location" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Location"
    Then the "Location" section should unfold
    And the "Fold" symbol next to "Location" should be a unfolded symbol
    When user clicks on the "Fold" symbol next to "Condition"
    Then the "Condition" section should fold
    And the "Fold" symbol next to "Condition" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Condition"
    Then the "Condition" section should unfold
    And the "Fold" symbol next to "Condition" should be a unfolded symbol
    And close the browser

  ###Warnings###

  Scenario: Cancel Changes buttons
    Given user is on the "Find and Edit" page
    And selects "Intake" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the intakes
    And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
    When user enters "testnote" in the "Entry Note" field
    And user clicks the "Cancel Changes" button on the top
    Then nothing should be in the "Entry Note" field
    When user enters "testnote" in the "Entry Note" field
    And user clicks the "Cancel Changes" button on the bottom
    Then nothing should be in the "Entry Note" field
    When user clicks on the Save button
    And user clicks the "Cancel Changes" button on the top
    Then the "Cancel Changes" button on the top should not be clickable
    When user clicks the "Cancel Changes" button on the bottom
    Then the "Cancel Changes" button on the bottom should not be clickable
    And close the browser

  Scenario: Warning on attempting to leave edited page on new intake record
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button

  Scenario: Warning on attempting to leave edited page on edited intake record
    Given user is on the "Find and Edit" page
    And selects "Intake" from the top nav search record type select field
    And clicks on the top nav search submit button
    And #selects one of the intakes

  Scenario: Warning on attempting to add related object/procedures to unsaved Intake
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user clicks on "Add" on the sidebar next to "Cataloging"
    Then the error message bar should appear with "Please save the record you are creating before trying to relate other records to it"
    When user clicks on "Add" on the sidebar next to "Procedures"
    Then the error message bar should appear with "Please save the record you are creating before trying to relate other records to it"

  ###Keyboard Navigation###

  Scenario: All fields available via the keyboard

  Scenario: Vocabulary Fields usable via keyboard only