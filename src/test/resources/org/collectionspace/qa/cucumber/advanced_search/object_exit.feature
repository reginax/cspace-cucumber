@advanced_search
#Created by Forest Yang on 12/302015
Feature: Advanced Search - Object Exit

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New Page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And user enters "desiderium" in the "Object Exit" "Exit Number" field
      And user enters "tishas" in the "Object Exit" "Current Owner" vocab field
      And user adds "tishas" to "Local Persons"
      And user enters "oar" in the "Object Exit" "Depositor" vocab field
      And user adds "oar" to "Local Persons"
      And user enters "01-01-2011" in the "Object Exit" "Exit Date" field
      And user clicks on the "Object Exit" "Exit Method" field
    Then a drop down list should appear in the "Exit Method" row
      And user selects "Courier" from dropdown in "Exit Method" row
      And user clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Deaccession" from dropdown in "Exit Reason" row
      And user enters "textbook" in the "Object Exit" "Exit Note" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "desiderium" in the "Advanced Search" "Exit Number" field
      And user clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Current owner
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "tishas" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "tishas" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Depositor
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "oar" in the "Advanced Search" "Depositor" vocab field
      And user clicks on "oar" from autocomplete options
      And user clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search" 
      And user selects "Object Exit" from record type dropdown
      And user enters "01-01-2011" in the "Advanced Search" "Exit Date" field
      And user clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Method
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user clicks on the "Advanced Search" "Exit Method" field
    Then a drop down list should appear in the "Exit Method" row
      And user selects "Courier" from dropdown in "Exit Method" row
      And user clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Reason
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Deaccession" from dropdown in "Exit Reason" row
      And user clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Note
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "textbook" in the "Advanced Search" "Exit Note" field
      And user clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Note (partial)
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search" 
      And user selects "Object Exit" from record type dropdown
      And user enters "textb*" in the "Advanced Search" "Exit Note" field
      And user clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters today's date in the "Advanced Search" "Modified Date" field
      And user clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters username in the "Advanced Search" "Record last modified by" field
      And user clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  #Test2
  Scenario: Boolean based field search
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And user enters "ThiefintheNight" in the "Object Exit" "Exit Number" field
      And user enters "Jane Doe" in the "Object Exit" "Current Owner" vocab field
      And user adds "Jane Doe" to "Local Persons"
      And user clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Return of Loan" from dropdown in "Exit Reason" row
      And user enters "testtest" in the "Exit Note" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And user enters "Bestfriend" in the "Object Exit" "Exit Number" field
      And user enters "Jane Doe" in the "Object Exit" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Return of Loan" from dropdown in "Exit Reason" row
      And user enters "testtest" in the "Exit Note" field
      And the user saves the record
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And user enters "Lifestyle" in the "Object Exit" "Exit Number" field
      And user enters "Jane Doe" in the "Object Exit" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Disposal" from dropdown in "Exit Reason" row
      And user enters "testtest" in the "Exit Note" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user selects "any (OR)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Return of Loan" from dropdown in "Exit Reason" row
      And user clicks the "Search" button
    Then the search results should contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user selects "all (AND)" from boolean dropdown
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Return of Loan" from dropdown in "Exit Reason" row
      And user clicks the "Search" button
    Then the search results should not contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user selects "any (OR)" from record type dropdown
      And user enters "testtest" in the keyword search field
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Return of Loan" from dropdown in "Exit Reason" row
      And user clicks the "Search" button
    Then the search results should contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search" 
      And user selects "Object Exit" from record type dropdown
      And user selects "and (ALL)" from record type dropdown
      And user enters "testtest" in the keyword search field
      And user enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And user clicks on "Jane Doe" from autocomplete options
      And user clicks the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And user selects "Return of Loan" from dropdown in "Exit Reason" row
      And user clicks the "Search" button
    Then the search results should not contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
    Then close the browser

  #Test4
  Scenario: Structured Date Search
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And user fills in required fields for "Object Exit" record
      And user enters "Lovehoneybear" in the "Object Exit" "Exit Number" field
      And user enters "1987" in the "Object Exit" "Exit Date" "Earliest/Single Year" field
      And user enters "6" in the "Object Exit" "Exit Date" "Earliest/Single Month" field
      And user enters "5" in the "Object Exit" "Exit Date" "Earliest/Single Day" field
      And user enters "1993" in the "Object Exit" "Exit Date" "Latest Year" field
      And user enters "4" in the "Object Exit" "Exit Date" "Latest Month" field
      And user enters "19" in the "Object Exit" "Exit Date" "Latest Day" field
      And the user saves the record
    Then the record is successfully saved
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "6-5-1986" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And user enters "6-7-1994" in the "Advanced Search" "Exit Date" "Latest Date" field
      And user clicks the "Search" button
    Then the search results should contain "Lovehoneybear"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "6-5-1987" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And user enters "4-19-1993" in the "Advanced Search" "Exit Date" "Latest Date" field
      And user clicks the "Search" button
    Then the search results should contain "Lovehoneybear"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "6-6-1987" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And user enters "4-20-1994" in the "Advanced Search" "Exit Date" "Latest Date" field
      And user clicks the "Search" button
    Then the search results should contain "Lovehoneybear"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "6-3-1987" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And user enters "6-4-1987" in the "Advanced Search" "Exit Date" "Latest Date" field
      And user clicks the "Search" button
    Then the search results should not contain "Lovehoneybear"
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "4-21-1993" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And user enters "4-22-1993" in the "Advanced Search" "Exit Date" "Latest Date" field
      And user clicks the "Search" button
    Then the search results should not contain "Lovehoneybear"
    Then close the browser
