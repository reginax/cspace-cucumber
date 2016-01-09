# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­ Condition Check
	# Enter feature description here

	Scenario: Advanced Search Fields
		Given the user is in the "Create New" page
        # And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA-73.1" in the "Condition Check/Assessment Reference Number" field 
        And user selects "Low" from the "Object Audit Category" drop down box        
        And user selects "Needs no work" from the "Condition" drop down box        
        And user selects "Low" from the "Conservation Treatment Priority" drop down box        
        And user enters "2016-01-01" in the "Next Condition Check/Assessment Date" field 
        And user enters "2016-02-02" in the "Condition Check/Assessment Date" field 
        And user enters "textbook" in the "Condition Check/Assessment Date" field
        And the user saves the record

        And clicks the "Advanced Search" Button
        # Select Condition Check from the record type drop down
        # Enter what you previously entered in Object Audit Category field in the advanced search record
        And clicks the "search" button
        # The Condition Check record you just created should appear in the search results

        # Do the same for these:
			# Condition Check/Assessment Reference Number 
			# Object Audit Category
			# Condition
			# Conservation Treatment Priority
			# Next Condition Check/Assessment Date
			# Condition Check/Assessment Date
			# Cond Check/Assess Note
	    # The Condition Check record you created should appear int he search results

	    # Search Edit Date for today's date
	    # The Condition Check record you created should appear in the search results

	    # Search edit username field for the username you logged in with
	    # Condition Check record you just created should appear in the search results
	    Then close the browser

	Scenario: Boolean field­-based search
        Given the user is in the "Create New" page
        # And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA-73.2" in the "Condition Check/Assessment Reference Number" field
        And user selects "Low" from the "Object Audit Category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And user enters "testtest" in the "Condition Check/Assessment Note" field
        And the user saves the record


        # And user goes to the "Create New" page # Stepdef
 		# And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA-73.3" in the "Condition Check/Assessment Reference Number" field
        And user selects "Low" from the "Object Audit Category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And user enters "testtest" in the "Display Recommendations" field
        And the user saves the record        
      
        # And user goes to the "Create New" page # Stepdef
 		# And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA-73.4" in the "Condition Check/Assessment Reference Number" field
        And user selects "Low" from the "Object Audit Category" drop down box
        And user selects "In jeopardy" from the "Condition" drop down box
        And user enters "testtest" in the "Handling Recommendations" field
        And the user saves the record     


       	And clicks the "Advanced Search" Button
        # Select Condition Check from the record type drop down
        # Select OR/Any from the boolean drop down menu
        # Select low from the obj audit category drop down
        # Select "Needs no work" from the "Object Audit Category" dropdown
        And clicks the "search" button
        # Then All three (71.2,.3,.4) should appear in search results
        Then "CQA-73.2" should be in the search results
        Then "CQA-73.3" should be in the search results
        Then "CQA-73.4" should be in the search results

        And clicks the "Advanced Search" Button
        # Select Condition Check from the record type drop down
        # Select all/AND from the boolean drop down menu
        # Select "Low" from the "Object Audit Category" drop down
        # Select "Needs no work" from the "Object Audit Category" dropdown
        And clicks the "search" button
        # Then only first two should appear in search results
        Then "CQA-73.2" should be in the search results
        Then "CQA-73.3" should be in the search results
        Then close the browser


	Scenario: Boolean and Keyword Search
        Given the user is in the "My CollectionSpace" page
		And clicks the "Advanced Search" Button
		# In the keyword search field enter "testtest"
		# Select Condition Check from the record type drop down 
        # Select OR/Any from the boolean drop down menu	
        # Select "Low" from the "Object Audit Category" drop down
        # Select "Needs no work" from the "Object Audit Category" dropdown
        And clicks the "search" button
        # Then All three (71.2,.3,.4) should appear in search results
        Then "CQA-73.2" should be in the search results
        Then "CQA-73.3" should be in the search results
        Then "CQA-73.4" should be in the search results        

		And clicks the "Advanced Search" Button
		# In the keyword search field enter "testtest"		
		# Select Condition Check from the record type drop down 
		# Select all/AND from boolean drop down menu
        # Select "Low" from the "Object Audit Category" drop down
        # Select "Needs no work" from the "Object Audit Category" dropdown
        And clicks the "search" button
        # Then only first two should appear in search results
        Then "CQA-73.2" should be in the search results
        Then "CQA-73.3" should be in the search results
        Then close the browser


## DELETE THEM!