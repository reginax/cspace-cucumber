# created by forest at 11/29/2015
@supplementary
Feature: Supplementary Manual QA - Location-Movement-Inventory Secondary Tab

  Scenario: Create a dummy record
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the create button
    Then the titlebar should contain "Location/Movement/Inventory"
      And enters "Dummy Location" in the "Location/Movement/Inventory" "Current Location" vocab field
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
      And enters "Dummy Record" in the top nav search field
      And selects "Cataloging" from the top nav search record select type field
      And clicks on the top nav search submit button
    Then the search results should contain "Dummy Record" 
      And clicks "Dummy Record" to load the record
    Then the titlebar should contain "Dummy Record"

