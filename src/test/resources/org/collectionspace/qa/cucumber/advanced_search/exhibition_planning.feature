# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­– Exhibition Planning
        Searching for records based on certain criteria on the advanced search page

    Scenario: Advanced Search Fields
        Given the user is in the "Create New" page
        # And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA74.1" in the "Exhibition Number" field 
        And user enters "CQA74 Test" in the "Exhibition Title" field 
        And user selects "Permanent" from the "Exhibition Type" drop down box  
        And user enters "CQA74 Venue" in the "Venue" field 
        And user selects "CQA74 Venue" from autocomplete options
        And user enters "2016-01-01" in the "Venue Opening Date" field 
        And user enters "textbook" in the "Planning Notes" field 
        And the user saves the record

        # Record Title
        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user enters "CQA74 Test" in the "Exhibition Title" field
        And clicks the "search" button
        Then the search results should contain "CQA74.1"

        # Record ID number
        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user enters "CQA74.1" in the "Exhibition Number" field
        And clicks the "search" button
        Then the search results should contain "CQA74.1"

        # Exhibition Type
        And clicks the "Exhibition Type"
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user selects "Permanent" from the "Exhibition Type" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA74.1"

        # Venue
        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user enters "CQA74 Venue" in the "Venues" field 
        And user selects "CQA74 Venue" from autocomplete options
        And clicks the "search" button
        Then the search results should contain "CQA74.1"

        # Venue
        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user enters "2016-01-01" in the "Earliest Opening Date" field 
        And clicks the "search" button
        Then the search results should contain "CQA74.1"

        #Earliest Modified
        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down
        And user enters today's date in the "Earliest Modified Date" field
        And clicks the "search" button
        Then the search results should contain "CQA74.1"

        #Earliest Modified
        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down
        And user enters "admin@Collectionspace.org" in the "Record last modified by" date
        And clicks the "search" button
        Then the search results should contain "CQA74.1"

        Then close the browser

    Scenario: Boolean field­-based search
        Given the user is in the "Create New" page
        And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA74.2" in the "Exhibition Number" field
        And user selects "Permanent" from the "Exhibition Type" drop down box
        And user enters "Globex Corporation" in the "Sponsor" field
        And user selects "Globex Corporation" from autocomplete options
        And user enters "testtest" in the "Boilerplate Text" field
        And the user saves the record

        And user goes to the "Create New" page # Stepdef
        And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA74.3" in the "Exhibition Number" field
        And user selects "Permanent" from the "Exhibition Type" drop down box  
        And user enters "Globex Corporation" in the "Sponsor" field 
        And user selects "Globex Corporation" from autocomplete options
        And user enters "testtest" in the "Planning Notes" field 
        And the user saves the record

        And user goes to the "Create New" page # Stepdef
        And user selects the "Exhibition" radio button on the Create New page
        And user enters "CQA74.4" in the "Exhibition Number" field
        And user selects "Permanent" from the "Exhibition Type" drop down box  
        And user enters "Osato Chemicals" in the "Sponsor" field 
        And user selects "Osato Chemicals" from autocomplete options
        And user enters "testtest" in the "Curatorial Notes" field 
        And the user saves the record


        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user enters "Globex Corporation" in the "Sponsor" field 
        And user selects "Globex Corporation" from autocomplete options
        And user selects "Permanent" from the "Exhibition Type" drop down box  
        And clicks the "search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"
        Then the search results should contain "CQA74.4"


        And clicks the "Advanced Search Button"
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user selects "Permanent" from the "Exhibition Type" drop down box          
        And user enters "Globex Corporation" in the "Sponsor" field 
        And user selects "Globex Corporation" from autocomplete options        
        And clicks the "search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"        
        Then the search results should not contain "CQA74.4"

        Then close the browser


    Scenario: Boolean and Keyword Search
        Given the user is in the "My CollectionSpace" page
        And clicks the "Advanced Search" button
        And user enters "testtest" in the "Keyword Search" field
        And user selects "Exhibition" from the "Record Type Select" drop down box
        And user enters "Globex Corporation" in the "Sponsor" field 
        And user selects "Globex Corporation" from autocomplete options            
        And clicks the "search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"
        Then the search results should contain "CQA74.4"

        And clicks the "Advanced Search" button
        And user enters "testtest" in the "Keyword Search" field
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user enters "Globex Corporation" in the "Sponsor" field 
        And user selects "Globex Corporation" from autocomplete options
        And clicks the "search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"        
        Then the search results should not contain "CQA74.4"

        And user goes to the record with identification number "CQA74.1"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA74.2"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA74.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA74.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue        
        Then close the browser

# Dont forget to delete the record