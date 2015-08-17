Feature: Person Vocabulary Data Entry
  As a user
  I want to be able to enter data into the Person Vocabulary Form
  That Data should persist

  Scenario: User Creates a minimal Basic Person record
    Given user is on the Create New page
      And selects the "Person" radio button on the Create New page
    Then a drop down list should appear in the "Person" row
    Then the list in the "Person" row should contain "Local Persons, ULAN Persons"
      And clicks on the Create button
    Then the resulting page titlebar should contain "Local Person"
      And user enters "Joe Bean" in the "Display Name" field
      And the user saves the record
    Then "Joe Bean" should be in the "Display Name" field
    Then the resulting page titlebar should contain "Local Person"
    Then close the browser

    Scenario: User creates a basic ULAN Person record
      Given user is on the Create New page
        And selects the "Person" radio button on the Create New page
      Then a drop down list should appear in the "Person" row
        And user selects "ULAN Persons" from dropdown in "Person" row
        And clicks on the Create button
      Then the resulting page titlebar should contain "ULAN Persons"
        And user enters "Joe Bean Jr" in the "Display Name" field
        And the user saves the record
      Then "Joe Bean Jr" should be in the "Display Name" field
      Then the resulting page titlebar should contain "ULAN Person"
      Then close the browser

    Scenario Outline: Existing records should be searchable
      Given user is on the My CollectionSpace page
        And user enters "<searchTerm>" in the top nav search field
        And selects "<recordType>" from the top nav search record type select field
        And selects "<vocabulary>" from the top nav search vocabulary select field
        And clicks on the top nav search submit button
      Then the search results should contain "<results>"
      Then close the browser
      Examples:
      | searchTerm | recordType | vocabulary       | results               |
      | Joe Bean   | Person     | All Vocabularies | Joe Bean; Joe Bean Jr |
      | Joe Bean   | Person     | Local Persons    | Joe Bean              |
      | Joe Bean   | Person     | ULAN Persons     | Joe Bean Jr           |
