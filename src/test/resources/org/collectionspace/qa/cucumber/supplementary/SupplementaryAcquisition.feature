# Created by rx at 10/27/15
@supplementary
Feature: Supplementary Manual QA - Acquisition
  
  Scenario: User Observes New Record Behavior
    Given user is on the "Create New" page
    Then the top and bottom "Cancel" buttons are disabled
    Then the top and bottom "Delete" buttons are disabled
    When I click the "Add" button on the "Used By / Cataloging" area to the right
    Then a message is displayed in the bottom of the screen saying "Please save the record you are creating before trying to relate other records to it"
    Then click the "Add" button on the "Used By / Procedures" area to the right
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
    And selects the "Place" radio button on the Create New page
