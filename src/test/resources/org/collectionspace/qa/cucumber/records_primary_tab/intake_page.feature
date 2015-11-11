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

  Scenario: Deletion of Record with Loan
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user enters "deleteloan1" in the "Intake Entry Number" field
    And user clicks on the Save button
    And user selects the "Loan In" tab
    And user clicks the "Add record" button

  Scenario: Fold/Unfolding boxes

  #Warnings
  Scenario: Cancel Changes buttons

  Scenario: Warning on attempting to leave edited page

  Scenario: Warning on attempting to add related object/procedures to unsaved Intake

  #Keyboard Navigation
  Scenario: All fields available via the keyboard

  Scenario: Vocabulary Fields usable via keyboard only