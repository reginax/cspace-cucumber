# Created by Regina Xu on 2/26/16

@advancedsearch
Feature: Advanced Keyword Search 

Scenario: Search for a keyword "sesame"

    Actions:
        Go to My CollectionSpace page. Or select Cataloging from the drop down menu near the Search box at upper right, and click the Search button.
        Select a Cataloging record.
        Once the record loads, enter the word "sesame" in the Brief Description field. Save.
        Go back to My CollectionSpace page
        Select another Cataloging record
        Once the record loads, enter the word "sesame" in the Distinguishing Features field. Save.
        Go to Create New page
        Create a new Cataloging record that contains "sesame" in one of its text fields. Save.
        Leave the record by clicking on Advanced search on top of the search bar above the record
        Type "sesame" into the keyword search text field
        Select "Cataloging" from the record type dropdown, click Search
    Expected:
        A list of search results are displayed. The list should contain the three records described above.
        The list should consist of the following columns: ID number (link to the record), Summary, Record type, Updated at
        At the top of the results list it should say "Found x records for sesame", where x is the number of results
    Actions:
        Create another Cataloging record whose Title field contains "sesame". Save the new record.
        Return to advanced search and search for "sesame" in the keyword search text field. Select cataloging from the record type dropdown menu. Click search.
        Check that the number of results is increased by 1, and the new record is displayed in the list.
    Actions:
        Create and save one each of a concept, person, storage location, organization, place, work, citation, loan in, loan out, acquisition, location and movement, exhibition, object exit, intake, condition, group, valuation, and media handling record that contains "sesame street".
        From the Search box at upper right, or from the Find and Edit page, perform an "All Record Types" search on "sesame".
        Check that the number of results is increased by 18, and that each type of record is displayed in the list.

Scenario: Search for a key phrase "sesame street"

    Actions:
        Go to My CollectionSpace page
        Select a Cataloging record
        Once the record loads, enter the phrase "sesame street" in the Brief Description field. Save.
        Go back to My CollectionSpace page
        Select another Cataloging record
        Once the record loads, enter the phrase "sesame street" in the Distinguishing Features field. Save.
        Go to Create New page
        Create a new cataloging record that contains "sesame street" in one of its text fields. Save.
        Leave the record by clicking on Advanced search on top of the search bar above the record
        Type "sesame street" into the keyword search text field
        Select "Cataloging" from the record type dropdown, click Search
    Expected:
        A list of search results are displayed. The list should contain the three records described above.
        The list should consist of the following columns: ID number (link to the record), Summary, Record type, Updated at
        At the top of the results list it should say "Found x records for sesame street", where x is the number of results
    Actions:
        Create another Cataloging record that contains "sesame street". Save.
        Return to advanced search and search for "sesame street" in the keyword search text field. Select cataloging from the record type dropdown menu. Click search..
        Check that the number of results is increased by 1, and the new record is displayed in the list.
    Actions:
        Create a new cataloging record that contains "The Big Lebowski" in one of the text fields. Save.
        Return to advanced search and search for "The Lebowski" in the keyword search text field. Select Cataloging from the record type dropdown menu. Click search.
    Expected:
        The record you just created should be returned in the search results.
    Actions:
        Create and save one each of a concept, person, storage location, organization, place, work, citation, loan in, loan out, acquisition, location and movement,exhibition, object exit, intake, condition, group, valuation, and media handling record that contains "sesame street".
        From the Search box at upper right, or from the Find and Edit page, perform an "All Record Types" search on "sesame street".
        Check that the number of results is increased by 18, and that each type of record is displayed in the list.

Scenario: Search for a record that contains an authority term "James Fanboy"

    Actions:
        Create a Cataloging record
        Enter the name "James Fanboy" in the Owner field. If no matches are found, add James Fanboy to the Local Persons authority. Save the record.
        Leave the record by clicking on Advanced search on top of the search bar above the record
        Type "James Fanboy" into the keyword search text field
        Select "Cataloging" from the record type dropdown, click Search
    Expected:
        Search results are displayed.
        The record created above is included in the search results.
    Actions:
        Click on the ID Number (link) of the first item in the search results list
    Expected:
        The record page loads

Scenario: Perform a wildcard search

    Actions:
        Go to advanced search
        Select "Cataloging" in the record type dropdown
        Type * in the keyword search text field. Click Search.
    Expected:
        A list of all Cataloging records that exist in the system are displayed.
    Actions:
        Return to Advanced Search
        Select "Cataloging" in the record type dropdown
        Leave the keyword search field blank. Click Search.
    Expected:
        A list of all Cataloging records that exist in the system are displayed.

Scenario: Boolean Keyword Search

    Actions:
        Create three loan in records with the phrase "queen size bed" in one of the text fields.
        Create three loan in records with the phrase "king size bed" in one of the text fields.
        Go to advanced search and select "loan in" from the record type drop down
        Type "queen and bed" into the the keyword search text field and click search
    Expected:
        The first three records you created should appear in the search results
    Actions:
        Return to advanced search and select "loan in" from the record type drop down
        Type "king and bed not queen" into the keyword search text field and click search
    Expected:
        The second set of three records you created should appear in the search results
    Actions:
        Return to advanced search and select "loan in" from the record type drop down
        Type "queen or king" into the keyword search text field and click search
    Expected:
        All of the records you created should appear in the search results

Scenario: Traverse through search results pages

    Actions:
        On the My CollectionSpace page, check to see if there are at least 12 acquisition records in the system
        If there aren't 12, create new records to add up to 12
        Go to advanced search
        Leave the keyword search text field blank
        Select "Acquisition" from the record type dropdown, click Search
    Expected:
        All acquisition records appear in the search results
    Actions:
        Leave the number of items per page at 10, and click on the next button
    Expected:
        The second page of the results list should load
        Item 11 and on should be displayed