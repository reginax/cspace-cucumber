# Created by Cesar Villalobos on 12/27/2015

@recordssecondarytab
Feature: #Enter feature name here
  # Enter feature description here

#UI Layer
	Scenario: Test 1
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "04131995"
	    And user selects the "Loan In" tab
	    # Then the Loan in records should be listed in a table
	    # If no related records exist, a "No related records yet" message should appear

	Scenario: Test 3 -> Continued from Test 1
		And the user clicks on the "Add record" button #needs step def
	    # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And the user clicks the "close" button 
	    Then no changes to the record will occur #StepDefs

	    And the user clicks on the "Add record" button
	  # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And the user presses the "ESC" key # Needs StepDef
	    Then No changes to the record will occur #Needs stepDef
	
	Scenario: Test 5-> Searching and ading multiple Loan In records. Continued from Test 3
		And the user clicks on the "Add record" button #NeedsStepDef
	    And the user clicks the "search" button #needs StepDef maybe? 
	    # Then the search results should contain "041319951.2" # change nums?
	    # Then the search results should contain "041319951.3" # change nums?

	    And the user selects the box with result "041319951.3"  #needs Step def #6
	    And the user selects the box with result "041319951.2"  #needs Step def #6 
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "041319951.2" should appear in the "Related Records" area  #needs Stepdef
	    Then "041319951.3" should appear in the "Related Records" area  #needs Stepdef
	    Then "041319951" should appear in the "Procedures" area  #needs Stepdef
	    Then "041319951" should appear in the "Procedures" area  #needs Stepdef


	    # And the user clicks on result with text "041319951" # Might not work. #Change num?
	    Then an "Edit Intake Record" form should be displayed # Be more specific? #Needs Stepdef
	    # And the user clicks on a different result 
	    Then an "Edit Intake Record" form should be displayed # Be more specific? #Needs Stepdef
	    # Delete stuff?

	Scenario: Test 7--> Warning when navigating away from new Loan In record
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "04131995"
	    Then "04131995" should be in the "Identification Number" field
	    And user selects the "Loan In" tab 
	    And the user clicks on the "Add record" button #needs step def
		And clicks on the "Create New" button
		Then the dialog should be dismissed
		Then the message "________" should be displayed # needs StepDef
	    # Then an empty Intake record form should be displayed below the listing of records

		#Variation A
			And user enters "SOMETHING" in the "Loan In Number" field 
			# And the user clicks any link/item to navigate away from the current page
		    Then a leave confirmation dialogue should appear #needs StepDef
		    And the user clicks the "close" button  #might not work
		    Then the dialogue should be dismissed

		#Variation B
			# And the user clicks any link/item to navigate away from the current page
		    Then a leave confirmation dialogue should appear #needs StepDef
		    And the user clicks the "cancel" button  #might not work
		    Then the dialogue should be dismissed

		#Variation C
			# And the user clicks any link/item to navigate away from the current page
			And the user clicks the "save" button
			# Then you should be navigated to the page you clicked
			# Then confirm that it was saved!

		#Variation D
			# And the user clicks any link/item to navigate away from the current page
			And the user clicks the "don't save" button
			# Then you should be navigated to the page you clicked
			# Then confirm that it WASN'T saved
			Then close the browser

	Scenario: Test 9: Cancel Changes button #
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "04131995"
		And user selects the "Loan In" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    And clicks on the "cancel changes" button # at the top of the page
	    Then the "cancel changes" button at the top of the page should not be clickable #needs Stepdef
	    And user enters "SOMETHING" in the "SOMETHING FIELD" field #might not work
	    Then the "cancel changes" button at the top of the page should be clickable
	    # Then the related record should be reverted to before changes were made
	    # Enter a loan in number
	    # Click the save Button
	    # After a successful save, click the cancel changes button at the bottom/top of the page
	    Then the "cancel changes" button should not be clickable 


	    # Variation B
	    And clicks on the "cancel changes" button # at the bottom of the page
	    Then the "cancel changes" button at the bottom of the page should not be clickable #needs Stepdef
	    And user enters "SOMETHING" in the "SOMETHING FIELD" field #might not work
	    Then the "cancel changes" button at the bottom of the page should be clickable
	    # Then the related record should be reverted to before changes were made
	    # Enter a loan in number
	    # Click the save Button
	    # After a successful save, click the cancel changes button at the bottom/top of the page
	    Then the "cancel changes" button should not be clickable 


	Scenario: Test 10-->
			# skip?
	Scenario: Test 11-->
			# skip?
	Scenario: Test 13-->
			# skip?

	#Listing and consistency
	Scenario: Test 21-->
			# skip?
	Scenario: Test 23-->
	 Testing links and "Go To Record" works
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "04131995"
		And user selects the "Loan In" tab
	    Then "SOMETHINGx" should appear in the "Related Intake Records" area  #needs Stepdef
	    And the user clicks on result with text "SOMETHINGx"
	    Then "SOMETHINGx" should be in the "Identification Number" field   #needs Stepdef
		And the user clicks the "Go To Record" button #above the loan in form
		Then the titlebar should contain "SOMETHINGx"
	    Then close the browser

	Scenario: Test 25-->
	 Deleting relation via list
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "SOMETHING"
	    And user selects the "Loan In" tab 

	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "SOMETHING1" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And user clicks the "Delete Relation" button on the row that reads "SOMETHING1" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then no changes should occur #needs step def

	    And user clicks the "Delete Relation" button on the row that reads "SOMETHING1" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then no changes should occur #needs step def

	    And user clicks the "Delete Relation" button on the row that reads "SOMETHING1" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "SOMETHING1" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "SOMETHING1" should not appear in the "Related Intake Records" area #needs Stepdef #not logged

	    And selects "Loan In" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "SOMETHING1" in the top nav search field
	    Then the search results should contain "SOMETHING1"
	    And the user clicks on result with text "SOMETHING1"
	    Then "SOMETHING1" should be in the "Identification Number" field   #needs Stepdef
	    And user selects the "Intake" tab 
	    Then "SOMETHING" should not appear in the "Related Intake Records" area  #needs Stepdef
		    # Do i really need to do this
		    # And user selects the "Current Record" tab 
		    # And the user clicks the delete button
		    # Then a delete confirmation dialogue should appear #needs Stepdef
		    # And the user clicks the delete button 
		    # Then the deletion should be confirmed in a dialogue
	    Then close the browser

	Scenario: Test 27-->
	 Deledting relation via record editor

	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "SOMETHING"
	    Then "SOMETHING" should be in the "Identification Number" field

	    And user selects the "Loan In" tab 
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "SOMETHING_111_27" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And the user clicks the result that contains "SOMETHING_111_27" in the "Entry Number" field
	    
	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks cancel button # click cancel
	    Then the dialog should be dismissed #needs stepdef
	    Then no changes should occur #needs step def

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks close button # close button == close symbol?
	    Then the dialog should be dismissed #needs stepdef
	    Then no changes should ocurr #needs stepdef

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    # Then the record editor should no longer be displayed (below list)
	    Then "SOMETHING_111_27" should not appear in the "Procedures" area  #needs Stepdef
		Then the deleted relation should not be shown in the right "Related Procedures" area

	    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "SOMETHING_111_27" in the top nav search field
	    Then the search results should contain "SOMETHING_111_27"
	    And the user clicks on result with text "SOMETHING_111_27"
	    Then "SOMETHING_111_27" should be in the "Identification Number" field   #needs Stepdef
	    And user selects the "Intake" tab 
	    Then "SOMETHING" should not appear in the "Related Intake Records" area  #needs Stepdef
	    #Necessary?:
		    # And user selects the "Current Record" tab 
		    # And the user clicks the delete button
		    # Then a delete confirmation dialogue should appear #needs Stepdef
		    # And the user clicks the delete button 
		    # Then the deletion should be confirmed in a dialogue
	    Then close the browser 


	#Keyboard Accesibility
	Scenario: Test 31-->
	 Testing Functional Accessibility
	  Scenario: Testing Functional Accessibility. The user should only use the keyboard while doing the following commands
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "SOMETHING"
	    And user selects the "Loan In" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "SOMETHING_111_31" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "SOMETHING_111_31" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "SOMETHING_111_31" in the top nav search field
	    Then the search results should contain "SOMETHING_111_31"
	    And the user clicks on result with text "SOMETHING_111_31"
	    Then "SOMETHING_111_31" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 

