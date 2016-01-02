# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Loan Out Tab
  # Enter feature description here

	Scenario: Working Loan Out Secondary Tab #Test 1
		Given the user is in the "My CollectionSpace" page
	   
	    And user goes to the record with identification number "CQA112_E" #not empty
	    Then the "Related Loan Out Records" area should be empty
	    Then close the browser

		And user goes to the record with identification number "CQA112_NE"
	    And user selects the "Loan Out" tab
	    Then "CQA112.1" should appear in the "Related Loan Out Records" area

	    Then close the browser

	Scenario: Dismissing the dialog #Test 3
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA112_NE"

		#Variation A
		And the user clicks on the "Add record" button 
	    And the user clicks the "close" button 
	    Then the "Related Loan Out Records" area should only contain "CQA112.1"

	    #Variation B
	    And the user clicks on the "Add record" button
	    And the user presses the "ESC" key 
	    Then the "Related Loan Out Records" area should only contain "CQA112.1"


	Scenario: Searching and adding multiple Loan Out records #Test 5
		And the user clicks on the "Add record" button 
	    And the user clicks the "search" button 
	    Then the search results should contain "CQA112.3" 
	    Then the search results should contain "CQA112.2" 

	    And the user selects the box with result "CQA112.3" 
	    And the user selects the box with result "CQA112.2"  
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA112.3" should appear in the "Related Loan Out Records" area
	    Then "CQA112.2" should appear in the "Related Loan Out Records" area 
	    Then "CQA112.3" should appear in the "Procedures" area 
	    Then "CQA112.2" should appear in the "Procedures" area 


	    And the user clicks on result with text "CQA112.3" 
	    Then an "Edit Loan Out Record" form should be displayed 
	    Then the "Loan Out Number" field should contain "CQA112.3"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA112.3" should not appear in the "Related Loan Out Records" area 


	    And the user clicks on result with text "CQA112.2" 
	    Then an "Edit Loan Out Record" form should be displayed 
	    Then the "Loan Out Number" field should contain "CQA112.2"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA112.2" should not appear in the "Related Loan Out Records" area 

	    Then close the browser

	Scenario: Warning when navigating away from new Loan Out record #Test 7 
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA112_NE"
	    Then "CQA112_NE" should be in the "Identification Number" field
	    And user selects the "Loan Out" tab 
	    
	    And the user clicks on the "Add record" button
		And clicks on the "Create New" button
		
		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed
	    
		Then the "Loan Out Number" field should be empty
	    And user enters "CQA112.4" in the "Loan Out Number" field


	    #Variation A
	    	And user selects the "Current Record" tab
		    Then a leave confirmation dialogue should appear 
		    And the user clicks the "close" button  
		    Then the "Loan Out Number" field should contain "CQA112.4"


		#Variation B
			And user selects the "Current Record" tab
		    Then a leave confirmation dialogue should appear #needs StepDef
		    And the user clicks the "cancel" button  #might not work
		    Then the "Loan Out Number" field should contain "CQA112.4"

	    ## Variation D
		    And user selects the "Current Record" tab
		    And the user clicks the "Don't save" button 
		   	And user selects the "Loan Out" tab 
		    Then "CQA112.4" should not appear in the "Related Loan Out Records" area


		#Variation C
			And the user clicks on the "Add record" button
	    	And clicks on the Create button
	    	And user enters "CQA112.4" in the "Loan Out Number" field 
			And user selects the "Current Record" tab
			And the user clicks the "save" button

		    And user selects the "Loan Out" tab 
		    Then "CQA112.4" should appear in the "Related Loan Out Records" area 

		    And user goes to the record with identification number "CQA112.4"
		    And the user clicks the delete button
		    Then a delete confirmation dialogue should appear
		    And the user clicks the delete button 
		    Then the deletion should be confirmed in a dialogue
		    Then close the browser

	Scenario: Cancel changes button #Test 9
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA112_NE"
		And user selects the "Loan Out" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the bottom of the page should not be clickable
	    Then the "cancel changes" button at the top of the page should not be clickable
	    
	    And user enters "CQA112.5" in the "Loan Out Number" field #might not work
	    And the user clicks the "cancel changes" button 
    	Then the "Loan Out Number" field should be empty

	    # Variation B
	    And user enters "CQA112.5" in the "Loan Out Number" field #might not work
	    And the user clicks the "save" button 
	    Then the "cancel changes" button at the top of the page should not be clickable 
    	Then the "cancel changes" button at the bottom of the page should not be clickable 
   
   
	    And the user clicks the "Go to record" button
	    And the user clicks the "Delete" button 
	    Then a delete confirmation dialogue should appear
	    And the user clicks the confirmation delete button
	    Then a deletion should be confirmed in a dialogue
	    Then close the browser


	Scenario: Create new from Used By/ Procedures area #Test 10
    	# Skip?
	Scenario: Check loan Out number and scuccessful save #Test 11
    	# Skip?
	Scenario: All felds saved on edited Loan Out record #Test 13
    	# Skip?
	Scenario: Listing displays correct fields #Test 21
    	# Skip?

	Scenario: Testing links and "Go To Record" works #Test 23
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA112_NE"
	    And user selects the "Loan Out" tab 
	    And the user clicks on result with text "CQA112.1"
	    Then the "Loan Out Number" field should contain "CQA112.1"
	    And the user clicks the "Go to record" button
	    Then the titlebar should contain "CQA112.1"
	    Then the "Loan Out Number" field should contain "CQA112.1"
	    Then close the browser	

	Scenario: Deleting relation via list #Test 25
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA112_NE"
	    And user selects the "Loan Out" tab 

	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA112.7" in the "Loan Out Number" field #might not work 
	    And the user saves the record
	    
	    And user clicks the "Delete Relation" button on the row that reads "CQA112.7" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then the "Related Loan Out Records" area should contain "CQA112.7"

	    And user clicks the "Delete Relation" button on the row that reads "CQA112.7" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then the "Related Loan Out Records" area should contain "CQA112.7"


	    And user clicks the "Delete Relation" button on the row that reads "CQA112.7" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "CQA112.7" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "CQA112.7" should not appear in the "Related Loan Out Records" area #needs Stepdef #not logged

    	And user goes to the record with identification number "CQA112.7"
        And user selects the "Loan Out" tab 
	    Then "CQA112_NE" should not appear in the "Related Loan Out Records" area  #needs Stepdef
	    And user selects the "Current Record" tab

	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser

	Scenario: Deleting relation via record editor #Test 27
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA112_NE"
	    Then "CQA112_NE" should be in the "Identification Number" field

	    And user selects the "Loan Out" tab 
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA112.8" in the "Loan Out Number" field #might not work 
	    And the user saves the record
	    And the user clicks on result with text "CQA112.8"
	    
	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks cancel button # click cancel
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Loan Out Records" area should contain "CQA112.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks close button # close button == close symbol?
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Loan Out Records" area should contain "CQA112.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA112.8" should not appear in the "Procedures" area  #needs Stepdef
	    Then "CQA112.8" should not appear in the "Related Loan Out Records" area

	    And user goes to the record with identification number "CQA112.8"
	    And user selects the "Loan Out" tab 
	    Then the "Related Loan Out Records" area should be empty
	    
	    And user selects the "Current Record" tab 
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 

    
	Scenario: Testing Functional Accessibility #Test 31
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA112_NE"
	    And user selects the "Loan Out" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "CQA112.9" in the "Loan Out Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "CQA112.9" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Loan Out" from the top nav search record type select field # And using the top right search area, select Loan Out from the drop down
	    And user enters "CQA112.9" in the top nav search field
	    Then the search results should contain "CQA112.9"
	    And the user clicks on result with text "CQA112.9"
	    Then "CQA112.9" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 


































