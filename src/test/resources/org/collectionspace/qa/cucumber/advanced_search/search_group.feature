# Created by Cesar Villalobos on 01/07/2016
# CQA-75 

@advancedsearch
Feature: Advanced Search Group
    Searching for a recently made group

    Scenario
        Given the user is in the "Create New" page
        And user selects the "Group" radio button on the Create New page
        And user enters "textbook" in the "Title" field
        And user enters "CQA-75" in the "Group Owner" field
        And user selects "CQA-75" from autocomplete options
        And the user saves the record

        And clicks the "Advanced Search" button
        And user selects "Group" from the "Record Type Select" drop down box        
        And user enters "textbook" in the "Title" field
        And clicks the "search" button
        Then the search results should contain "textbook"

        And clicks the "Advanced Search" button
        And user selects "Group" from the "Record Type Select" drop down box        
        And user enters "CQA-75" in the "Owner" field
        And user selects "CQA-75" from autocomplete field
        And clicks the "search" button
        Then the search results should contain "CQA-75"

        And clicks the "Advanced Search" button
        And user selects "Group" from the "Record Type Select" drop down box        
        And user enters "textb*" in the "Title" field
        And clicks the "search" button
        Then the search results should contain "CQA-75"


        Then close the browser

        # Delete the record 