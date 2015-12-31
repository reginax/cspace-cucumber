# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Location/Movement/Inventory Control Tab
  # Enter feature description here

  	Scenario: Working Location/Movement/Inventory Secondary Tab #1
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA113_NE"
	    And user selects the "Location/Movement/Inventory" tab
	    Then "CQA113.1" should appear in the "Related Location/Movement/Inventory Records" area
	 
	    And user goes to the record with identification number "CQA113_E" #empty
  	    And user selects the "Location/Movement/Inventory" tab
  	    Then the "Related Location/Movement/Inventory" are should be empty
	    Then close the browser

  	Scenario: Dismissing the dialog
  		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA113_NE"

		#Variation A
		And the user clicks on the "Add record" button #needs step def
	    And the user clicks the "close" button 
	    Then the "Related Location/Movement/Inventory Records" area should only contain "CQA113.1"

	    #Variation B
	    And the user clicks on the "Add record" button
	    And the user presses the "ESC" key # Needs StepDef
	    Then the "Related Location/Movement/Inventory Records" area should only contain "CQA113.1"


  	Scenario: Searching and adding multiple Location/Movement/Inventory records
		And the user clicks on the "Add record" button #NeedsStepDef
	    And the user clicks the "search" button #needs StepDef maybe? 
	    Then the search results should contain "CQA113.3" 
	    Then the search results should contain "CQA113.2" 

	    And the user selects the box with result "CQA113.3" 
	    And the user selects the box with result "CQA113.2"  
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA113.3" should appear in the "Related Location/Movement/Inventory Records" area  #needs Stepdef
	    Then "CQA113.2" should appear in the "Related Location/Movement/Inventory Records" area  #needs Stepdef
	    Then "CQA113.3" should appear in the "Procedures" area  #needs Stepdef
	    Then "CQA113.2" should appear in the "Procedures" area  #needs Stepdef


	    And the user clicks on result with text "CQA113.3" # Might not work. #Change num?
	    Then an "Edit Location/Movement/Inventory Control" form should be displayed # Be more specific? #Needs Stepdef
	   	Then the "Reference Number" field should contain "CQA113.3"

	   	And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA113.3" should not appear in the "Related Location/Movement/Inventory Records" area 


 		And the user clicks on result with text "CQA113.2" # Might not work. #Change num?
	    Then an "Edit Location/Movement/Inventory Control" form should be displayed # Be more specific? #Needs Stepdef
	   	Then the "Reference Number" field should contain "CQA113.2"

	   	And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA113.3" should not appear in the "Related Location/Movement/Inventory Records" area 

	    Then close the browser

  	Scenario: Warning when navigating away from new Location/Movement/Inventory record #7
  		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA113_NE"
	    Then "CQA113_NE" should be in the "Identification Number" field
	    And user selects the "Location/Movement/Inventory" tab 
	    

	    And the user clicks on the "Add record" button #needs step def
		And clicks on the "Create New" button
		Then the message "Creating new record..." should be displayed # needs StepDef
	    # Then an empty Intake record form should be displayed below the listing of records
		And user enters "CQA113.4" in the "Reference Number" field 
		And user enters "CQA113.2" in the "Current Location" field
		And user selects "CQA113.2" from the drop down options 

	    #Variation A
	   		And user selects the "Current Record" tab
		    Then a leave confirmation dialogue should appear #needs StepDef
		    And the user clicks the "close" button  #might not work
		    Then the "Reference Number" field should contain "CQA113.4" 

		#Variation B
	   		And user selects the "Current Record" tab
		    Then a leave confirmation dialogue should appear #needs StepDef
		    And the user clicks the "cancel" button  #might not work
		    Then the dialogue should be dismissed

		#Variation D
		    And user selects the "Current Record" tab
		    And the user clicks the "Don't save" button 
		   	And user selects the "Location/Movement/Inventory" tab 
		    Then "CQA113.4" should not appear in the "Related Location/Movement/Inventory Records" area

		#Variation C
		    And the user clicks on the "Add record" button
		    And clicks on the Create button
			And user enters "CQA113.4" in the "Reference Number" field 
			And user enters "CQA113.2" in the "Current Location" field
			And user selects "CQA113.2" from the drop down options 

			And user selects the "Current Record" tab
		    Then a leave confirmation dialogue should appear
		    And the user clicks the save button

		    And user selects the "Location/Movement/Inventory" tab 
		    Then "CQA113.4" should appear in the "Related Location/Movement/Inventory Records" area 

		    ## Deleting records so we can reuse
		    And user goes to the record with identification number "CQA113.4"
		    And the user clicks the delete button
		    Then a delete confirmation dialogue should appear
		    And the user clicks the delete button 
		    Then the deletion should be confirmed in a dialogue
		    Then close the browser



  	Scenario: Cancel changes button #9
    	Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA113_NE"
		And user selects the "Location/Movement/Inventory" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the bottom of the page should not be clickable #needs Stepdef
	    Then the "cancel changes" button at the top of the page should not be clickable #needs Stepdef

	    And user enters "CQA113.5" in the "Reference Number" field #might not work
		And user enters "CQA113.2" in the "Current Location" field
		And user selects "CQA113.2" from the drop down options 

	    And the user clicks the "cancel changes" button at the top of the page 
	    Then the "Reference Number" should be empty # makes sure it reverted


	    # Variation B
	    And user enters "CQA113.5" in the "Reference Number" field #might not work
		And user enters "CQA113.2" in the "Current Location" field
		And user selects "CQA113.2" from the drop down options 

	    And the user clicks the "save" button 
	    Then the "cancel changes" button at the top of the page should not be clickable 
    	Then the "cancel changes" button at the bottom of the page should not be clickable 
   
   
	    And the user clicks the "Go to record" button
	    And the user clicks the "Delete" button 
	    Then a delete confirmation dialogue should appear
	    And the user clicks the confirmation delete button
	    Then a deletion should be confirmed in a dialogue
	    Then close the browser

  	Scenario: Create new Used By/ Procedures area #10
    	# Enter steps here
    	# skip?

  	Scenario: Check current location and successful save #11
    	# Enter steps here 
    	#skip? 

  	Scenario: All fields saved on edited Location/Movement/Inventory record #13
    	# Enter steps here 
    	#skip?

  	Scenario: Listing displays correct fields #21
    	# Enter steps here 
    	#skip?

  	Scenario: Testing links and "Go To Record" works #23
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA113_NE"
		And user selects the "Location/Movement/Inventory" tab
	    Then "CQA113.1" should appear in the "Related Location/Movement/Inventory Records" area  #needs Stepdef
	    And the user clicks on result with text "CQA113.1"
	    Then "CQA113.1" should be in the "Reference Number" field   #needs Stepdef
		And the user clicks the "Go To Record" button #above the Location/Movement/Inventory form
		Then the titlebar should contain "CQA113.1" 
	    Then the "Reference Number" field should contain "CQA113.1"
	    Then close the browser

	Scenario: Deleting relation via list #Test 25
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA113_NE"
	    And user selects the "Location/Movement/Inventory" tab 

	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA113.7" in the "Reference Number" field #might not work 
		And user enters "CQA113.2" in the "Current Location" field
		And user selects "CQA113.2" from the drop down options 

	    And the user saves the record
	    And user clicks the "Delete Relation" button on the row that reads "CQA113.7" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then no changes should occur #needs step def

	    And user clicks the "Delete Relation" button on the row that reads "CQA113.7" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then no changes should occur #needs step def

	    And user clicks the "Delete Relation" button on the row that reads "CQA113.7" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "CQA113.7" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "CQA113.7" should not appear in the "Related Location/Movement/Inventory Records" area #needs Stepdef #not logged

        And user goes to the record with identification number "CQA113.6"
        And user selects the "Location/Movement/Inventory" tab 
	    Then "CQA113_NE" should not appear in the "Related Location/Movement/Inventory Records" area  #needs Stepdef
	    And user selects the "Current Record" tab

	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser


  	Scenario: Deleting relation via record editor #27
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA113_NE"
	    Then "CQA113_NE" should be in the "Identification Number" field

	    And user selects the "Location/Movement/Inventory" tab 
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA113.8" in the "Reference Number" field #might not work 
		And user enters "CQA113.2" in the "Current Location" field
		And user selects "CQA113.2" from the drop down options 

	    And the user saves the record
	    And the user clicks the result with text "CQA113.8"
	    
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks cancel button # click cancel
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Location/Movement/Inventory Records" area should contain "CQA113.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks close button # close button == close symbol?
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Location/Movement/Inventory Records" area should contain "CQA113.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA113.8" should not appear in the "Procedures" area  #needs Stepdef
	    Then "CQA113.8" should not appear in the "Related Location/Movement/Inventory Records"



	    And user goes to the record with identification number "CQA113.8"
	    And user selects the "Location/Movement/Inventory" tab 
	    Then the "Related Location/Movement/Inventory Records" area should be empty
	    
	    And user selects the "Current Record" tab 
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser  

  	Scenario: Testing Function Accessibility #31
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA113_NE"
	    And user selects the "Location/Movement/Inventory" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "CQA113.9" in the "Reference Number" field #might not work 
		And user enters "CQA113.2" in the "Current Location" field
		And user selects "CQA113.2" from the drop down options 

	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "CQA113.9" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down options
	    And user enters "CQA113.9" in the top nav search field
	    Then the search results should contain "CQA113.9"
	    And the user clicks on result with text "CQA113.9"
	    Then "CQA113.9" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 


