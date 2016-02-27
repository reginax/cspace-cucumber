# Created by xxx on mo/day/2015

@rightsidebar
Feature: Right Frame - Show Related Records 

  Scenario: Show Related Records

    Action:
        Given user is on the "Create New" page
	    And selects the "Acquisition" radio button on the Create New page
	    And clicks on the Create button

	    
        Save the record.
        Click the Show button in the right panel in the right sidebar area for related Cataloging records
    Expected:
        The Show button is disabled; nothing happens.

    Action:
        Add two or more related Cataloging objects to the Acquisition record via the Cataloging secondary tab (or the Add button in the right sidebar area for related Cataloging records)
        Variation: Find an existing Acquisition (or other procedure) record that has multiple Cataloging records related to it.
    Expected:
        The Show button is enabled.

    Action:
        Click the Show (Show Related Objects) button
    Expected:
        Advanced Search results screen displays with related Cataloging objects listed in search results.
        The title bar lists information about the Acquisition record that you came from (e.g. "Found {number of} records related to {identifier for Acquisition record}")
        The "Edit existing advanced search" button is not visible.

  Scenario: Test keyboard accessibility

    Actions
        Test that the Show Related Objects button can be navigated to and activated by keyboard only
    Expected:
        You should be able to do all the above using keyboard only
        The tab-ordering and keys used should be logical
        At all times, you should be able to see where focus is
