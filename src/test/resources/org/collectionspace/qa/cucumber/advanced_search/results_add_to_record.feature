# Created by Cesar Villalobos on 12/04/2015

@advancedsearch
Feature: Advanced Search results Add to Record
  # Enter feature description here

  Scenario
	  Go to the Create New screen.
		Create a new Group.
		Set the Title to a name of your choosing (e.g. "group1" followed by your initials).
		Save the record.
		Go to Advanced Search.
		Search for existing Cataloging records containing some term that you expect will find one or more records. (If you leave the Search box empty, your search will return all records.)
	Expected:
		A list of search results matching your criteria is displayed

	Actions:
		Click the Add to Record button.
		Change the Search Existing dropdown to Group and enter a search term that matches your newly-created Group's name (e.g. "group1" followed by your initials)
		Click the check-box next to the Group record returned by the search
		Click the Add Search Results button
	Expected:
		A message is displayed at the bottom of the page saying "Added NUMBER_OF records to GROUP_TITLE."


  Scenario
	Actions:
		Using Search or Advanced Search, search Group records for your newly-created Group (e.g. "group1" followed by your initials)
		Select the record by clicking on it.
	Expected:
		The record for your group is displayed.
		A set of related records are visible within the Cataloging section of the right sidebar, matching the Cataloging records you added to the Group in Test 1, above.
	Actions:
		Click the Cataloging secondary tab for Group.
		Expected:
		The Cataloging records related to this Group are visible in the list.
	Actions:
		Remove one related object from the list by clicking the green 'X' to the right of its name
	Expected:
		The related object is removed from the list

  Scenario
	Actions:
		From an Advanced Search results page, use the keyboard only to navigate to and activate the Add to Record button
	Expected:
		At all times it should be possible to see which field has focus
		Drop down, items in the drop down, authorities, and text fields should all work as expected


