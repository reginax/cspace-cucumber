# Created by Cesar Villalobos on 12/29/2015

@recordssecondarytab
Feature: #Enter feature name here
  # Enter feature description here

 	Scenario: Working Exhibition Secondary Tab #1
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA105_NE"
	    And user selects the "Exhibition" tab
	    # Then the Exhibition records should be listed in a table
	    And user goes to the record with identification number "CQA105_E" #empty
	    # If no related records exist, a "No related records yet" message should appear
	    Then close the browser

	Scenario: Dismissing the dialog #3
  		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA105_NE"

		#Variation A
		And the user clicks on the "Add record" button #needs step def
	    # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And the user clicks the "close" button 
	    Then no changes to the record will occur #StepDefs

	    #Variation B
	    And the user clicks on the "Add record" button
	  	# Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And the user presses the "ESC" key # Needs StepDef
	    Then No changes to the record will occur #Needs stepDef


	Scenario: Searching and adding multiple Exhibition records #5
  		And the user clicks on the "Add record" button #NeedsStepDef
	    And the user clicks the "search" button #needs StepDef maybe? 
	    Then the search results should contain "CQA105.1" 
	    Then the search results should contain "CQA105.2"  

	    And the user selects the box with result "CQA105.1" 
	    And the user selects the box with result "CQA105.2"  
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA105.1" should appear in the "Related Records" area  #needs Stepdef
	    Then "CQA105.2" should appear in the "Related Records" area  #needs Stepdef
	    Then "CQA105.1" should appear in the "Procedures" area  #needs Stepdef
	    Then "CQA105.2" should appear in the "Procedures" area  #needs Stepdef


	    And the user clicks on result with text "CQA105.1" # Might not work. #Change num?
	    Then an "Edit Exhibition" form should be displayed # Be more specific? #Needs Stepdef
	    And the user clicks on result with text "CQA105.2" # Might not work. #Change num?
	    Then an "Edit Exhibition" form should be displayed # Be more specific? #Needs Stepdef #be different?
	    # This second form should be different somehow
	    # Delete relations: CQA105.1 and CQA105.2
	    Then close the browser

	Scenario: Warning when navigating away from new Exhibition record #7
    	Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA105_NE"
	    Then "CQA105_NE" should be in the "Identification Number" field
	    And user selects the "Exhibition" tab 
	    And the user clicks on the "Add record" button #needs step def
		And clicks on the "Create New" button
		Then the dialog should be dismissed
		Then the message "________" should be displayed # needs StepDef
	    # Then an empty Intake record form should be displayed below the listing of records

	    #Variation A
			And user enters "CQA105.3" in the "Exhibition Number" field 
			# And the user clicks any link/item to navigate away from the current page (use the back button?)
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
			# Then confirm that it was saved! by searching for record

		#Variation D
			And user enters "CQA105.4" in the "Exhibition Number" field
			# And the user clicks any link/item to navigate away from the current page
			And the user clicks the "don't save" button
			# Then you should be navigated to the page you clicked
			# Then confirm that it WASN'T saved by searching for record
			Then close the browser

	Scenario: Cancel Changes button #9
    	Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA105_NE"
		And user selects the "Exhibition" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    And clicks on the "cancel changes" button # at the top of the page
	    Then the "cancel changes" button at the top of the page should not be clickable #needs Stepdef
	    And user enters "CQA105.5" in the "SOMETHING FIELD" field #might not work
	    Then the "cancel changes" button at the top of the page should be clickable
	    And the user clicks the "cancel changes" button at the top of the page 
	    Then the "SOMETHING FIELD" should be empty # makes sure it reverted
	    # Enter a Exhibition number
	    # Click the save Button
	    # After a successful save, click the cancel changes button at the bottom/top of the page
	    Then the "cancel changes" button should not be clickable 


	    # Variation B
	    And clicks on the "cancel changes" button # at the bottom of the page
	    Then the "cancel changes" button at the bottom of the page should not be clickable #needs Stepdef
	    And user enters "CQA105.6" in the "SOMETHING FIELD" field #might not work
	    Then the "cancel changes" button at the bottom of the page should be clickable
	   	Then the "SOMETHING FIELD" should be empty # makes sure it reverted
	    # Then the related record should be reverted to before changes were made
	    # Enter a Exhibition number
	    # Click the save Button
	    # After a successful save, click the cancel changes button at the bottom/top of the page
	    Then the "cancel changes" button should not be clickable 
	    Then close the browser


	Scenario: Check Exhibition Number and successful save #11
		#skip

	Scenario: All fields saved on edited Exhibition record #13
		#skip

	Scenario: Listing displays correct fields #21
		#skip

	Scenario: Testing links and "Go To Record" works #23
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA105_NE"
		And user selects the "Exhibition" tab
	    Then "SOMETHINGx" should appear in the "Related Intake Records" area  #needs Stepdef
	    And the user clicks on result with text "SOMETHINGx"
	    Then "SOMETHINGx" should be in the "Identification Number" field   #needs Stepdef
		And the user clicks the "Go To Record" button #above the Exhibition form
		Then the titlebar should contain "SOMETHINGx" 
		# everything else must be intact too
	    Then close the browser


	Scenario: Deleting Relation via list #25
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA105_NE"
	    And user selects the "Exhibition" tab 

	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA105.7" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And user clicks the "Delete Relation" button on the row that reads "CQA105.7" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then no changes should occur #needs step def

	    And user clicks the "Delete Relation" button on the row that reads "CQA105.7" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then no changes should occur #needs step def

	    And user clicks the "Delete Relation" button on the row that reads "CQA105.7" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "CQA105.7" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "CQA105.7" should not appear in the "Related Exhibition Records" area #needs Stepdef #not logged

	    And selects "Exhibition" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "CQA105.7" in the top nav search field
	    Then the search results should contain "CQA105.7"
	    And the user clicks on result with text "CQA105.7"
	    Then "CQA105.7" should be in the "Identification Number" field   #needs Stepdef
	    And user selects the "Exhibition" tab 
	    Then "CQA105_NE" should not appear in the "Related Exhibition Records" area  #needs Stepdef
		    # Do i really need to do this
		    # And user selects the "Current Record" tab 
		    # And the user clicks the delete button
		    # Then a delete confirmation dialogue should appear #needs Stepdef
		    # And the user clicks the delete button 
		    # Then the deletion should be confirmed in a dialogue
	    Then close the browser

	Scenario: Deleting relation via record editor #27
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA105_NE"
	    Then "CQA105_NE" should be in the "Identification Number" field

	    And user selects the "Exhibition" tab 
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA105.8" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And the user clicks the result that contains "CQA105.8" in the "Entry Number" field
	    
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
	    Then "CQA105.8" should not appear in the "Procedures" area  #needs Stepdef
		Then the deleted relation should not be shown in the right "Related Procedures" area
		# ^ one of the above??

	    And selects "Exhibition" from the top nav search record type select field # And using the top right search area, select Exhibition from the drop down
	    And user enters "CQA105.8" in the top nav search field
	    Then the search results should contain "CQA105.8"
	    And the user clicks on result with text "CQA105.8"
	    Then "CQA105.8" should be in the "Identification Number" field   #needs Stepdef
	    And user selects the "Exhibition" tab 
	    Then "CQA105_NE" should not appear in the "Related Exhibition Records" area  #needs Stepdef
	    #Necessary?:
		    # And user selects the "Current Record" tab 
		    # And the user clicks the delete button
		    # Then a delete confirmation dialogue should appear #needs Stepdef
		    # And the user clicks the delete button 
		    # Then the deletion should be confirmed in a dialogue
	    Then close the browser 

	Scenario: Testing functional Accessibility #31
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA105_NE"
	    And user selects the "Exhibition" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "CQA105.9" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "CQA105.9" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "CQA105.9" in the top nav search field
	    Then the search results should contain "CQA105.9"
	    And the user clicks on result with text "CQA105.9"
	    Then "CQA105.9" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 










