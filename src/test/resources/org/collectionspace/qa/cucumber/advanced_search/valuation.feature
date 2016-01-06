@advanced_search
#Created by Forest Yang on 1/5/2015
Feature: Advanced Search - Valuation

  #Test1 
  Scenario: Advanced Search Field
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Valuation Control" 
      And user enters "multi-love" in the "Valuation Control" "Valuation Control Reference Number" field
      And user enters "06-06-1666" in the "Valuation Control" "Date" field
      And user enters "06-06-1666" in the "Valuation Control" "Renewal Date" field
      And user clicks on the "Valuation Control" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user enters "sarcastish" in the "Valuation Control" "Source" vocab field
      And user adds "sarcastish" to "Local Persons" 
      And user enters "textbook" in the "Valuation Control" "Note" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user clicks on the "Advanced Search" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user clicks the "Search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by ref no
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters "multi-love" in the "Advanced Search" "Valuation Control" field
      And user clicks the "Search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters "1666-06-06" in the "Advanced Search" "Date" field
      And user clicks the "Search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Renewal Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters "1666-06-06" in the "Advanced Search" "Renewal Date" field
      And user clicks the "Search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Source
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters "sarcastish" in the "Advanced Search" "Source" vocab field
      And user clicks on "sarcastish" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by note
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Note" field
      And user clicks the "Search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by partial note
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters "textb*" in the "Advanced Search" "Note" field
      And user clicks the "Search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "textbook"
    Then close the browser


  #Test2
  Scenario: Boolean-based field search
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Valuation Control"
      And user enters "Extreme Wealth" in the "Valuation Control" "Valuation Control Reference Number" field
      And user enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user clicks on the "Valuation Control" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user enters "testtest" in the "Valuation Control" "Note" field
      And the user saves the record
    Then the record is saved successfully
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Valuation Control"
      And user enters "Casual Cruelty" in the "Valuation Control" "Valuation Control Reference Number" field
      And user enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user clicks on the "Valuation Control" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user enters "testtest" in the "Valuation Control" "Note" field
      And the user saves the record
    Then the record is saved successfully
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Valuation Control"
      And user enters "Unknown Mortal" in the "Valuation Control" "Valuation Control Reference Number" field
      And user enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user clicks on the "Valuation Control" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Original Value" from dropdown in "Type" row
      And user enters "testtest" in the "Valuation Control" "Note" field
      And the user saves the record
    Then the record is saved successfully
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Source" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user clicks the "Search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should contain "Unknown Mortal"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Source" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user clicks the "Search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should not contain "Unknown Mortal"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "testtest" in the keyword search field
      And user enters "Jane Doe" in the "Advanced Search" "Source" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Type" field
    Then a drop down list should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user clicks the "Search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should contain "Unknown Mortal"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Valuation Control" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "testtest" in the keyword search field
      And user enters "Jane Doe" in the "Advanced Search" "Source" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Type" field
    Then a drop down lis should appear in the "Type" row
      And user selects "Current Value" from dropdown in "Type" row
      And user clicks the "Search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should not contain "Unknown Mortal"
    Then close the browser
