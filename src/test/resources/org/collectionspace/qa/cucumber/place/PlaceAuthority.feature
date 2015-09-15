# Created by cbn at 9/15/15

  @place
Feature: Place Authority Data Entry


  Scenario: User Creates a minimal Basic Place record
    Given user is on the "Create New" page
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

  Scenario: User creates a basic TGN Place record
    Given user is on the "Create New" page
    And selects the "Place" radio button on the Create New page
    Then a drop down list should appear in the "Place" row
    And user selects "Thesaurus of Geographic Names (TGN)" from dropdown in "Place" row
    And clicks on the Create button
    Then the titlebar should contain "Thesaurus of Geographic Names (TGN)"
    And user enters "New York City" in the "Place" "Display Name" field
    And the user saves the record
    Then the record is successfully saved
    Then "New York City" should be in the "Place" "Display Name" field
    Then the titlebar should contain "Thesaurus of Geographic Names (TGN)"
    Then close the browser

  Scenario: Searching for known records works as expected
    Given user is on the "My CollectionSpace" page
    And user enters "New York" in the top nav search field
    And selects "Place" from the top nav search record type select field
    And clicks on the top nav search submit button
    Then the search results should contain "New York; New York City"
    Then close the browser

  Scenario Outline: Scoping search for known records works as expected
    Given user is on the "My CollectionSpace" page
    And user enters "<searchTerm>" in the top nav search field
    And selects "<recordType>" from the top nav search record type select field
    And selects "<vocabulary>" from the top nav search vocabulary select field
    And clicks on the top nav search submit button
    Then the search results should contain "<result>"
    And the user clicks on result with text "<result>"
    Then "<result>" should be in the "<recordType>" "Display Name" field
    Then the titlebar should contain "<vocabulary>"
    Then close the browser
    Examples:
      | searchTerm | recordType | vocabulary                          | result                |
      | New York   | Place      | Local Places                        | New York              |
      | New York   | Place      | Thesaurus of Geographic Names (TGN) | New York City         |