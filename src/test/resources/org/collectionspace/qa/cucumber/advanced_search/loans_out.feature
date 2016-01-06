@advanced_search
#Created by Forest Yang on 12/29
Feature: Advanced Search - Loans Out

  #Test1
  Scenario: Advanced Search Fields - Loan Out Number
    Given user is on the "Create New" page
      And selects the "Loan Out" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan Out"
      And user enters "textbook" in the "Loan Out" "Loan Out Number" field
      And user clicks on the "Loan Out" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Exhibition" from dropdown in "Loan Purpose" row
      And user enters "textbook" in the "Loan Out" "Borrower" vocab field
      And user adds "textbook" to "Local Persons"
      And user clicks on the "Loan Out" "Loan Status" field
    Then a drop down list should appear in the "Loan Status" row
      And user selects "Agreed" from dropdown in "Loan Status" row
      And user enters "2022-01-01" in the "Loan Out" "Loan Out Date" field
      And user enters "2022-01-01" in the "Loan Out" "Loan Return Date" field
      And user enters "2022-01-01" in the "Loan Out" "Loan Renewal Application Date" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Loan Out Number" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan Purpose
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Exhibition" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "textbook" 
    Then close the browser

  Scenario: Search by Borrower
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Borrower" vocab field
      And user clicks on "textbook" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan Status
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user clicks on the "Advanced Search" "Loan Status" field
    Then a drop down list should appear in the "Loan Status" row
      And user selects "Agreed" from dropdown in "Loan Status" row
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan Out Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters "2022-01-01" in the "Advanced Search" "Loan Out Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan Return Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters "2022-01-01" in the "Advanced Search" "Loan Return Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan Renewal Application Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters "2022-01-01" in the "Advanced Search" "Loan Renewal Application Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook" 
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: textb**
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user enters "textb*" in the "Advanced Search" "Loan Out Number" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  #Test2
  Scenario: Boolean field based search
    Given user is on the "Create New" page
      And selects the "Loan Out" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan Out" 
      And user enters "example" in the "Loan Out" "Loan Out Number" field
      And user enters "John Doe" in the "Loan Out" "Borrower" vocab field
      And user adds "John Doe" to "Local Persons"
      And user clicks on the "Loan Out" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user enters "testtest" in the "Loan Out" "Loan Out Note" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Loan Out" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan Out" 
      And user enters "exampleexample" in the "Loan Out" "Loan Out Number" field
      And user enters "John Doe" in the "Loan Out" "Borrower" vocab field
      And user clicks on "John Doe" from autocomplete options
      And clicks on the "Loan Out" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user enters "testtest" in the "Loan Out" "Loan Out Conditions" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Loan Out" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan Out"
      And user enters "exampleexampleexample" in the "Loan Out" "Loan Out Number" field
      And user enters "John Doe" in the "Loan Out" "Borrower" vocab field
      And user clicks on "John Doe" from autocomplete options
      And user clicks on the "Loan Out" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Photography" from dropdown in "Loan Purpose" row
      And user enters "testtest" in the "Loan Out" "Loan Out Note" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search" 
      And user selects "any (OR)" from boolean dropdown
      And user selects "Loan Out" from record type dropdown
      And user enters "John Doe" in the "Advanced Search" "Borrower" vocab field
      And user clicks on "John Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should contain "exampleexampleexample"
      And user clicks on link to "Advanced Search" in upper right corner 
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan Out" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "John Doe" in the "Advanced Search" "Borrower" vocab field
      And user clicks on "John Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should not contain "exampleexampleexample"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Loan Out" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "John Doe" in the "Advanced Search" "Borrower" vocab field
      And user clicks on "John Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should not contain "exampleexampleexample"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Loan Out" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "John Doe" in the "Advanced Search" "Borrower" vocab field
      And user clicks on "John Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" field
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should not contain "exampleexampleexample"
    Then close the browser
    