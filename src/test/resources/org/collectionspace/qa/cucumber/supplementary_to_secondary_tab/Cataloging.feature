# Created by jbe at 10/27/15 
@supplementary
Feature: Supplementary Manual QA - Cataloging Secondary Tab

  Scenario Outline: User Observes Basic Cataloging
    Given user is on the "My CollectionSpace" page
    //And clicks any record
    //And clicks any Secondary Tab
    //Then related records should be listed in a table
    //Given there are no records
    //Then a "No related record selected" message should be displayed
    //When I click the "+ Add Record" button 
    //And click the "Create" button
    //Then an empty form should be displayed under the listing of related records
    //Then above the form, the words "Creating new record..." should appear
    Then the top and bottom "Cancel" buttons are disabled
    Then the top and bottom "Delete" buttons are disabled
    Then a drop down list should appear in the "Identification Number" row
    Then user selects "Intake" from dropdown in "Select Number Pattern" row
    *Then the top and bottom "Cancel" buttons are enabled
    //In a vocabulary field, either add an existing vocabulary term or create a new term
    //Make sure all required fields are filled out
    And user saves the record
    //And the titlebar should not contain "Creating new record..."
    //entry for the new record should appear under the related records header
    //Select the record you just created
    Then the top and bottom "Cancel" buttons are disabled
    *Then the top and bottom "Delete" buttons are enabled
    *And user enters "" in the top nav search fields
        //Search for the record you just created via the Search box.
    //Click its link.
    //Verify that you can see a (newly) related, second record in the right sidebar.
    //Click its link, to pivot to that second record.
    //Verify that the first record's link appears in the right sidebar.
    //Click its link, to pivot back to the first record.

  Scenario Outline: User Searches to Relate Dialog
    //Given user in a record
    //And clicks any Secondary Tab
    //And clicks "+ Add Record"
    //A pop up window will appear with the option to add a relationship to an existing record or create a new record
    //Hit ESC on your keyboard.
    //Then no changes to the record will occur.
    //And clicks "+ Add Record"
    //Click the search button next to the search existing area
    //A list of records should appear
    //Mark at least two of the records
    //And clicks the "Add to Current Record" button
    //The dialog should be dismissed
    //All the newly added records should be listed in the Related Records list, near the top of the screen
    //In the Used By / Cataloging / Procedures area of the sidebar on the right side of the page, the newly added records should also be properly displayed
    //And click the identification number of one of the added records on the Related Record list, near the top of the screen
    //Then an Edit Record form should be displayed underneath the listing, filled out with data from the selected record
    //click another identification number from the list
    //The Edit Record form should be updated to correspond to the new record you clicked


  Scenario Outline: User Navigates Keyboard
    //Given user in a record
    //And clicks any Secondary Tab
    //And clicks the "+ Add New" button
    //Tab through the form, to make sure everything is reachable and authorities and dates can be handled using the keyboard
    And the user saves the record
    //Make sure the link to the newly created record (in the listing in the top of the page) is reachable by keyboard

  Scenario Outline: User Hunts For Bugs
    Spend a few minutes forcing the program to expose buggy behavior by:
    using the system in ways not covered by the testplan
    using the system in unexpected ways
    doing whatever you can think of that will produce bugs and unexpected behavior.
    Be creative!
    feel free to extend this to behavior related to this testplan


