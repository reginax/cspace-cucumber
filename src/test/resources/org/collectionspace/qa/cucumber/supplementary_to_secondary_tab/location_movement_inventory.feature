# created by forest at 11/29/2015

@supplementarysecondary
Feature: Supplementary Manual QA - Location-Movement-Inventory Secondary Tab

  Scenario: Create a dummy record
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the create button
    Then the titlebar should contain "Location/Movement/Inventory"
      And user enters "Dummy Location" in the "Location/Movement/Inventory" "Current Location" vocab field
  # Not a known stepdef
      And user adds "Dummy Location" to "Local Storage Locations" from vocabulary autocomplete
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the create button
    Then the titlebar should contain "Cataloging"
      And enters "Dummy Record" in the "Cataloging" "Identification Number" field
      And the user saves the record
    Then the record is successfully saved
    Then close the browser
  

  Scenario: Basic Secondary Tab Testing
    Given user is on the "My CollectionSpace" page
      And user enters "Dummy Record" in the top nav search field
      And selects "Cataloging" from the top nav search record select type field
      And clicks on the top nav search submit button
    Then the search results should contain "Dummy Record" 
  # Not a known stepdef
      And clicks "Dummy Record" to load the record
    Then the titlebar should contain "Dummy Record"
      And user selects the "Loc/Mov/Inv" tab
  # Not a known stepdef
    Then a "No related records yet" message should appear
  # Not a known stepdef
      And user clicks the "+ Add Record" button
      And clicks on the create button
    Then the "Cancel changes" button at the top of the page should not be clickable
    Then the "Cancel changes" button at the bottom of the page should not be clickable
    Then the "Delete this relation." button at the top of the page should be clickable
    Then the "Delte this relation." button at the bottom of the page should be clickable
  # Not a known stepdef
    Then a "Creating New Related Record" meessage should appear
  # Not a known stepdef
      And user clicks the "Select number pattern" button
      And user selects "Inventory" from dropdown in "Reference Number" row
    Then the "Cancel changes" button at the top of the page should be clickable
    Then the "Cancel changes" button at the bottom of the page should be clickable
      And user enters "Dummy Location" in the "Location/Movement/Inventory" "Current Location" vocab field
    Then the vocabulary autocomplete should contain "Dummy Location"
      And user clicks on "Dummy Location" from autocomplete options
      And user fills in required fields for "Location/Movement/Inventory" record
      And the user saves the record
  # Not a known stepdef
    Then the record listing should contain the entry
    Then the "Cancel changes" button at the top of the page should be clickable
    Then the "Cancel changes" button at the bottom of the page should be clickable
      And user enters "Dummy Location" in the top nav search field
      And selects "Location/Movement/Inventory" from the top nav search record select type field
      And clicks on the top nav search submit button
  # Auto generated reference number, no way to fix it apparently so can only refer to as "the entry"
    Then the search results should contain the entry
  # same issue as above
      And user clicks the entry to load the record
    Then the titlebar should contain "Location/Movement/Inventory"
      And user selects the "Cataloging" tab
    Then "Dummy Record" should appear in the "Cataloging" sidebar
  # Not a step def
      And user clicks the link to "Dummy Record" in the "Cataloging" sidebar
    Then the titlebar should contain "Cataloging"
  # same the entry reference issue
    Then the entry should appear in the "Procedures" sidebar
      And user clikcs the link to the entry in the "Procedures" sidebar
    Then the titlebar should contain "Location/Movement/Inventory"
    Then close the browser

  Scenario: Search to relate Dialog
    Given user is on the "My CollectionSpace" page
      And user enters "Dummy Record" in the top nav search field
      And selects "Cataloging" from the top nav search record select type field
      And clicks on the top nav search submit button
    Then the search results should contain "Dummy Record" 
  # Not a known stepdef
      And clicks "Dummy Record" to load the record
    Then the titlebar should contain "Dummy Record"
      And user selects the "Loc/Mov/Inv" tab
      And user clicks the "+ Add Record" button
      And user clicks close button
  # Not a known stepdef
    Then no changes to the record should occur
      And user clicks the "+ Add Record" button
  # Not a known stepdef
      And user clicks the search button
  # Definitely not a stepdef, lol
    Then locked records should not be markable
  # Not a known stepdef 
      And user presses "Esc" on keyboard
  # Not a known stepdef
      And user clicks an added record on the Related Record list
  # Not a known stepdef
    Then an "Edit Location/Movement/Inventory Record" form should be displayed 
  # Not a known stepdef
      And user clicks the "Select number pattern" button
      And user selects "Location" from dropdown in "Reference Number" row
  # Not a known stepdef
    Then the "Location/Movement/Inventory" "Reference Number" field should have changed
      And the user saves the record
    Then the record is successfully saved
    Then close the browser

  # Requires massive use of tabbing
  Scenario: Keyboard Navigation
    Given user is on the "My CollectionSpace" page
      And user enters "Dummy Record" in the top nav search field
      And selects "Cataloging" from the top nav search record select type field
      And clicks on the top nav search submit button
    Then the search results should contain "Dummy Record" 
  # Not a known stepdef
      And clicks "Dummy Record" to load the record
    Then the titlebar should contain "Dummy Record"
      And user tabs to "Loc/Mov/Inv" tab
      And user presses enter
    Then related records should be displayed
      And user tabs to + Add Record" button
      And user presses enter
      And user tabs to "Create" button
      And user presses enter
      And user tabs to "Select number pattern" button
      And user presses enter
      And user tabs to "Location" from dropdown in "Reference Number" row
      And user presses enter
      And user tabs to "Save" button
      And user presses enter
    Then the record is saved successfully
    Then close the browser 
