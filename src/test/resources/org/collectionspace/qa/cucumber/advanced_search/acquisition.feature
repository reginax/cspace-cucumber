# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­ Acquisition
    Searching for a record based on boolean-search as well as regular search terms

	Scenario: Advanced Search Fields and wildcard
	Given the user is in the "Create New" page
        # And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA71.1" in the "Acquisition Reference Number" field 
        And user enters "2016-01-01" in the "Accession date" field
        And user enters "2016-02-02" in the "Acquisition date" field 
        And user selects "Gift" from the "Acquisition Method" drop down box  
        And user enters "CQA-71 Acquisition Source" in the "Acquisition Source" field 
        And user selects "CQA-71 Acquisition Source" from autocomplete options
        And user enters "CQA-71 Funding source" in the "Funding source" field 
        And user selects "CQA-71 Funding source" from autocomplete options
        And user enters "CQA-71 Test" in the "Field collection event name" field 
        And user enters "textbook" in the "Credit Line" field 
        And the user saves the record

        # Record Title
        And clicks the "Advanced Search" button 
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user enters "CQA71.1" in the "Acquisition Reference Number" field
        And clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Accession Date
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user enters "2016-01-01" in the "Accession date" field
        And user clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Acquisition Date
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user enters "2016-02-02" in the "Acquisition date" field
        And user clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Acquisition Method
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user selects "Gift" from the "Acquisition Method" drop down box
        And user clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Acquisition Method
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user enters "CQA-71 Acquisition Source" in the "Acquisition Source" field
        And user selects "CQA-71 Acquisition Source" from autocomplete options        
        And user clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Acquisition Funding
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user enters "CQA-71 Funding source" in the "Funding Source" field
        And user selects "CQA-71 Funding source" from autocomplete options        
        And user clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Field Collection event name
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user enters "CQA-71 Test" in the "Field collection event name" field 
        And user clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Todays Date
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down
        And user enters today's date in the "Earliest Modified Date" field
        And clicks the "search" button
        Then the search results should contain "CQA71.1"

        #Admin 
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down
        And user enters "admin@Collectionspace.org" in the "Record last modified by" date
        And clicks the "search" button
        Then the search results should contain "CQA71.1"
        Then close the browser



	Scenario: Boolean field­-based search
        Given the user is in the "Create New" page
        # And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA71.2" in the "Acquisition Reference Number" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        And user enters "testtest" in the "Acquisition Reason" field
        And user enters "thank you" in the "Credit Line" field        
        And the user saves the record

        And user goes to the "Create New" page # Stepdef
        And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA71.3" in the "Acquisition Reference Number" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        And user enters "testtest" in the "Acquisition Note" field
        And user enters "thank you" in the "Credit Line" field
        And the user saves the record

        And user goes to the "Create New" page # Stepdef
        And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA71.4" in the "Acquisition Reference Number" field
        And user selects "Gift" from the "Acquisition Method" drop down box  
        And user enters "testtest" in the "Acquisition Provisos" field
        And user enters "thank you" in the "Credit Line" field
        And the user saves the record

		And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user selects "any (OR)" from the "Field-based Search" drop down box
        And user enters "thank you" in the "Credit Line" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        And clicks the "search" button
        Then the search results should contain "71.2"
        Then the search results should contain "71.3"        
        Then the search results should contain "71.4"

		And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user enters "thank you" in the "Credit Line" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        Then the search results should contain "71.2"
        Then the search results should contain "71.3"        
        Then the search results should not contain "71.4"

        Then close the browser


	Scenario: Boolean and Keyword Search
        Given the user is in the "My CollectionSpace" page
		And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user selects "any (OR)" from the "Field-based Search" drop down box
        And user enters "thank you" in the "Credit Line" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        And clicks the "search" button
        Then the search results should contain "71.2"
        Then the search results should contain "71.3"        
        Then the search results should contain "71.4"
        
        And clicks the "search" button
        And clicks the "Advanced Search" button
        And user selects "Acquisition" from the "Record Type Select" drop down box
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user enters "thank you" in the "Credit Line" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        Then the search results should contain "71.2"
        Then the search results should contain "71.3"        
        Then the search results should not contain "71.4"


        And user goes to the record with identification number "71.1"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "71.2"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "71.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "71.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue        
        Then close the browser


        Then close the browser

# Delete 71.1-.4!!!!!!
	
