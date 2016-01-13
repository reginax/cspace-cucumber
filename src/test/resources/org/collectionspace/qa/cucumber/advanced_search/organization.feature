@supplementary_to_secondary
#Created by Forest Yang on 1/11/2016
Feature: Advanced Search - Organization

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Organization" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Organization"
      And user enters "D'Angelo" in the "Organization" "Display Name" field
      And user enters "2011-01-01" in the "Organization" "Foundation Date" field
      And user enters "2011-01-01" in the "Organization" "Dissolution Date" field
      And user enters "Valkyries" in the "Organization" "Group" field
      And user enters "Ride" in the "Organization" "Function" field
      And user clicks on the "Organization" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Under Review" from dropdown in "Status" row
      And user enters "textbook" in the "Organization" "Foundation Place" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters "D'Angelo" in the "Advanced Search" "Display Name" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by Foundation Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters "2011-01-01" in the "Advanced Search" "Foundation Date" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by Dissolution Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters "2011-01-01" in the "Advanced Search" "Dissolution Date" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by Group
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters "Valkyries" in the "Advanced Search" "Group" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by Function
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters "Ride" in the "Advanced Search" "Function" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by Status
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Under Review" from dropdown in "Status" row
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by Foundation place
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Foundation Place" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser

  Scenario: search by partial
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user enters "textb*" in the "Advanced Search" "Foundation Place" field
      And user clicks the "Search" button
    Then the search results should contain "D'Angelo"
    Then close the browser


  #Test2
  Scenario: 
    Given user is on the "Create New" page
      And user selects the "Organization" radio button on the Create New page
      And user clicks on the Create button
    Then the titlebar should contain "Organization"
      And user enters "Endless Ennui" in the "Organization" "Display Name" field
      And user enters "1975-07-05" in the "Organization" "Foundation Date" field
      And user clicks on the "Organization" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Accepted" from dropdown in "Status" row
      And user enters "testtest" in the "Organization" "Foundation Place"
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And user selects the "Organization" radio button on the Create New page
      And user clicks on the Create button
    Then the titlebar should contain "Organization"
      And user enters "Pedestrian at Best" in the "Organization" "Display Name" field
      And user enters "1975-07-05" in the "Organization" "Foundation Date" field
      And user clicks on the "Organization" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Accepted" from dropdown in "Status" row
      And user enters "testtest" in the "Organization" "Foundation Place"
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And user selects the "Organization" radio button on the Create New page
      And user clicks on the Create button
    Then the titlebar should contain "Organization"
      And user enters "Courtney Barnett" in the "Organization" "Display Name" field
      And user enters "1975-07-05" in the "Organization" "Foundation Date" field
      And user clicks on the "Organization" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Rejected" from dropdown in "Status" row
      And user enters "testtest" in the "Organization" "Foundation Place"
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "1975-06-05" in the "Advanced Search" "Foundation Date" field
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Rejected" from dropdown in "Status" row
      And user clicks the "Search" button
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"
    Then the search results should contain "Courtney Barnett"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Organization" from record type dropdown
      And user selects "and (ALL)" from boolean dropdown
      And user enters "1975-06-05" in the "Advanced Search" "Foundation Date" field
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Accepted" from dropdown in "Status" row
      And user clicks the "Search" button
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"
    Then the search results should not contain "Courtney Barnett"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Organization" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "1975-06-05" in the "Advanced Search" "Foundation Date" field
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Rejected" from dropdown in "Status" row
      And user clicks the "Search" button
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"
    Then the search results should contain "Courtney Barnett"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user enters "testtest" in the keyword search field
      And user selects "Organization" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "1975-06-05" in the "Advanced Search" "Foundation Date" field
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Accepted" from dropdown in "Status" row
      And user clicks the "Search" button
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"
    Then the search results should not contain "Courtney Barnett"
    Then close the browser




