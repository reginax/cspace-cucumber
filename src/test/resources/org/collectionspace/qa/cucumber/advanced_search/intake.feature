@supplementary_to_secondary
#Created by Forest Yang on 1/8/2016
Feature: Advanced Search - Intake

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Intake"
      And user enters "Lagume" in the "Intake" "Intake Entry Number" field
      And user enters "Samwise" in the "Intake" "Current Owner" vocab field
      And user adds "Samwise" to "Local Persons"
      And user enters "Anathema" in the "Intake" "Depositor" vocab field
      And user adds "Anathema" to "Local Persons"
      And user enters "2011-01-01" in the "Intake" "Entry Date" field
      And user enters "2011-01-01" in the "Intake" "Return Date" field
      And user clicks on the "Intake" "Entry Method" field
    Then a drop down list should appear in the "Entry Method" row
      And user selects "Found on doorstep" from dropdown in "Entry Method" row
      And user clicks on the "Intake" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Enquiry" from dropdown in "Entry Reason" row
      And user enters "Azkaban" in the "Intake" "Current Location" vocab field
      And user adds "Azkaban" to "Local Storage Locations"
      And user enters "textbook" in the "Intake" "Field collection event name" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters "Samwise" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Samwise" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Intake Entry Number
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters "Lagume" in the "Advanced Search" "Intake Entry Number" field
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Depositor
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters "Anathema" in the "Intake" "Depositor" vocab field
      And user clicks on "Anathema" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Entry Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters "2011-01-01" in the "Advanced Search" "Entry Date" field
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Return Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters "2011-01-01" in the Advanced Search" "Return Date" field
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Entry Method
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user clicks on the "Advanced Search" "Entry Method" field
    Then a drop down list should appear in the "Entry Method" row
      And user selects "Found on doorstep" from dropdown in "Entry Method" row
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Entry Reason
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user clicks on the "Advanced Search" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Enquiry" from dropdown in "Entry Reason" row
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Current Location
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters "Azkaban" in the "Advanced Search" "Current Location" vocab field
      And user clicks on "Azkaban" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Field collection event name
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Field collection event name" field
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by Edit Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "Lagume"
    Then close the browser

  #test2
  Scenario: Boolean field-based Search
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Intake"
      And user enters "maSkArA" in the "Intake" "Intake Entry Number" field
      And user enters "Jane Doe" in the "Intake" "Current Owner" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user clicks on the "Intake" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Consideration" from dropdown in "Entry Reason" row
      And user enters "testtest" in the "Intake" "Entry Note" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Intake"
      And user enters "KaNoRrA" in the "Intake" "Intake Entry Number" field
      And user enters "Jane Doe" in the "Intake" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Intake" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Consideration" from dropdown in "Entry Reason" row
      And user enters "testtest" in the "Intake" "Packing Note" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Intake"
      And user enters "AnkORrA" in the "Intake" "Intake Entry Number" field
      And user enters "Jane Doe" in the "Intake" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Intake" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Loan" from dropdown in "Entry Reason" row
      And user enters "testtest" in the "Intake" "Field collection note" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Consideration" from dropdown in "Entry Reason" row
      And user clicks the "Search" button
    Then the search results should contain "maSkArA"
    Then the search results should contain "KaNoRrA"
    Then the search results should contain "AnkORrA"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field    
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Consideration" from dropdown in "Entry Reason" row
      And user clicks the "Search" button
    Then the search results should contain "maSkArA"
    Then the search results should contain "KaNoRrA"
    Then the search results should not contain "AnkORrA"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user selects "any (OR)" boolean dropdown
      And user enters "testtest" in the keyword search field
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Consideration" from dropdown in "Entry Reason" row
      And user clicks the "Search" button
    Then the search results should contain "maSkArA"
    Then the search results should contain "KaNoRrA"
    Then the search results should contain "AnkORrA"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Intake" from record type dropdown
      And user selects "all (AND)" boolean dropdown
      And user enters "testtest" in the keyword search field
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Entry Reason" field
    Then a drop down list should appear in the "Entry Reason" row
      And user selects "Consideration" from dropdown in "Entry Reason" row
      And user clicks the "Search" button
    Then the search results should contain "maSkArA"
    Then the search results should contain "KaNoRrA"
    Then the search results should not contain "AnkORrA"
    Then close the browser
    

      
