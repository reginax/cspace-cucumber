@advanced_search
#Created by forest yang on 1/5/2016
Feature: Advanced_Search - Extras
  
  #Prerequisite
  Scenario: set up record
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And user enters "Remember me 1234" in the "Object Exit" "Exit Number" field
      And user enters "James Adams" in the "Object Exit" "Depositor" vocab field
      And user clicks on "James Adams" from autocomplete options
      And user enters "Goodbye" in the "Object Exit" "Exit Note" field
      And the user saves the record
    The the record is saved successfully
    Then close the browser

  #Test1
  Scenario: Recent Searches
    Given user is on the "My Collectionspace" page
      And user clicks on link to "Advanced Search" in upper right corner
    Then the titlebar should contain "Advanced Search"
      And user selects "Object Exit" from record type dropdown
      And user enters "Goodbye" in the keyword search field
      And user clicks the "Search" button
    Then the search results should contain "Remember me 1234"
      And user clicks the "Edit existing advanced search" button
    Then the titlebar should contain "Advanced Search"
      And user selects "all (AND)" from boolean dropdown
      And user enters "remember me 1234" in the "Advanced Search" "Exit Number" field
      And user enters "James Blish" in the "Advanced Search" "Depositor" vocab field
      And user clicks on "James Blish" from autocomplete options
      And user clicks the "Search" button
    Then the search results should not contain "Remember me 1234"
      And user clicks on the "Recent searches" entry containing "{"initialState":false, "keywords":"goodbye""
    Then the search results should contain "Remember me 1234"
      And user clicks the "Edit existing advanced search" button
    Then the titlebar should contain "Advanced Search"
    Then "Goodbye" should be in the keyword search field
      And user clicks on the "Recent searches" entry containing "{"initialState":false, "keywords":"""
    Then the search results should not contain "Remember me 1234"
      And user clicks the "Edit existing advanced search" button
    Then the titlebar should contain "Advanced Search"
  #the wiki says goodbye should be in the keyword search field.. but according to the instructions. second search didn't put anything in keyword search field.
    #Then "Goodbye" should be in the keyword search field 
    Then "remember me 1234" should be in the "Advanced Search" "Exit Number" field
    Then "James Blish" should be in the "Advanced Search" "Depositor" vocab field
    Then close the browser
