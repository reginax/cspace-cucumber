# Created by Cesar Villalobos on 12/04/2015

@advancedsearch
Feature: Advanced Search Results Add to Record
  # Enter feature description here

  Scenario: User creates a new group and adds related catalog records to it
  		Given user is on the "Create New" page
  		And selects the "Group" radio button on the Create New page
		And clicks on the "Create" button
		And enters "groupCQA86" in the "Identification Number" field
		And the user saves the record
		And clicks on the "Advanced search" button
		And enters "CQA" in the "query" field
		And clicks on the "Search" button

		Then the results should contain "120415.2"
		Then the results should contain "120415.1"

		And clicks on the "Add to record" button
		And selects "Group" in the dropdown menu
		And enters "groupCQA86" in the "search" field
		And clicks on the "Search" button
		# And clicks the check box next o the group record returned by the search #needs stepdef
		Then the message "Added 2 records to groupCQA86" should be displayed
		Then close the browser
		# remember to delete groupCQA86

  Scenario: User searches for related group records
  	Given user is on the "My CollectionSpace" page
	And user enters "groupCQA86" in the top nav search field
	And clicks on the top nav search submit button
	And the user clicks on result with text "2groupCQA86"

	Then "120415.1" should appear in the Cataloging sidebar #needs stepdef
	Then "120415.2" should appear in the Cataloging sidebar #needs stepdef

    And user selects the "Cataloging" tab 
    Then "120415.1" should appear in the "Related Cataloging Records"
    Then "120415.2" should appear in the "Related Cataloging Records"
	# And Remove "120415.2" from the list by clicking the green 'X' to the right of its name
	Then "120415.2" should not appear in the "Related Cataloging Records"

	And clicks on the "Advanced search" button
	And enters "CQA" in the "query" field
	And clicks on the "Search" button
	And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
    And the user presses the "Enter" key #needs Stepdef
    Then a pop up with the title "Add Search Results to Record" should appear

    And user goes to the record with Identification Number "groupCQA86" # needs step def
	And the user clicks the delete button
    Then a delete confirmation dialogue should appear #needs Stepdef
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then close the browser






