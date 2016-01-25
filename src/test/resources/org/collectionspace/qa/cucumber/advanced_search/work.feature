@supplementary_to_secondary
#Created by Forest Yang on 1/8/2016
Feature: Advanced Search - Work

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Work" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Work"
      And user enters "Carly" in the "Work" "Display Name" field
      And user clicks on the "Work" "Language" field
    Then a drop down list should appear in the "Language" row
      And user selects "Ancient Greek" from dropdown in "Language" row
      And user clicks on the "Work" "Status" field
    Then a drop down list should appear in the "Status" field
      And user selects "Complete" from dropdown in "Status" row
      And user clicks on the "Work" "Work type" field
    Then a drop down list should appear in the "Work type" row
      And user selects "Built" from dropdown in "Work type" row
      And user enters "Rae" in the "Work" "Creator" vocab field
      And user adds "Rae" to "Local Persons"
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user enters "Carly" in the "Advanced Search" "Display Name" field
      And user clicks the "Search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by language
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user clicks on the "Advanced Search" "Language" field
    Then a drop down list should appear in the "Language" row
      And user selects "Ancient Greek" from dropdown in "Language" row
      And user clicks the "Search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Status
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Language" row
      And user selects "Complete" from dropdown in "Status" row
      And user clicks the "Search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Work type
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user clicks on the "Advanced Search" "Work type" field
    Then a drop down list should appear in the "Work type" row
      And user selects "Built" from dropdown in "Work type" row
      And user clicks the "Search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Creator
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user enters "Rae" in the "Advanced Search" "Creator" vocab field
      And user clicks on "Rae" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Work" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser