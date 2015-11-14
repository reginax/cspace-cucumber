# Created by xxx on mo/day/2015

@recordsprimarytab
Feature: Test 1: Acquisition Reference Number
  As a user
  I want to be able to create a new Acquisition record
  That Data should persist

  Scenario: User Creates a minimal Acquisition record
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Acquisition Information"
      And the user clicks on the Save button
    Then the error message bar should appear with "Please specify an Acquisition Reference Number"
    # here's where I'm diverging, for now, from the actual script...
      And user enters "acq-9999" in the "Acquisition Reference Number" field
      And the user clicks on the Save button
    Then the record is successfully saved
    Then close the browser
