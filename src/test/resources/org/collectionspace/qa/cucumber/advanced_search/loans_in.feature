@advanced_search
#created by forest yang on 12/28/2015

Feature: Advanced Search - Loans In
  #Test1
  Scenario: Search by Loan In Number
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan In"
      And user enters "textbook" in the "Loan In" "Loan In Number" field
      And user clicks on the "Loan In" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Exhibition" from dropdown in "Loan Purpose" row
      And user enters "textbook" in the "Loan In" "Lender" vocab field
      And user adds "textbook" to "Local Persons"
      And user enters "2011-01-01" in the "Loan In" "Loan In Date" field
      And user enters "2011-01-01" in the "Loan In" "Loan In Return Date" field
      And user enters "2011-01-01" in the "Loan In" "Loan Renewal Application Date" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Loan In Number" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan Purpose
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Exhibition" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Lender
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Lender" vocab field
      And user clicks on "textbook" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan In Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user enters "2011-01-01" in the "Advanced Search" "Loan In Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan In Return Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user enters "2011-01-01" in the "Advanced Search" "Loan In Return Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Loan In Renewal Application Date
    Given user is on the "My Collectionspace" page#
      And user clicks on link to "Advanced Search" in upper right corner#
    Then the titlebar should contain "Advanced Search"#
      And user selects "Loan In" from record type dropdown#
      And user enters "2011-01-01" in the "Advanced Search" "Loan In Renewal Application" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by Edit Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  #Test2 
  Scenario: Boolean field-based search
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan In"
      And user enters "textbook2" in the "Loan In" "Loan In Number" field
      And user clicks on the "Loan In" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user enters "testtest" in the "Loan In" "Loan In Conditions" field
      And user enters "2001-01-01" in the "Loan In" "Loan In Date" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan In"
      And user enters "textbook3" in the "Loan In" "Loan In Number" field
      And user clicks on the "Loan In" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user enters "testtest" in the "Loan In" "Loan In Conditions" field
      And user enters "2001-01-01" in the "Loan In" "Loan In Date" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Loan In" 
      And user enters "textbook4" in the "Loan In" "Loan In Number" field
      And user clicks on the "Loan In" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Photography" from dropdown in "Loan Purpose" row
      And user enters "testtest" in the "Loan In" "Loan In Conditions" field
      And user enters "2001-01-01" in the "Loan In" "Loan In Date" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Earliest" field
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Latest" field
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "textbook2"
    Then the search results should contain "textbook3"
    Then the search results should contain "textbook4"
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Loan In" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Earliest" field
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Latest" field
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "textbook2"
    Then the search results should contain "textbook3"
    Then the search results should not contain "textbook4"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user clicks the "Search button" 
    Then the search results should contain "textbook2"
    Then the search results should contain "textbook3"
    Then the search results should contain "textbook4" 
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Loan In" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Earliest" field
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Latest" field
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "textbook2"
    Then the search results should contain "textbook3"
    Then the search results should contain "textbook4"
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Loan In" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Earliest" field
      And user enters "2001-01-01" in the "Advanced Search" "Loan In Date" "Latest" field
      And user clicks on the "Advanced Search" "Loan Purpose" field
    Then a drop down list should appear in the "Loan Purpose" row
      And user selects "Research" from dropdown in "Loan Purpose" row
      And user clicks the "Search" button
    Then the search results should contain "textbook2"
    Then the search results should contain "textbook3"
    Then the search results should not contain "textbook4"
    Then close the browser









     