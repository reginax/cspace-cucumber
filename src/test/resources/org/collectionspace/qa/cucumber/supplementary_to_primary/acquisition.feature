# Created by Regina Xu on 10/27/15
# Updated to match step defs; to do: testing

@supplementaryprimary
Feature: Supplementary Manual QA - Acquisition
  
  Scenario: User Observes New Record Behavior
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "2009.1" from dropdown in "Acquisition Reference Number" row
      And the user saves the record
    Then the "cancel" button should not be clickable
    Then the "delete" button should not be clickable
    When user clicks the "add" button on the "Cataloging" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it" should be displayed
    When user clicks the "add" button on the "Procedures" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it" should be displayed
    Then close the browser

  Scenario: User Chooses a Number
    Given user is on the "Create New" page
      And selects the "Place" radio button on the Create New page
    Then a drop down list should appear in the "Place" row
    Then the list in the "Place" row should contain "Local Places, Thesaurus of Geographic Names (TGN)"
      And clicks on the Create button
    Then the titlebar should contain "Local Places"
      And enters "New York" in the "Place" "Display Name" field
      And the user saves the record
    Then the record is successfully saved
    Then "New York" should be in the "Place" "Display Name" field
    Then the titlebar should contain "Local Places"
    Then close the browser

  Scenario: User Records Title
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "2009.1" from dropdown in "Acquisition Reference Number" row
      And user enters "testing" in the "Acquisition" "Acquisition Source" field
      And user selects "Local Organizations" from dropdown in "Acquisition Source" row
      And the user saves the record
    Then the record is successfully saved
    Then the titlebar should contain "2015.1.89"
    Then the titlebar should contain "testing"
      And user enters "sample" in the "Acquisition" "Acquisition Source" field
      And user selects "Local Organizations" from dropdown in "Acquisition Source" row
    Then the titlebar should contain "sample"
      And user enters "test" in the "Acquisition" "Owner" field
      And user selects "bobby test" from dropdown in "Owner" row
    Then the titlebar should contain "2015.1.89"
    Then the titlebar should contain "sample"

  Scenario: Docking Title Bar
    # fill out all required fields
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "2009.1" from dropdown in "Acquisition Reference Number" row
      And the user saves the record
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "deleteButton" buttons
    Then "GMT-0800 (PST)" should be displayed in the message bar

  Scenario: Folding and Unfolding boxes
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And user clicks on the "Fold" symbol next to "Acquisition Information"
    Then the "Object Collection Information" section should fold
      And the "Fold" symbol next to "Object Collection Information" should be a folded symbol
    When user clicks on the "Fold" symbol next to "Acquisition Information"
    Then the "Object Collection Information" section should unfold
      And the "Fold" symbol next to "Object Collection Information" should be a unfolded symbol
      And close the browser

  Scenario: Vocabulary pivoting
    When user adds "test" to the "authority" field
      And the user saves the record
    Then the record is successfully saved
    Then the cancel button should not be clickable
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
