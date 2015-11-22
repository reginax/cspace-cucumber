# Created by Regina Xu on 10/27/15
# need to add corresponding step definitions in stepDefs.java

@supplementaryprimary
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
    Given user is on the "Create New" page
    And selects the "Place" radio button on the Create New page
    Then a drop down list should appear in the "Place" row
    Then the list in the "Place" row should contain "Local Places, Thesaurus of Geographic Names (TGN)"
    And clicks on the "Create" button
    Then the titlebar should contain "Local Places"
    And enters "New York" in the "Place" "Display Name" field
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
    When user writes "test" in the "Owner" field 
    And clicks on the "add" button
    Then the title should still display the "Reference Number" and "Source"
    When user deletes all the values from the "Acquisition Source" field
    Then the title should now contain the value of the "Owner" field instead of "Source" field 

  Scenario: Behavior after save
    Given user is on the "Create New" page
    # fill out all required fields
    And clicks on the "save" button
    And "disables" top and bottom "cancel" buttons
    And "enables" top and bottom "Delete" buttons
    Then "timestamp" appears to the right of the top "save" button

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
    # fill out all required fields
    And clicks on the "save" button
    And "disables" top and bottom "cancel" buttons
    And "enables" top and bottom "Delete" buttons
    Then "timestamp" appears to the right of the top "save" button

  Scenario: Fold/Unfolding boxes
    Given user is on the "Create New" page
    And click the "fold" symbol
    Then the boxed area should fold and symbol should change to folded
    And click the "unfold" symbol
    Then the boxed area should unfold and symbol should change to unfolded

  Scenario: Vocabulary pivoting
    When user adds "test" to the "authority" field
    And the user saves the record
    Then the record is successfully saved
    Then both top and bottom "cancel" buttons should be "disabled"
    Then both top and bottom "Delete" buttons should be "enabled"
    Then the vocabulary terms associated with the current record should be displayed in the "Terms Used" list on the right
    Then the "Term" column should contain "xxx" # the display name of the vocabulary term
    Then "Type" column should display "xxx" # type of vocabulary it is
    Then the "Field" column should equal "xxx" # the name of the field the vocabulary term is listed in
    When user clicks on one of the vocabulary terms in the listing in the sidebar
    Then user sees the edit page of "xxx" # the vocabulary term you clicked
    Then the page should have the record you came from listed in the "Used By" area
    When user clicks on the link to the record they  came from # "Used By" list in the right sidebar, 
    Then the record should be loaded

  Scenario: Keyboard Accessibility
    When user uses tab through the entire formula
    Then each of the fields should be reachable
    Then the two save buttons and Cancel button should be reachable
    Then the folding functionality should be usable # tab to it and hit space
    Then the focus is visible at all times
    Then the terms used in the right frame should be reachable
