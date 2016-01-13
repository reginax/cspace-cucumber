# Created by Cesar Villalobos on 01/07/2016
# CQA-75 

@advancedsearch
Feature: Advanced Search Group
# Enter feature description here

    Scenario
        Given the user is in the "Create New" page
        And user selects the "Group" radio button on the Create New page
        And user enters "textbook" in the "Title" field
        And user enters "CQA-75" in the "Group Owner" field
        And user selects "CQA-75" from autocomplete options
        And the user saves the record
        And clicks the "Advanced Search Button"
        # Select group from the record type drop down
        # Enter what you previously entered in Group Title field in the advanced search record
        And clicks the "search" button

        # Then the Group record you just created should appear in the search results

        #Do this for the Owner field
        # Then the record i created should appear in the search field

        # And user goes back to the advanced search page
        # And selects Group from the record type drop down
        #And enters "textb*" in the _Group Title search field
        And clicks the "search" button

        # Thent he group record i just created should appear in the search results        

        Then close the browser
