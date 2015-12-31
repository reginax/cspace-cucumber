# Created by Cesar Villalobos on 12/27/2015

@recordssecondarytab
Feature: Loan In Tab 
  # Enter feature description here

#UI Layer
	Scenario: Test 1
	    Given user is on the "My CollectionSpace" page 
	   	
	   	And user goes to the record with identification number "CQA111_E"
	    And user selects the "Loan In" tab 
	    Then the "Related Loan In Records" area should be empty

	    And user goes to the record with identification number "CQA111_NE"
	    And user selects the "Loan In" tab 
	    Then "CQA111.1" should appear in the "Related Loan In Records" area



	Scenario: Test 3 -> Continued from Test 1
		And the user clicks on the "Add record" button #needs step def
	    # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And the user clicks the "close" button 
	    Then the "Related Loan In Records" area should only contain "CQA111.1"

	    And the user clicks on the "Add record" button
	    And the user presses the "ESC" key # Needs StepDef
	    Then the "Related Loan In Records" area should only contain "CQA111.1"
	
	Scenario: Test 5-> Searching and ading multiple Loan In records. Continued from Test 3
		And the user clicks on the "Add record" button #NeedsStepDef
	    And the user clicks the "search" button #needs StepDef maybe? 
	    Then the search results should contain "CQA111.2"
	    Then the search results should contain "CQA111.3" 

	    And the user selects the box with result "CQA111.3"  #needs Step def #6
	    And the user selects the box with result "CQA111.2"  #needs Step def #6 
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA111.2" should appear in the "Related Loan In Records" area  #needs Stepdef
	    Then "CQA111.3" should appear in the "Related Loan In Records" area  #needs Stepdef
	    Then "CQA111.2" should appear in the "Procedures" area  #needs Stepdef
	    Then "CQA111.3" should appear in the "Procedures" area  #needs Stepdef


	    And the user clicks on result with text "CQA111.2" # Might not work. #Change num?
	    Then an "Edit Loan In Record" form should be displayed # Be more specific? #Needs Stepdef
	   	Then the "Loan In Number" field should contain "CQA111.2"

	   	And the user clicks on the result with text "CQA111.3"
	    Then an "Edit Loan In Record" form should be displayed # Be more specific? #Needs Stepdef
	    Then the "Loan In Number" field should contain "CQA111.3"


	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA111.3" should not appear in the "Related Loan In Records" area 

	    And the user clicks on result with text "CQA111.2"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear 
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA111.2" should not appear in the "Related Loan In Records" area 

	    Then close the browser

	Scenario: Test 7--> Warning when navigating away from new Loan In record
	    Given the user is in the "My CollectionSpace" page
	   	And user goes to the record with identification number "CQA111_NE"
	    And user selects the "Loan In" tab 
	    

	    And the user clicks on the "Add record" button
	    And clicks on the Create button

	    Then the message "Creating new record..." should be displayed
	    Then the "Loan In Number" field should be empty
	    And user enters "CQA111.4" in the "Loan In Number" field

		### VARIATION A	    
	    And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear 
	    And the user clicks the close button 
	    Then the "Loan In Number" field should contain "CQA111.4"


	    ## VARIATION B
	    And user selects the "Current Record" tab
	    Then the dialogue should be dismissed 
	    And the user clicks the cancel button 
	    Then the "Loan In Number" field should contain "CQA111.4"

	    ## Variation D
	    And user selects the "Current Record" tab
	    And the user clicks the "Don't save" button 
	   	And user selects the "Loan In" tab 
	    Then "CQA111.4" should not appear in the "Related Loan In Records" area


	    ## Variation C
	    And the user clicks on the "Add record" button
	    And clicks on the Create button
	    And user enters "CQA111.4" in the "Loan In Number" field 
	    And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear
	    And the user clicks the save button

	    And user selects the "Loan In" tab 
	    Then "CQA111.4" should appear in the "Related Loan In Records" area 

	    ## Deleting records so we can reuse
	    And user goes to the record with identification number "CQA111.4"
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser



	Scenario: Test 9: Testing Cancel Changes button 
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA111_NE"
		
		And user selects the "Loan In" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the bottom of the page should not be clickable #needs Stepdef
	    Then the "cancel changes" button at the top of the page should not be clickable #needs Stepdef
	    
	    And user enters "CQA111.5" in the "Loan In Number" field #might not work
	    And the user clicks the "cancel changes" button 
    	Then the "Loan In Number" field should be empty

	    # Variation B
	    And user enters "CQA111.5" in the "Loan In Number" field #might not work
	    And the user clicks the "save" button 
	    Then the "cancel changes" button at the top of the page should not be clickable 
    	Then the "cancel changes" button at the bottom of the page should not be clickable 
   
   
	    And the user clicks the "Go to record" button
	    And the user clicks the "Delete" button 
	    Then a delete confirmation dialogue should appear
	    And the user clicks the confirmation delete button
	    Then a deletion should be confirmed in a dialogue
	    Then close the browser


	Scenario: Test 10-->
			# skip?
	Scenario: Test 11-->
			# skip?
	Scenario: Test 13-->
			# skip?

	#Listing and consistency
	Scenario: Test 21-->
			# skip?


	Scenario: Test 23--> Testing links and "Go To Record" works
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA111_NE"
	    And user selects the "Loan In" tab 
	    And the user clicks on result with text "CQA111.1"
	    Then the "Loan In Number" field should contain "CQA111.1"
	    And the user clicks the "Go to record" button
	    Then the titlebar should contain "CQA111.1"
	    Then the "Loan In Number" field should contain "CQA111.1"
	    Then close the browser		

	Scenario: Test 25--> Deleting relation via list
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA111_NE"
	    And user selects the "Loan In" tab 

	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA111.6" in the "Loan In Number" field #might not work 
	    And the user saves the record

	    And user clicks the "Delete Relation" button on the row that reads "CQA111.6" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then the "Related Loan In Records" area should contain "CQA111.6"

	    And user clicks the "Delete Relation" button on the row that reads "CQA111.6" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then the "Related Loan In Records" area should contain "CQA111.6"

	    And user clicks the "Delete Relation" button on the row that reads "CQA111.6" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "CQA111.6" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "CQA111.6" should not appear in the "Related Loan In Records" area #needs Stepdef #not logged

        And user goes to the record with identification number "CQA111.6"
        And user selects the "Loan In" tab 
	    Then "CQA111_NE" should not appear in the "Related Loan In Records" area  #needs Stepdef
	    And user selects the "Current Record" tab

	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser

	 

	Scenario: Test 27--> Deleting relation via record editor
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA111_NE"
	    Then "CQA111_NE" should be in the "Identification Number" field

	    And user selects the "Loan In" tab 
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA111.7" in the "Loan In Number" field #might not work 
	    And the user saves the record
	    And the user clicks on result with text "CQA111.7"

	    
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks cancel button # click cancel
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Loan In Records" area should contain "CQA111.7"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks close button # close button == close symbol?
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Loan In Records" area should contain "CQA111.7"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA111.7" should not appear in the "Procedures" area  #needs Stepdef
		Then "CQA111.7" should not appear in the "Related Loan In Records Area"

	    And user goes to the record with identification number "CQA111.7"
	    And user selects the "Loan In" tab 
	    Then the "Related Loan In Records" area should be empty
	    
	    And user selects the "Current Record" tab 
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 


	#Keyboard Accesibility
	Scenario: Test 31-->
	 Testing Functional Accessibility
	  Scenario: Testing Functional Accessibility. The user should only use the keyboard while doing the following commands
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA111_NE"
	    And user selects the "Loan In" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "SOMETHING_111_31" in the "Loan In Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "SOMETHING_111_31" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Loan In" from the top nav search record type select field # And using the top right search area, select Loan In from the drop down
	    And user enters "SOMETHING_111_31" in the top nav search field
	    Then the search results should contain "SOMETHING_111_31"
	    And the user clicks on result with text "SOMETHING_111_31"
	    Then "SOMETHING_111_31" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 

