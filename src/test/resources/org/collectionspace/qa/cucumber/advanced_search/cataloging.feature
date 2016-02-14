# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­Cataloging

    Scenario: Advanced Search Fields
        Given the user is in the "Create New" page
        And user selects the "Cataloging" radio button on the Create New page
        And user enters "CQA72.1" in the "Identification Number" field 
        And user enters "Nameless Object" in the "Object Name" field
        And user selects "Antiquities" from the "Responsible Department" drop down box
        And user selects "Study Collection" from the "Collection" drop down box
        And user enters "CQA72 Test 1" in the "Title" field
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
        And user enters "textbook" in the "Field collection event name" field
        And the user saves the record

        # Identification Number 
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "CQA72.1" in the "Identification Number" field 
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Object Name
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Nameless Object" in the "Object Name" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1" 
    
        # Responsible Department 
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "Antiquities" from the "Responsible Department" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Collection
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "Study Collection" from the "Collection" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Title
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "CQA72 Test 1" in the "Title" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Record Status
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "New" from the "Record Status" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Copy Number
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "72.1.1" in the "Copy Number" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Edition Number
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "72.1.2" in the "Edition Number" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Form
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "dry" from the "Form" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Inscriber (Non­Textual Inscription)
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Cesar Villalobos" in the "Inscriber" field
        And user selects "Cesar Villalobos" from autocomplete options
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Inscription Method (Non­Textual Inscription) 
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Drawings" in the "Inscription Method" field # Might not work bc not explicitly named "Inscription Method" but rather just #method
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Material
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Polyester" in the "Material" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Object Status
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "forgery" from the "Object Status" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Phase
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "larva" from the "Phase" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Sex
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "female" from the "Sex" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Style
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "French" in the "Style" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Technical Attribute
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "record speed" from the "Technical Attribute" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        # Object Component Name
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "handle" from the "Object Component Name" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        # Production Date
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "2016-01-01" in the "Production Date" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        # Production Organization
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Water Tribe" in the "Production organization" field
        And user selects "Water Tribe" from autocomplete options
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        # Production People
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Southern Water Tribe" in the "Production people" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        # Production Person
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Cesar Villalobos" in the "Production person" field
        And user selects "Cesar Villalobos" from autocomplete options
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        # Production Place
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Mexico" in the "Production place" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        # Production Technique
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "Hydration" in the "Technique" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        # Last edited
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters today's date in the "Earliest Modified Date" field
        And clicks the "search" button
        Then the search results should contain "CQA72.1"

        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "admin@Collectionspace.org" in the "Record last modified by" date
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
    
        #wildcard
        And clicks the "Advanced Search" Button
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user enters "textb*" in the "Field collection event name" date
        And clicks the "search" button
        Then the search results should contain "CQA72.1"
        Then close the browser


    Scenario: Boolean field-­based search

        Given the user is in the "Create New" page
        And user selects the "Cataloging" radio button on the Create New page
        And user enters "CQA72.2" in the "Cataloging/Assessment Reference Number" field
        And user selects "Study Collection" from the "Collection" drop down box
        And user selects "New" from the "Record Status" drop down box
        And user enters "testtest" in the "Brief Description" field
        And the user saves the record

        And user goes to the "Create New" page # Stepdef
        And user selects the "Cataloging" radio button on the Create New page
        And user enters "CQA72.3" in the "Cataloging/Assessment Reference Number" field
        And user selects "Study Collection" from the "Collection" drop down box
        And user selects "New" from the "Record Status" drop down box
        And user enters "testtest" in the "Distinguishing Features" field
        And the user saves the record     
    
        And user goes to the "Create New" page # Stepdef
        And user selects the "Cataloging" radio button on the Create New page
        And user enters "CQA72.4" in the "Cataloging/Assessment Reference Number" field
        And user selects "Study Collection" from the "Collection" drop down box
        And user selects "Temporary" from the "Record Status" drop down box
        And user enters "testtest" in the "Comments" field
        And the user saves the record  


        And clicks the "Advanced Search Button"
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "any (OR)" from the "Field-based Search" drop down box
        And user selects "Study Collection" from the "Collection" drop down box
        And user selects "New" from the "Record Status" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"        
        Then the search results should contain "CQA72.4"

        And clicks the "Advanced Search Button"
        And user selects "Cataloging" from the "Record Type Select" drop down box
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user selects "Study Collection" from the "Collection" drop down box
        And user selects "New" from the "Record Status" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"        
        Then the search results should not contain "CQA72.4"
        Then close the browser


    Scenario: Boolean and Keyword Search
        Given the user is in the "My CollectionSpace" page
        And clicks the "Advanced Search" button
        And user enters "testtest" in the "Keyword Search" field
        And user selects "any (OR)" from the "Field-based Search" drop down box
        And user selects "Study Collection" from the "Collection" drop down box
        And user selects "New" from the "Record Status" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"
        Then the search results should contain "CQA72.4"

        And clicks the "Advanced Search" button
        And user enters "testtest" in the "Keyword Search" field
        And user selects "all (AND)" from the "Field-based Search" drop down box
        And user selects "Study Collection" from the "Collection" drop down box
        And user selects "New" from the "Record Status" drop down box
        And clicks the "search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"
        Then the search results should not contain "CQA72.4"


        And user goes to the record with identification number "CQA72.1"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA72.2"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA72.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        And user goes to the record with identification number "CQA72.3"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue        
        Then close the browser

