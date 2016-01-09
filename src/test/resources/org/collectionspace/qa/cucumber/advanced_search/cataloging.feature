# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­Cataloging

	Scenario: Advanced Search Fields
		Given the user is in the "Create New" page
        # And user selects the "Cataloging" radio button on the Create New page
        And user enters "CQA-72.1" in the "Identification Number" field 
        And user enters "" in the "Object Name" field
        And user selects "Antiquities" from the "Responsible Department" drop down box
        And user selects "Study Collection" from the "Collection" drop down box
        And user enters "CQA-72 Test 1" in the "Title" field
        And user selects "New" from the "Record Status" drop down box
        And user enters "72.1.1" in the "Copy Number" field
        And user enters "72.1.2" in the "Edition Number" field
        And user selects "dry" from the "Form" drop down box
        And user enters "Cesar Villalobos" in the "Inscriber" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Drawings" in the "Inscription Method" field # Might not work bc not explicitly named "Inscription Method" but rather just #method
    	And user enters "Polyester" in the "Material" field
	    And user selects "forgery" from the "Object Status" drop down box
    	And user selects "larva" from the "Phase" drop down box
	    And user selects "female" from the "Sex" drop down box
	    And user enters "French" in the "Style" field
	    And user selects "record speed" from the "Technical Attribute" drop down box
	    And user selects "handle" from the "Object Component Name" drop down box
    	And user enters "2016-01-01" in the "Production Date" field
    	And user enters "Water Tribe" in the "Production organization" field
    	And user selects "Water Tribe" from autocomplete options
	    And user enters "Southern Water Tribe" in the "Production people" field
	    And user enters "Cesar Villalobos" in the "Production person" field
	    And user selects "Cesar Villalobos" from autocomplete options
    	And user enters "Mexico" in the "Production place" field
	    And user enters "Hydration" in the "Technique" field
	    And user enters "textbook" int he "Field collection event name" field
	    And the user saves the record

        And clicks the "Advanced Search" Button
        # Select catalogging from the record type drop down
        # Enter what you previously entered in Object Number field in the advanced search record
        And clicks the "search" button
        Then "CQA-72.1" should be in the search results

        # Do the same for all the fields sighhhhhhhhgdfhhdfhsdfhgshfd
	    # The cataloging record you created should appear int he search results for each

	    # Search Modified Date for today's date
        And clicks the "search" button	    
	    # The cataloging record you created should appear in the search results

	    # Search edit username field for the username you logged in with
        And clicks the "search" button	    
	    # cataloging record you just created should appear in the search results

	    And clicks the "Advanced Search" Button
        # Select catalogging from the record type drop down
        # Enter "textb*" into the "Field collection event name" search field
        And clicks the "search" button
        # Then the cat regord you just created should appear in the search results
	    Then close the browser


	Scenario: Boolean field-­based search
	

	Scenario: Boolean and Keyword Search
	
