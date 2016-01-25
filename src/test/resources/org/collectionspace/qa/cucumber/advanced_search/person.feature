@supplementary_to_secondary
#Created by Forest Yang on 1/11/2016
Feature: Advanced Search - Person

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Person"
      And user enters "Fleet Foxes" in the "Person" "Display Name" field
      And user clicks on the "Person" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Accepted" from dropdown in "Status" row
      And user enters "2011-01-01" in the "Person" "Birth Date" field
      And user enters "2011-01-01" in the "Person" "Death Date" field
      And user enters "Fetty Wap" in the "Person" "Group" field
      And user enters "Trapanese" in the "Person" "Nationality" field
      And user clicks on the "Person" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Male" from dropdown in "Gender" row
      And user enters "Emcee" in the "Person" "Occupation" field
      And user enters "Banger" in the "Person" "School/Style" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters "Fleet Foxes" in the "Advanced Search" "Display Name" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Status
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user clicks on the "Advanced Search" "Status" field
    Then a drop down list should appear in the "Status" row
      And user selects "Accepted" from dropdown in "Status" row
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Birth Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters "2011-01-01" in the "Advanced Search" "Birth Date" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Death Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters "2011-01-01" in the "Advanced Search" "Death Date" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Group
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters "Fetty Wap" in the "Advanced Search" "Group" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Occupation
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters "Emcee" in the "Advanced Search" "Occupation" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Nationality
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters "Trapanese" in the "Advanced Search" "Nationality" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Gender
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user clicks on the "Advanced Search" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Male" from dropdown in "Gender" row
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by School/Style
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters "Banger" in the "Advanced Search" "School/Style" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "Fleet Foxes"
    Then close the browser

  #Test2
  Scenario: Boolean field-based search
    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Person"
      And user enters "Lorelai" in the "Person" "Display Name" field
      And user enters "1975-07-05" in the "Person" "Birth Date" field
      And user clicks on the "Person" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Female" from dropdown in "Gender" row
      And user enters "testtest" in the "Person" "Name Notes" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Person"
      And user enters "Andrea" in the "Person" "Display Name" field
      And user enters "1975-07-05" in the "Person" "Birth Date" field
      And user clicks on the "Person" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Female" from dropdown in "Gender" row
      And user enters "testtest" in the "Person" "Biographical Note" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Person"
      And user enters "DD" in the "Person" "Display Name" field
      And user enters "1975-07-05" in the "Person" "Birth" field
      And user clicks on the "Person" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Male" from dropdown in "Gender" row
      And user enters "textbook" in the "Person" "Name Notes" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search" 
      And user selects "Person" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
  #should automatically go in earliest.. i think
      And user enters "1975-06-05" in the "Advanced Search" "Birth Date" field
      And user clicks on the "Advanced Search" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Male" from dropdown in "Gender" row
      And user clicks the "Search" button
    Then the search results should contain "Lorelai"
    Then the search results should contain "Andrea"
    Then the search results should contain "DD"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "1975-06-06" in the "Advanced Search" "Birth Date" field
      And user clicks on the "Advanced Search" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Female" from dropdown in "Gender" row
      And user clicks the "Search" button
    Then the search results should contain "Lorelai"
    Then the search results should ccontain "Andrea"
    Then the search results should not contain "DD"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "testtest" in the keyword search field
      And user enters "1975-06-05" in the "Advanced Search" "Birth Date" field
      And user clicks on the "Advanced Search" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Male" from dropdown in "Gender" row
      And user clicks the "Search" button
    Then the search results should contain "Lorelai"
    Then the search results should contain "Andrea"
    Then the search results should not contain "DD"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Person" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "textbook" in the keyword search field
      And user enters "1975-06-05" in the "Advanced Search" "Birth Date" field
      And user clicks on the "Advanced Search" "Gender" field
    Then a drop down list should appear in the "Gender" row
      And user selects "Male" from dropdown in "Gender" row
      And user clicks the "Search" button
    Then the search results should not contain "Lorelai"
    Then the search results should not contain "Andrea"
    Then the search results should contain "DD"
    Then close the browser





