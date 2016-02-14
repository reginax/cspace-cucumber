# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­ Condition Check
	# Enter feature description here

	Scenario: Advanced Search Fields
		Given the user is in the "Create New" page
        And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA73.1" in the "Condition Check/Assessment Reference Number" field 
        And user selects "Low" from the "Object Audit Category" drop down box        
        And user selects "Needs no work" from the "Condition" drop down box        
        And user selects "Low" from the "Conservation Treatment Priority" drop down box        
        And user enters "2016-01-01" in the "Next Condition Check/Assessment Date" field 
        And user enters "2016-02-02" in the "Condition Check/Assessment Date" field 
        And user enters "textbook" in the "Condition Check/Assessment Date" field
        And the user saves the record

        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user enters "CQA73" in the "Condition Check/Assessment Reference Number" field
        And clicks the "search" button
        Then the search results should contain "CQA73.1"

			# Object Audit Category
        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user selects "Low" from the "Object Audit Category" drop down box    
        And clicks the "search" button    
        Then the search results should contain "CQA73.1"

			# Condition
        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user selects "Needs no work" from the "Condition" drop down box        
        And clicks the "search" button
        Then the search results should contain "CQA73.1"

		# Conservation Treatment Priority
        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user selects "Low" from the "Object Audit Category" drop down box    
        And clicks the "search" button
        Then the search results should contain "CQA73.1"

		# Next Condition Check/Assessment Date
        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user enters "2016-01-01" in the "Next Condition Check/Assessment Date" field
        And clicks the "search" button 
        Then the search results should contain "CQA73.1"

			# Condition Check/Assessment Date
        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user enters "2016-02-02" in the "Condition Check/Assessment Date" field 
        And clicks the "search" button
        Then the search results should contain "CQA73.1"

			# Last edited
        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user enters today's date in the "Earliest Modified Date" field
        And clicks the "search" button
        Then the search results should contain "CQA73.1"

        And clicks the "Advanced Search" Button
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user enters "admin@Collectionspace.org" in the "Record last modified by" date
        And clicks the "search" button
        Then the search results should contain "CQA73.1"

	    Then close the browser

	Scenario: Boolean field­-based search
        Given the user is in the "Create New" page
        And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA73.2" in the "Condition Check/Assessment Reference Number" field
        And user selects "Low" from the "Object Audit Category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And user enters "testtest" in the "Condition Check/Assessment Note" field
        And the user saves the record


        And user goes to the "Create New" page # Stepdef
 		And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA73.3" in the "Condition Check/Assessment Reference Number" field
        And user selects "Low" from the "Object Audit Category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And user enters "testtest" in the "Display Recommendations" field
        And the user saves the record        
      
        And user goes to the "Create New" page # Stepdef
 		And user selects the "Condition Check" radio button on the Create New page
        And user enters "CQA73.4" in the "Condition Check/Assessment Reference Number" field
        And user selects "Low" from the "Object Audit Category" drop down box
        And user selects "In jeopardy" from the "Condition" drop down box
        And user enters "testtest" in the "Handling Recommendations" field
        And the user saves the record     

        And clicks the "Advanced Search Button"
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user selects "any (OR)" from the "Field-based Search" drop down box
        And user selects "Low" from the "Object audit category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"        
        Then the search results should contain "CQA73.4"

        And clicks the "Advanced Search Button"
        And user selects "Condition Check" from the "Record Type Select" drop down box
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user selects "Low" from the "Object audit category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"        
        Then the search results should not contain "CQA73.4"
        Then close the browser

	Scenario: Boolean and Keyword Search
        Given the user is in the "My CollectionSpace" page
        And clicks the "Advanced Search" button
        And user enters "testtest" in the "Keyword Search" field
        And user selects "any (OR)" from the "Field-based Search" drop down box
        And user selects "Low" from the "Object audit category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"
        Then the search results should contain "CQA73.4"

        And clicks the "Advanced Search" button
        And user enters "testtest" in the "Keyword Search" field
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user selects "Low" from the "Object audit category" drop down box
        And user selects "Needs no work" from the "Condition" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"
        Then the search results should not contain "CQA73.4"

        And user goes to the record with identification number "CQA73.1"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA73.2"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA73.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA73.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue        
        Then close the browser


        Then close the browser


## DELETE THEM!