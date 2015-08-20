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
    Then the titlebar should contain "Local Person"
      And user enters "Joe Bean" in the "Display Name" field
      And the user saves the record
    Then the record is successfully saved
    Then "Joe Bean" should be in the "Display Name" field
    Then the titlebar should contain "Local Person"
    Then close the browser

    Scenario: User creates a basic ULAN Person record
      Given user is on the Create New page
        And selects the "Person" radio button on the Create New page
      Then a drop down list should appear in the "Person" row
        And user selects "ULAN Persons" from dropdown in "Person" row
        And clicks on the Create button
      Then the titlebar should contain "ULAN Persons"
        And user enters "Joe Bean Jr" in the "Display Name" field
        And the user saves the record
      Then the record is successfully saved
      Then "Joe Bean Jr" should be in the "Display Name" field
      Then the titlebar should contain "ULAN Person"
      Then close the browser

    Scenario: Searching for known records works as expected
      Given user is on the My CollectionSpace page
        And user enters "Joe Bean" in the top nav search field
        And selects "Person" from the top nav search record type select field
        And clicks on the top nav search submit button
      Then the search results should contain "Joe Bean; Joe Bean Jr"
      Then close the browser

    Scenario Outline: Scoping search for known records works as expected
      Given user is on the My CollectionSpace page
        And user enters "<searchTerm>" in the top nav search field
        And selects "<recordType>" from the top nav search record type select field
        And selects "<vocabulary>" from the top nav search vocabulary select field
        And clicks on the top nav search submit button
      Then the search results should contain "<result>"
        And the user clicks on result with text "<result>"
      Then "<result>" should be in the "Display Name" field
      Then the titlebar should contain "<vocabulary>"
      Then close the browser
      Examples:
      | searchTerm | recordType | vocabulary       | result                |
      | Joe Bean   | Person     | Local Persons    | Joe Bean              |
      | Joe Bean   | Person     | ULAN Persons     | Joe Bean Jr           |

    Scenario Outline: Person Vocab Terms should be suggested in Cataloging record
      Given user is on the Create New page
        And selects the "Cataloging" radio button on the Create New page
        And clicks on the Create button
      Then the titlebar should contain "Cataloging"
        And user fills in required fields for "Cataloging" record
        And user enters "<text>" in the "<field>" vocab field
      Then the vocabulary autocomplete should contain "<options>"
        And user clicks on "<choice>" from autocomplete options
        And the user saves the record
      Then the record is successfully saved
      Then "<choice>" should be in the "<field>" vocab field
      Then "<choice>" should appear in the Terms Used sidebar
        And user clicks on "<choice>" in Terms Used sidebar
      Then the titlebar should contain "Person"
      Then "<choice>" should be in the "Display Name" field
      Then close the browser
      Examples:
      | text  | field                       | options             | choice      |
      | Joe   | Cataloging->Content->Person |Joe Bean; Joe Bean Jr| Joe Bean    |
      | Joe   | Cataloging->Content->Person |Joe Bean; Joe Bean Jr| Joe Bean Jr |

    Scenario: Display Name
      Given user is on a blank Local Person record
        And user enters "James" in the "Forename" field
        And the user saves the record
      Then the error message bar should appear with "Please specify a Display Name"
        And user clicks OK to cancel error message
        And user enters "James Earl Jones" in the "Display Name" field
        And user removes focus from "Display Name" field
      Then the titlebar should contain "James Earl Jones"
        And user clicks the plus to repeat the "Person Term Group" form
      Then an additional "Person Term Group" record should be present
        And user adds "JEJ" in the "Display Name" field of the second "Person Term Group" form
        And user selects the additional "Person Term Group" as primary
      Then the titlebar should contain "JEJ"
      Then close the browser

    @testThis
    Scenario: Create Person record will All fields filled in
      Given user is on a blank Local Person record
        And user fills in all the fields of the "Person" record
        And the user saves the record
      Then the record is successfully saved
      Then all fields in "Person" record should be filled in
      Then close the browser