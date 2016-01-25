@supplementary_to_secondary
#Created by Forest Yang on 1/9/2016
Feature: Advanced Search - Storage Location

	#Test1
	Scenario: Advanced Search Fields
	  Given user is on the "Create New" page
	    And user selects the "Storage Location" radio button on the Create New page
	    And user enters "LanaDelRey" in the "Storage Location" "Display Name" field
	    And user enters "SadGirl" in the "Storage Location" "Name" field
	    And user clicks on the "Storage Location" "Language" field
	  Then a drop down list should appear in the "Language" row
	    And user selects "Italian" from dropdown in "Language" row
	    And user enters "Rare Jazz Collection" in the "Storage Location" "Access Note" field
	    And user enters "Your Heart" in the "Storage Location" "Address" field
	    And user enters "Sedated" in the "Storage Location" "Condition Note" field
	    And user clicks on the "Storage Location" "Term Type" field
	  Then a drop down list should appear in the "Term Type" row
	    And user selects "descriptor" from dropdown in "Term Type" row
	    And user clicks on the "Storage Location" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Rejected" from dropdown in "Term Status" row
	    And user enters "textbook" in the "Storage Location" "Security Note" field
	    And the user saves the record
	  Then the record is successfully saved
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters "LanaDelRey" in the "Advanced Search" "Display Name" field
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Name 
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters "SadGirl" in the "Advanced Search" "Name" field
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Language
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user clicks on the "Advanced Search" "Language" field
	  Then a drop down list should appear in the "Language" row
	    And user selects "Italian" from dropdown in "Language" row
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Access Note
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters "Rare Jazz Collection" in the "Advanced Search" "Access Note" field
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Address
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters "Your Heart" in the "Advanced Search" "Address" field
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Condition Note
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters "Sedated" in the "Advanced Search" "Condition Note" field
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Term Type
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user clicks on the "Advanced Search" "Term Type" field
	  Then a drop down list should appear in the "Term Type" row
	    And user selects "descriptor" from dropdown in "Term Type" row
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Term Status
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user clicks on the "Advanced Search" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Rejected" from dropdown in "Term Status" row
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Security Note
      Given user is on the "My Collectionspace" page
		And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
		And user selects "Storage Location" from record type dropdown
	    And user enters "textbook" in the "Advanced Search" "Security Note" field
		And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Modified Date
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters today's date in the "Advanced Search" "Modified Date" field
	    And user clicks the "Search" button
	  Then the search results should contain "Lana Del Rey"
	  Then close the browser

	Scenario: Search by username
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters username in the "Advanced Search" "Record last modified by" field
	    And user clicks the "Search" button
	  Then the search results should contain "Lana Del Rey"
	  Then close the browser

	Scenario: Search by partial Security Note
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user enters "textb*" in the "Advanced Search" "Security Note" field
	    And user clicks the "Search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	#Test2
	Scenario: Boolean field based search
	  Given user is on the "Create New" page
	    And selects the "Storage Location" radio button on the Create New page
	    And clicks on the Create button
	  Then the titlebar should contain "Storage Location"
	    And user enters "Top Shelf1" in the "Storage Location" "Display Name" field
	    And user clicks on the "Storage Location" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Accepted" from dropdown in "Term Status" row
	    And user enters "testtest" in the "Storage Location" "Security Note" field
	    And the user saves the record
	  Then the record is successfully saved
	  Given user is on the "Create New" page
	    And selects the "Storage Location" radio button on the Create New page
	    And clicks on the Create button
	  Then the titlebar should contain "Storage Location"
	    And user enters "Top Shelf2" in the "Storage Location" "Display Name" field
	    And user clicks on the "Storage Location" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Accepted" from dropdown in "Term Status" row
	    And user enters "testtest" in the "Storage Location" "Access Note" field
	    And the user saves the record
	  Then the record is successfully saved
	  Given user is on the "Create New" page
	    And selects the "Storage Location" radio button on the Create New page
	    And clicks on the Create button
	  Then the titlebar should contain "Storage Location"
	    And user enters "Top Shelf3" in the "Storage Location" "Display Name" field
	    And user clicks on the "Storage Location" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Rejected" from dropdown in "Term Status" row
	    And user enters "testtest" in the "Storage Location" "Condition Note" field
	    And the user saves the record
	  Then the record is successfully saved
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user selects "any (OR)" from boolean dropdown
	    And user enters "Top Shelf3" in the "Advanced Search" "Display Name" field
	    And user clicks on the "Advanced Search" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Accepted" from dropdown in "Term Status" row
	    And user clicks the "Search" button
	  Then the search results should contain "Top Shelf1"
	  Then the search results should contain "Top Shelf2"
	  Then the search results should contain "Top Shelf3"
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user selects "all (AND)" from boolean dropdown
	    And user enters "Top Shelf3" in the "Advanced Search" "Display Name" field
	    And user clicks on the "Advanced Search" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Accepted" from dropdown in "Term Status" row
	    And user clicks the "Search" button
	  Then the search results should not contain "Top Shelf3"
	  Then the search results should not contain "Top Shelf1"
	  Then the search results should not contain "Top Shelf2"
	  Then close the browser

	#Test3
	Scenario: Boolean and Keyword Search
	  Given user is on the "My Collectionspace" page
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user selects "any (OR)" from boolean dropdown
	    And user enters "testtest" in the keyword search field
	    And user enters "Top Shelf3" in the "Advanced Search" "Display Name" field
	    And user clicks on the "Advanced Search" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Accepted" from dropdown in "Term Status" row
	    And user clicks the "Search" button
	  Then the search results should contain "Top Shelf1" 
	  Then the search results should contain "Top Shelf2"
	  Then the search results should contain "Top Shelf3"
	    And user clicks on link to "Advanced Search" in upper right corner
	  Then the titlebar should contain "Advanced Search"
	    And user selects "Storage Location" from record type dropdown
	    And user selects "all (AND)" from boolean dropdown
	    And user enters "testtest" in the keyword search field
	    And user clicks on the "Advanced Search" "Term Status" field
	  Then a drop down list should appear in the "Term Status" row
	    And user selects "Accepted" from dropdown in "Term Status" row
	    And user clicks the "Search" button
	  Then the search results should contain "Top Shelf1"
	  Then the search results should contain "Top Shelf2"
	  Then the search results should not contain "Top Shelf3"
	  Then close the browser








