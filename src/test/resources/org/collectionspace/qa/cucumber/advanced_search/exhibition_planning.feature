# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­– Exhibition Planning
	# Enter feature description here

	Scenario: Advanced Search Fields
        Given the user is in the "Create New" page
        # And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA-74.1" in the "Exhibition Number" field 
        And user enters "CQA-74 Test" in the "Exhibition Title" field 
        And user selects "Permanent" from the "Exhibition Type" drop down box  
        And user enters "CQA-74 Venue" in the "Venue" field 
        And user selects "CQA-74 Venue" from autocomplete options
        And user enters "2016-01-01" in the "Venue Opening Date" field 
        And user enters "textbook" in the "Planning Notes" field 
        And the user saves the record

        And clicks the "Advanced Search Button"
        # Select Exhibition from the record type drop down
        # Enter what you previously entered in Exhibition Title field in the advanced search record
        And clicks the "search" button
        # The Exhibition record you just created should appear in the search results

        # Do the same for these:
	        #Exhibition Number
	        #Exhibition Type
	        #Exhibition Venue
	        #Exhibition Venue opening d8
	        #Planning Notes field

	    # Search Earliest Modified Date field for today's date
	    # The Exhibition record you created should appear int he search results

	    # Search edit username field for the username you logged in with
	    # Exhibition record you just created should appear in the search results
	    Then close the browser

	Scenario: Boolean field­-based search
        Given the user is in the "Create New" page
        # And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA-74.2" in the "Exhibition Number" field
        And user selects "Permanent" from the "Exhibition Type" drop down box
        And user enters "Globex Corporation" in the "Sponsor" field
        And user selects "Globex Corporation" from autocomplete options
        And user enters "testtest" in the "Boilerplate Text" field
        And the user saves the record

        # And user goes to the "Create New" page # Stepdef
        # And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA-74.3" in the "Exhibition Number" field
        And user selects "Permanent" from the "Exhibition Type" drop down box  
        And user enters "Globex Corporation" in the "Sponsor" field 
        And user selects "Globex Corporation" from autocomplete options
        And user enters "testtest" in the "Planning Notes" field 
        And the user saves the record

        # And user goes to the "Create New" page # Stepdef
        # And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA-74.4" in the "Exhibition Number" field
        And user selects "Permanent" from the "Exhibition Type" drop down box  
        And user enters "Osato Chemicals" in the "Sponsor" field 
        And user selects "Osato Chemicals" from autocomplete options
        And user enters "testtest" in the "Curatorial Notes" field 
        And the user saves the record

		And clicks the "Advanced Search Button"
        # Select Exhibition from the record type drop down
        # Select OR/Any from the boolean drop down menu
        # Select "Permanent" from the Exhibition type dropdown
        # Enter Globex Corporation in the sponsor field
        And clicks the "search" button
        # All three (74.2,.3,.4) should appear in search results

		And clicks the "Advanced Search Button"
 		# Select Exhibition from the record type drop down
        # Select AND/all from the boolean drop down menu
        # Select "Permanent" from the Exhibition type dropdown
        # Enter Globex Corporation in the sponsor field
        # Then only 74.2 and .3 should be there
        Then close the browser


	Scenario: Boolean and Keyword Search
        Given the user is in the "My CollectionSpace" page
		And clicks the "Advanced Search Button"
		# In the keyword search field type "testtest"
		# Select Exhibition from the recordf type drop down 
		# Select any/OR from boolean drop down menu
		# Enter the vocab term "Globex Corporation" to the sponsor field
        And clicks the "search" button
		# All three records should show up
		And clicks the "Advanced Search Button"
        # All three (74.2,.3,.4) should appear in search results

		# In the keyword search field type "testtest"
		# Select Exhibition from the recordf type drop down 
		# Select all/AND from boolean drop down menu
		# Enter the vocab term "Globex Corporation" to the sponsor field
        And clicks the "search" button
        # Then only 74.2/.3 will show up
        Then close the browser

# Dont forget to delete the record