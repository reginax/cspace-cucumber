# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Valuation Tab
  	# Enter feature description here

  	Scenario: Working Valuation Control Secondary Tab #1
		Given the user is in the "My CollectionSpace" page
	   
	    And user goes to the record with identification number "CQA116_E" #not empty
	    And user selects the "Valuation" tab	    
	    Then the "Related Valuation Control Records" area should be empty
	   
		And user goes to the record with identification number "CQA116_NE"
	    And user selects the "Valuation" tab
	    Then "CQA116.1" should appear in the "Related Valuation Control Records" area

	    Then close the browser


  	Scenario: Dismissing the dialog #3 
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA116_NE"

		#Variation A
		And the user clicks on the "Add record" button 
	    And the user clicks the "close" button 
	    Then the "Related Valuation Control Records" area should only contain "CQA116.1"

	    #Variation B
	    And the user clicks on the "Add record" button
	    And the user presses the "ESC" key 
	    Then the "Related Valuation Control Records" area should only contain "CQA116.1"


  	Scenario: Searching and adding multiple Valuation Control records #5
		And the user clicks on the "Add record" button 
	    And the user clicks the "search" button 
	    Then the search results should contain "CQA116.3" 
	    Then the search results should contain "CQA116.2" 

	    And the user selects the box with result "CQA116.3" 
	    And the user selects the box with result "CQA116.2"  
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA116.3" should appear in the "Related Valuation Control Records" area
	    Then "CQA116.2" should appear in the "Related Valuation Control Records" area 
	    Then "CQA116.3" should appear in the "Procedures" area 
	    Then "CQA116.2" should appear in the "Procedures" area 


	    And the user clicks on result with text "CQA116.3" 
	    Then an "Edit Valuation Control Record" form should be displayed 
	    Then the "Valuation Control Reference Number" field should contain "CQA116.3"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA116.3" should not appear in the "Related Valuation Control Records" area 


	    And the user clicks on result with text "CQA116.2" 
	    Then an "Edit Valuation Control Record" form should be displayed 
	    Then the "Valuation Control Reference Number" field should contain "CQA116.2"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA116.2" should not appear in the "Related Valuation Control Records" area 

	    Then close the browser


  	Scenario: Warning when navigating away from new Valuation Control record #7
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA116_NE"
	    Then "CQA116_NE" should be in the "Identification Number" field
	    And user selects the "Valuation" tab 
	    
	    And the user clicks on the "Add record" button
		And clicks on the "Create New" button
		
		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed
	    
		Then the "Valuation Control Reference Number" field should be empty
	    And user enters "CQA116.4" in the "Valuation Control Reference Number" field


	    #Variation A
    	And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear 
	    And the user clicks the "close" button  
	    Then the "Valuation Control Reference Number" field should contain "CQA116.4"


		#Variation B
		And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear #needs StepDef
	    And the user clicks the "cancel" button  #might not work
	    Then the "Valuation Control Reference Number" field should contain "CQA116.4"

	    ## Variation D
	    And user selects the "Current Record" tab
	    And the user clicks the "Don't save" button 
	   	And user selects the "Valuation" tab 
	    Then "CQA116.4" should not appear in the "Related Valuation Control Records" area


		#Variation C
		And the user clicks on the "Add record" button
    	And clicks on the Create button
    	And user enters "CQA116.4" in the "Valuation Control Reference Number" field 
		And user selects the "Current Record" tab
		And the user clicks the "save" button

	    And user selects the "Valuation" tab 
	    Then "CQA116.4" should appear in the "Related Valuation Control Records" area 

	    And user goes to the record with identification number "CQA116.4"
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser

 	Scenario: Cancel changes button #9
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA116_NE"
		And user selects the "Valuation" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the bottom of the page should not be clickable
	    Then the "cancel changes" button at the top of the page should not be clickable
	    
	    And user enters "CQA116.5" in the "Valuation Control Reference Number" field #might not work
	    And the user clicks the "cancel changes" button 
    	Then the "Valuation Control Reference Number" field should be empty

	    # Variation B
	    And user enters "CQA116.5" in the "Valuation Control Reference Number" field #might not work
	    And the user clicks the "save" button 
	    Then the "cancel changes" button at the top of the page should not be clickable 
    	Then the "cancel changes" button at the bottom of the page should not be clickable 
   
   
	    And the user clicks the "Go to record" button
	    And the user clicks the "Delete" button 
	    Then a delete confirmation dialogue should appear
	    And the user clicks the confirmation delete button
	    Then a deletion should be confirmed in a dialogue

	    Then close the browser

	Scenario: Check Valuation Control Reference Number and successful save  And All fields saved on edited Valuation Control record #13
        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And user goes to the record with identification number "CQA116_NE"
        And user selects the "Valuation" tab 

        And the user clicks on the "+ Add Record" button
        And clicks on the Create button
        And the user saves the record # click the save button
        Then the message "Please specify a Valuation Control Reference Number" should appear #fail
        And user enters "CQA116.11" in the "Evaluation Control Reference Number" field
        And user saves the record
        Then the message "Relation successfully created." should appear #success!

        And user selects "Danish Krone" from the "Currency" drop down box
        And user enters "116" in the "Amount" field
        And user enters "Cesar Villalobos" in the "Source" field
        And user clicks on "Cesar Villalobos" from autocomplete options
        And user enters "2016-01-01" in the "Date" field
        And user enters "2016-01-02" in the "Renewal Date" field
        And user selects "Current Value" from the "Type" drop down box
        And user enters "CQA116 \n Test" in the "Note" field
        And user saves the record
        Then the message "Valuation Control successfully saved" should appear #success!

        Then the "Currency" field should contain "Danish Krone"
        Then the "Amount" field should contain "116"
        Then the "Source" field should contain "Cesar Villalobos"
        Then the "Date" field should contain "2016-01-01"
        Then the "Renewal Date" field should contain "2016-01-02"
        Then the "Type" field should contain "Current Value"
        Then the "Note" field should contain "CQA116 \n Test"

        Then the "Depositor" field should contain "Jennifer Be"
        Then the "Exit Method" field should contain "Courier"
        Then the "Exit Reason" field should contain "Deaccession"
        Then the "Exit Date" field should contain "2016-01-05"
        Then the "Exit Note" field should contain "This \n is \n CQA115"
        Then the "Packing Note" field should contain "Packing for CQA115"

        ## Test 13
        And user selects "Euro" from the "Currency" drop down box
        And user enters "120" in the "Amount" field
        And user enters "Jennifer Be" in the "Source" field
        And user clicks on "Jennifer Be" from autocomplete options
        And user enters "2016-01-10" in the "Date" field
        And user enters "2017-01-02" in the "Renewal Date" field
        And user selects "Original Value" from the "Type" drop down box
        And user enters "CQA116 \n Test \n for subtest Test 13" in the "Note" field
        
        And user saves the record
        Then the message "Valuation Control successfully saved" should appear #success!

        Then the "Currency" field should contain "Euro"
        Then the "Amount" field should contain "120"
        Then the "Source" field should contain "Cesar Villalobos"
        Then the "Date" field should contain "2016-01-10"
        Then the "Renewal Date" field should contain "2017-01-02"
        Then the "Type" field should contain "Original Value"
        Then the "Note" field should contain "CQA116 \n Test \n for subtest Test 13"	    
	    And user clicks the "Go To Record" button
	    And user clicks the "Delete" button 
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
        Then close the browser



	Scenario: Testing links and "Go To Record" works #23
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA116_NE"
	    And user selects the "Valuation" tab
	    And the user clicks on result with text "CQA116.1"
	    Then the "Valuation Control Reference Number" field should contain "CQA116.1"
	    And the user clicks the "Go to record" button
	    Then the titlebar should contain "CQA116.1"
	    Then the "Valuation Control Reference Number" field should contain "CQA116.1"
	    Then close the browser	

	Scenario: Deleting relation via list #25
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA116_NE"
	    And user selects the "Valuation" tab 

	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA116.7" in the "Valuation Control Reference Number" field #might not work 
	    And the user saves the record
	    
	    And user clicks the "Delete Relation" button on the row that reads "CQA116.7" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then the "Related Valuation Control Records" area should contain "CQA116.7"

	    And user clicks the "Delete Relation" button on the row that reads "CQA116.7" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then the "Related Valuation Control Records" area should contain "CQA116.7"


	    And user clicks the "Delete Relation" button on the row that reads "CQA116.7" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "CQA116.7" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "CQA116.7" should not appear in the "Related Valuation Control Records" area #needs Stepdef #not logged

    	And user goes to the record with identification number "CQA116.7"
        And user selects the "Valuation" tab 
	    Then "CQA116_NE" should not appear in the "Related Valuation Control Records" area  #needs Stepdef
	    And user selects the "Current Record" tab

	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser


	Scenario: Deleting relation via record editor #27
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA116_NE"
	    Then "CQA116_NE" should be in the "Identification Number" field

	    And user selects the "Valuation" tab 
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA116.8" in the "Valuation Control Reference Number" field #might not work 
	    And the user saves the record
	    And the user clicks on result with text "CQA116.8"
	    
	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks cancel button # click cancel
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Valuation Control Records" area should contain "CQA116.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks close button # close button == close symbol?
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Valuation Control Records" area should contain "CQA116.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA116.8" should not appear in the "Procedures" area  #needs Stepdef
	    Then "CQA116.8" should not appear in the "Related Valuation Control Records" area

	    And user goes to the record with identification number "CQA116.8"
	    And user selects the "Valuation" tab 
	    Then the "Related Valuation Control Records" area should be empty
	    
	    And user selects the "Current Record" tab 
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 


	Scenario: Testing Functional Accessibility #31
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA116_NE"
	    And user selects the "Valuation Control" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "CQA116.9" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "CQA116.9" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "CQA116.9" in the top nav search field
	    Then the search results should contain "CQA116.9"
	    And the user clicks on result with text "CQA116.9"
	    Then "CQA116.9" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 