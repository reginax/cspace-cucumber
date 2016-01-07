@advanced_search
#Created by Forest Yang on 12/302015
Feature: Advanced Search - Media Handling

#Decided to disinclude uploading an image, because an automated way of doing so seems.... dodgy

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Media Handling" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Media Handling"
      And user enters "hailstorm" in the "Media Handling" "Title" field
      And user enters "685934" in the "Media Handling" "Identification Number" field
      And user clicks on the "Media Handling" "Types" field
    Then a drop down list should appear in the "Types" row
      And user selects "Dataset" from dropdown in "Types" row
      And user enters "Lord Jesus" in the "Media Handling" "Creator" vocab field
      And user adds "Lord Jesus" to "Local Persons"
      And user clicks on the "Media Handling" "Languages" field
    Then a drop down list should appear in the "Languages" row
      And user selects "Hebrew" from dropdown in "Languages" row
      And user enters "0-0-0" in the "Media Handling" "Dates" field
      And user enters "Lord Lucifer" in the "Media Handling" "Publisher" vocab field
      And user adds "Lord Lucifer" to "Local Persons"
      And user enters "Pearly Gates" in the "Media Handling" "Source" field
      And user enters "Yahweh" in the "Media Handling" "Rights holder" vocab field
      And user adds "Yahweh" to "Local Persons"
      # And user uploads an image
      And user enters "textbook" in the "Media Handling" "Subjects" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "685934" in the "Advanced Search" "Identification Number" field
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Title
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown    
      And user enters "hailstorm" in the "Advanced Search" "Title" field
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Types
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user clicks on the "Advanced Search" "Types" field
    Then a drop down list should appear in the "Types" row
      And user selects "Dataset" from dropdown in "Types" row
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Creator
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "Lord Jesus" in the "Advanced Search" "Creator" vocab field
      And user clicks on "Lord Jesus" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Languages
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user clicks on the "Advanced Search" "Languages" field
    Then a drop down list should appear in the "Languages" row
      And user selects "Hebrew" from dropdown in "Languages" row
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Dates
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "0-0-0" in the "Advanced Search" "Dates" field
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Publisher
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "Lord Lucifer" in the "Advanced Search" "Publisher" vocab field
      And user clicks on "Lord Lucifer" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Source
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "Pearly Gates" in the "Advanced Search" "Title" field
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Rights holder
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "Yahweh" in the "Advanced Search" "Rights holder" vocab field
      And user clicks on "Yahweh" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by subjects
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Subjects" field
      And user clicks the "Search" button
    Then the search results should contain "685934"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: textb**
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "textb*" in the "Advanced Search" "Subjects" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  #Test2 
  Scenario: Boolean field-based search
    Given user is on the "Create New" page
      And selects the "Media Handling" radio button on the Create New page
      And clicks on the create button
    Then the titlebar should contain "Media Handling"
      And user enters "4639" in the "Media Handling" "Identification Number" field
      And user enters "Jane Doe" in the "Media Handling" "Creator" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user enters "Jane Doe" in the "Media Handling" "Publisher" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user enters "testtest" in the "Media Handling" "Coverage" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Media Handling" radio button on the Create New page
      And clicks on the create button
    Then the titlebar should contain "Media Handling"
      And user enters "3246" in the "Media Handling" "Identification Number" field
      And user enters "Jane Doe" in the "Media Handling" "Creator" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user enters "Jane Doe" in the "Media Handling" "Publisher" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user enters "testtest" in the "Media Handling" "Coverage" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Media Handling" radio button on the Create New page
      And clicks on the create button
    Then the titlebar should contain "Media Handling"
      And user enters "4245" in the "Media Handling" "Identification Number" field
      And user enters "Jane Doe" in the "Media Handling" "Creator" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user enters "James Dean" in the "Media Handling" "Publisher" vocab field
      And user clicks on "James Dean" from autocomplete options
      And user enters "testtest" in the "Media Handling" "Coverage" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search"
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "any (OR)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Creator" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user enters "Jane Doe" in the "Advanced Search" "Publisher" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "4639"
    Then the search results should contain "3246"
    Then the search results should contain "4245"
      And user clicks on link to "Advanced Search"
    Then the titlebar should contain "Advanced Search"
      And user selects "Media Handling" from record type dropdown
      And user enters "all (AND)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Creator" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user enters "Jane Doe" in the "Advanced Search" "Publisher" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "4639"
    Then the search results should contain "3246"
    Then the search results should not contain "4245"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Media Handling" from record type dropdown
      And user enters "any (OR)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Creator" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user enters "Jane Doe" in the "Advanced Search" "Publisher" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "4639"
    Then the search results should contain "3246"
    Then the search results should contain "4245"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Media Handling" from record type dropdown
      And user enters "and (ALL)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Creator" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user enters "Jane Doe" in the "Advanced Search" "Publisher" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "4639"
    Then the search results should contain "3246"
    Then the search results should not contain "4245"
    Then close the browser