# Created by Jennifer Lynn Be on 01/05/2016
# needs to be tested

@supplementaryprimary
Feature: Supplementary Manual QA - Location-Movement-Inventory

  Scenario: New Record Behavior
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
    Then the "cancel" button should not be clickable
    Then the "delete" button should not be clickable
    When user clicks the "add" button on the "Cataloging" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it." should be displayed
    When user clicks the "add" button on the "Procedures" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it." should be displayed
    Then close the browser

  Scenario: Number Chooser
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "Inventory" from dropdown in "Reference Number" row
    Then enables top and bottom "cancel" buttons
      And user clicks Select number pattern
      And user selects "Inventory" from dropdown in "Reference Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Location/Movement/Inventory" "Reference Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And user adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And user adds "2016-01-01" to the "Location/Movement/Inventory" "Location Date" field
    Then the titlebar should contain "New York Theater"
    Then the titlebar should contain "2016-01-01"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And user adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And the user saves the record
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And user adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And user adds "2016-01-01" to the "Location/Movement/Inventory" "Location Date" field
      # cannot enable a scroll to bottom of page
      And user clicks on the "Contact" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "New York Theater"
    Then the titlebar should contain "2016-01-01"
    Then close the browser

  Scenario: Folding and Unfolding Boxes
    # folding steps do not exist
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Object Location Information"
    Then the "Object Location Information" section should fold
    Then the "Fold" symbol next to "Object Location Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Location Information"
    Then the "Object Location Information" section should unfold
    Then the "Fold" symbol next to "Object Location Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Movement Information"
    Then the "Movement Information" section should fold
    Then the "Fold" symbol next to "Movement Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Movement Information"
    Then the "Movement Information" section should unfold
    Then the "Fold" symbol next to "Movement Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Inventory Information"
    Then the "Inventory Information" section should fold
    Then the "Fold" symbol next to "Inventory Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Inventory Information"
    Then the "Inventory Information" section should unfold
    Then the "Fold" symbol next to "Inventory Information" should be an unfolded symbol
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And user enters "1.2.3.4.5" in the "Location/Movement/Inventory" "Reference Number" field
      And user adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And the user saves the record
      Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      And the user saves the record
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "New York Theater" should appear in the Terms Used sidebar
    Then "organization" should appear in the Terms Used sidebar
    Then "currentLocation" should appear in the Terms Used sidebar
      And user clicks on "New York Theater" in the Terms Used sidebar
    Then the titlebar should contain "New York Theater"
    # Used By steps do not exist
    Then "1.2.3.4.5" should appear in the Used By sidebar
      And user clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And user clicks on the delete button
      And user clicks the confirmation delete button
      And user clicks delete confirmation OK button
    Then close the browser

  Scenario: Hard Save
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And user enters "1.2.3.4.5" in the "Location/Movement/Inventory" "Reference Number" field
      And user adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And the user saves the record
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      And the user saves the record
    Then the record is successfully saved
      And user adds "2016-01-01" to the "Location/Movement/Inventory" "Location Date" field
      And the user saves the record
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      # hard save not implemented
      And the user hard saves the record
    Then the record is read-only
    Given user is on the "My CollectionSpace" page
      And enters "New York Theater" in the top nav search field
      And selects "Location/Movement/Inventory" from the top nav search record select type field
      And clicks on the top nav search submit button
    # locked not implemented
    Then the search results should contain a locked "1.2.3.4.5" 
      And the user clicks on result with text "1.2.3.4.5"
    # not implemented read-only
    Then the record should be read-only

  Scenario: Hard Save with Related Records
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And user enters "123123123" in the "Location/Movement/Inventory" "Reference Number" field
      And user adds "Metro Pictures Corporation" to the "Location/Movement/Inventory" "Current Location" vocab field
      And the user saves the record
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      And the user saves the record
    Then the record is successfully saved
      And user selects the "Acquisitions" tab
      # not stepdefs
      And user selects "Add record" button
      And user selects "create" button
      And user enters "456.456.456" in the "Acquisition" "Acquisition Reference Number" field
      And the user saves the record
    Then the record is successfully saved
      And user selects the "Cataloging" tab
      # not stepdefs
      And user selects "Add record" button
      And user selects "create" button
      And user enters "987.987.987" in the "Cataloging" "Identification Number" field
      And the user saves the record
    Then the record is successfully saved
      And user selects the "Current Record" tab
      And the user saves the record
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      # hard save not implemented
      And the user hard saves the record
    Then the record is read-only
    Given user is on the "My CollectionSpace" page
      And enters "Metro Pictures Corporation" in the top nav search field
      And selects "Location/Movement/Inventory" from the top nav search record select type field
      And clicks on the top nav search submit button
    # locked not implemented
    Then the search results should contain a locked "123123123" 
      And the user clicks on result with text "123123123"
    # not implemented read-only
    Then the record should be read-only
    And user selects the "Acquisitions" tab
    And the user clicks on result with text "456.456.456"
    And user enters "3242342" in the "Acquisition" "Acquisition Reference Number" field
      And the user saves the record
    Then the record is successfully saved
      And user selects the "Cataloging" tab
      And the user clicks on result with text "987.987.987"
      And user enters "3rrew42342" in the "Cataloging" "Identification Number" field
      And the user saves the record
    Then the record is successfully saved

  Scenario: Keyboard Accessibility
    # doesn't work, need to do later
    When user uses tab through the entire formula
    Then each of the fields should be reachable
    Then the two save buttons and Cancel button should be reachable
    Then the folding functionality should be usable # tab to it and hit space
    Then the focus is visible at all times
    Then the terms used in the right frame should be reachable
