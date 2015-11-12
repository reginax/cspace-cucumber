# Created by Regina Xu at 10/27/15
# need to add corresponding step definitions in stepDefs.java

@supplementary
Feature: Supplementary Manual QA - Acquisition
  
  Scenario: User Observes New Record Behavior
    Given user is on the "Create New" page
    Then the top and bottom "Cancel" buttons are disabled
    Then the top and bottom "Delete" buttons are disabled
    When user clicks the "Add" button on the "Used By / Cataloging" area to the right
    Then a message is displayed in the bottom of the screen saying "Please save the record you are creating before trying to relate other records to it"
    When user clicks the "Add" button on the "Used By / Procedures" area to the right
    Then a message is displayed in the bottom of the screen saying "Please save the record you are creating before trying to relate other records to it"

  Scenario: User Chooses a Number

    And selects the "Place" radio button on the Create New page
    Then a drop down list should appear in the "Place" row
    Then the list in the "Place" row should contain "Local Places, Thesaurus of Geographic Names (TGN)"
    And clicks on the Create button
    Then the titlebar should contain "Local Places"
    And user enters "New York" in the "Place" "Display Name" field
    And the user saves the record
    Then the record is successfully saved
    Then "New York" should be in the "Place" "Display Name" field
    Then the titlebar should contain "Local Places"
    Then close the browser

  Scenario: User Records Title
    Given user is on the "Create New" page
    And writes "testing" in the "Acquisition Source" field
    And clicks on the "add" button
    Then the "Acquisition Reference Number" and "Acquisition Source" should now be displayed above the tabs
    When user adds another field "sample" to the "Acquisition Source"
    And sets this new field as "primary"
    Then the title should now reflect the new primary "Acquisition Source"
    When user writes something in the "Owner" field 
    And clicks on the "add" button
    Then the title should still display the "Reference Number" and "Source"
    When user deletes all the values from the "Acquisition Source" field
    Then the title should now contain the value of the "Owner" field instead of "Source" field 

Scenario: Behavior after save



Scenario: Docking Title Bar


Scenario: Fold/Unfolding boxes


Scenario: Vocabulary pivoting


Scenario: Keyboard Accessibility