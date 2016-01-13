@supplementary_to_secondary
#Created by Forest Yang on 1/9/2016
Feature: Advanced Search - Place

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Place" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Place"
      And user enters "Conyay" in the "Place" "Display Name" field
      And user enters "RealFrend" in the "Place" "Name" field
      And user clicks on the "Place" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Under Review" from dropdown in "Status" row
      And user clicks on the "Place" "Language" field
    Then a drop down list should appear in the "Language" row 
      And user selects "Japanese" from dropdown in "Language" row
      And user clicks on the "Place" "Place type" field
    Then a drop down list should appear in the "Place type" row
      And user selects "Borough" from dropdown in "Place type" row
      And user enters "I love you honeybear" in the "Place" "Place note" field
      And user enters "Travvy" in the "Place" "Owner" vocab field
      And user adds "Travvy" to "Local Persons"
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user enters "Conyay" in the "Advanced Search" "Display Name" field
      And user clicks the "Search" button 
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by Name
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user enters "RealFrend" in the "Advanced Search" "Name" field
      And user clicks the "Search" button
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by Status
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Under Review" from dropdown in "Status" field
      And user clicks the "Search" button
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by Language
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search" 
      And user selects "Place" from record type dropdown
      And user clicks on the "Advanced Search" "Language" field
    Then a drop down list should appear in the "Language" row
      And user selects "Japanese" from dropdown in "Language" row
      And user clicks the "Search" button
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by place type
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user clicks on the "Advanced Search" "Place type" field
    Then a drop down list should appear in the "Place type" row
      And user selects "Borough" from dropdown in "Place type" row
      And user clicks the "Search" button
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by Place note
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user enters "I love you honeybear" in the "Advanced Search" "Place note" field
      And user clicks the "Search" button
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by owner
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user enters "Travvy" in the "Advanced Search" "Owner" vocab field
      And user clicks on "Travvy" from autocomplete options
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "Conyay"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Place" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "Conyay"
    Then close the browser
