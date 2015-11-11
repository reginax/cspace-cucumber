#created by Alan Kwok at 11/6/2015
#needs to be completed

@intake
Feature: Intake Page Testing

  Scenario: Error on no Intake Entry Number
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And clicks on the Save button
    Then the error message bar should appear with "Please specify an Intake Entry Number"
    When user clicks on the "Select number pattern" button
    And user selects "Intake" from dropdown in "Type" row
    Then "IN2015.136" should be in the "Intake Entry Number" field
    #I don't think 136 is constant, but I don't know how to test the increment by one.
    When user selects "Intake" from dropdown in "Type" row
    Then "IN2015.137" should be in the "Intake Entry Number" field
    Then close the browser

  Scenario: Depositor and Identification number displayed on new
    Given user is on the "Create New" page
    And selects the "Intake" radio button on the Create New page
    And clicks on the Create button
    And user enters "test1234" in the "Intake Entry Number" field
    And user enters "John Doe" in the "Current Owner" field
    And user selects "John Doe" from dropdown in "John Doe" row
    Then the titlebar should contain "test1234 - John Doe"
    Then close the browser

  Scenario: All fields saved on new and edited intake record 
    Given 

  Scenario: Integrated Vocabulary display and pivoting

  Scenario: Removing values from all fields

  Scenario: Deletion of Record

  Scenario: Fold/Unfolding boxes

  #Warnings
  Scenario: Cancel Changes buttons

  Scenario: Warning on attempting to leave edited page

  Scenario: Warning on attempting to add related object/procedures to unsaved Intake

  #Keyboard Navigation
  Scenario: All fields available via the keyboard

  Scenario: Vocabulary Fields usable via keyboard only