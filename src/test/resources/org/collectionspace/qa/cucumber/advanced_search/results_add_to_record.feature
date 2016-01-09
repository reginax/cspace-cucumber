# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search results Add to Record
    # Enter feature description here

    Scenario: Relate cataloging records to an existing Group record.
        Given the user is in the "Create New" page
        And user selects the "Group" radio button on the Create New page
        And user enters "CQA-86 Group" in the "Title" field
        And the user saves the record
        And clicks the "Advanced Search Button"
        And user enters "CQA110" in the in the search field #stepDef
        Then the results should contain "CQA86.1"
        Then the results should contain "CQA86.2"
        Then the results should contain "CQA86.3"

        And clicks the "Add to Record" button
        #Change the search existing dropdown to group and enter a search term that matches your newly created group 
        #Click the checkbox next o the group record return by the search
        And clicks the "Add Search Results" button 
        #Then a message is displayed at the bottom of the page saying "added number..."

    Scenario: View procedure record to see related records
        #Using seach or advanced search search for "CQA-86 Group"
        #Select the record by clicking on it
        #Then the record for your group should be displayed
        #Then a set of related recods are visible within the cataloging section of the right sidebar matering the catalogging records added in test 1


    Scenario: Keyboard accessibility:
        #From an advanced search results page, use the keyboard only to navi to and activeate the add to record button
        #Then at all times it should be possible to see which field has focus
        #Then the drop down, items in the drop down, auths, and textfields should all work as expected

