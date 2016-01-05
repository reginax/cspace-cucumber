# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Object Exit Page Tab
  # Enter feature description here

  Scenario: Working Object Exit Secondary Tab #1
		Given the user is in the "My CollectionSpace" page
	   
	    And user goes to the record with identification number "CQA115_E" #empty
	    And user selects the "Object Exit" tab	    
	    Then the "Related Object Exit Records" area should be empty
	   

		And user goes to the record with identification number "CQA115_NE"
	    And user selects the "Object Exit" tab
	    Then "CQA115.1" should appear in the "Related Object Exit Records" area
	    Then close the browser

  Scenario: Dismissing the dialog #3
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA115_NE"

		#Variation A
		And the user clicks on the "Add record" button 
	    And the user clicks the "close" button 
	    Then the "Related Object Exit Records" area should only contain "CQA115.1"

	    #Variation B
	    And the user clicks on the "Add record" button
	    And the user presses the "ESC" key 
	    Then the "Related Object Exit Records" area should only contain "CQA115.1"


  Scenario: Searching and adding multiple Object Exit records #5
		And the user clicks on the "Add record" button 
	    And the user clicks the "search" button 
	    Then the search results should contain "CQA115.3" 
	    Then the search results should contain "CQA115.2" 

	    And the user selects the box with result "CQA115.3" 
	    And the user selects the box with result "CQA115.2"  
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA115.3" should appear in the "Related Object Exit Records" area
	    Then "CQA115.2" should appear in the "Related Object Exit Records" area 
	    Then "CQA115.3" should appear in the "Procedures" area 
	    Then "CQA115.2" should appear in the "Procedures" area 


	    And the user clicks on result with text "CQA115.3" 
	    Then an "Edit Object Exit Record" form should be displayed 
	    Then the "Object Exit Number" field should contain "CQA115.3"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA115.3" should not appear in the "Related Object Exit Records" area 


	    And the user clicks on result with text "CQA115.2" 
	    Then an "Edit Object Exit Record" form should be displayed 
	    Then the "Object Exit Number" field should contain "CQA115.2"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA115.2" should not appear in the "Related Object Exit Records" area 

	    Then close the browser


  Scenario: Warning when navigating away from Object Exit record #7
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA115_NE"
	    Then "CQA115_NE" should be in the "Identification Number" field
	    And user selects the "Object Exit" tab 
	    
	    And the user clicks on the "Add record" button
		And clicks on the "Create New" button
		
		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed
	    
		Then the "Exit Number" field should be empty
	    And user enters "CQA115.4" in the "Exit Number" field


	    #Variation A
    	And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear 
	    And the user clicks the "close" button  
	    Then the "Exit Number" field should contain "CQA115.4"


		#Variation B
		And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear #needs StepDef
	    And the user clicks the "cancel" button  #might not work
	    Then the "Exit Number" field should contain "CQA115.4"

	    ## Variation D
	    And user selects the "Current Record" tab
	    And the user clicks the "Don't save" button 
	   	And user selects the "Object Exit" tab 
	    Then "CQA115.4" should not appear in the "Related Object Exit Records" area


		#Variation C
		And the user clicks on the "Add record" button
    	And clicks on the Create button
    	And user enters "CQA115.4" in the "Exit Number" field 
		And user selects the "Current Record" tab
		And the user clicks the "save" button

	    And user selects the "Object Exit" tab 
	    Then "CQA115.4" should appear in the "Related Object Exit Records" area 

	    And user goes to the record with identification number "CQA115.4"
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser

  Scenario: Cancel changes button #9
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA115_NE"
		And user selects the "Object Exit" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the bottom of the page should not be clickable
	    Then the "cancel changes" button at the top of the page should not be clickable
	    
	    And user enters "CQA115.5" in the "Exit Number" field #might not work
	    And the user clicks the "cancel changes" button 
    	Then the "Exit Number" field should be empty

	    # Variation B
	    And user enters "CQA115.5" in the "Exit Number" field #might not work
	    And the user clicks the "save" button 
	    Then the "cancel changes" button at the top of the page should not be clickable 
    	Then the "cancel changes" button at the bottom of the page should not be clickable 
   
   
	    And the user clicks the "Go to record" button
	    And the user clicks the "Delete" button 
	    Then a delete confirmation dialogue should appear
	    And the user clicks the confirmation delete button
	    Then a deletion should be confirmed in a dialogue
	    Then close the browser

	Scenario: Check Exit Number and successful save and All fields saved on edited Object Exit record #13

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And user goes to the record with identification number "CQA115_NE"
        And user selects the "Object Exit" tab 

        And the user clicks on the "+ Add Record" button
        And clicks on the Create button
        And the user saves the record # click the save button
        Then the message "___" should appear
        And user enters "CQA115.11" in the "Exit Number" field
        And user saves the record
        Then the message "______" should appear #success!

        And user enters "2016-01-05" in the "Exit Date" field
        And user enters "Cesar Villalobos" in the "Current Owner" field
        And user clicks on "Cesar Villalobos" from autocomplete options
        And user enters "Jennifer Be" in the "Depositor" field
        And user clicks on "Jennifer Be" from the autocomplete options
        And user selects "Courier" from the "Exit Method" drop down box
        And user selects "Deaccession" from the "Exit Reason" drop down box
        And user enters "This \n is \n CQA115" in the "Exit Note" field
        And user enters "Packing for CQA115" in the "Packing Note" field

        And user saves the record
        Then the message "______" should appear #success!



        Then the "Exit Number" field should contain "CQA115.11"
        Then the "Current Owner" field should contain "Cesar Villalobos"
        Then the "Depositor" field should contain "Jennifer Be"
        Then the "Exit Method" field should contain "Courier"
        Then the "Exit Reason" field should contain "Deaccession"
        Then the "Exit Date" field should contain "2016-01-05"
        Then the "Exit Note" field should contain "This \n is \n CQA115"
        Then the "Packing Note" field should contain "Packing for CQA115"

        ## Test 13

        And user enters "2016-01-10" in the "Exit Date" field
        And user enters "Jennifer Be" in the "Current Owner" field
        And user clicks on "Jennifer Be" from autocomplete options
        And user enters "Cesar Villalobos" in the "Depositor" field
        And user clicks on "Cesar Villalobos" from the autocomplete options
        And user selects "Post" from the "Exit Method" drop down box
        And user selects "Disposal" from the "Exit Reason" drop down box
        And user enters "This \n is \n CQA115 \n Test 13" in the "Exit Note" field
        And user enters "Packing for CQA115 Test 13" in the "Packing Note" field

        And user saves the record
        Then the message "______" should appear #success!

        Then the "Exit Number" field should contain "CQA115.11"
        Then the "Current Owner" field should contain "Jennifer Be"
        Then the "Depositor" field should contain "Cesar Villalobos"
        Then the "Exit Method" field should contain "Post"
        Then the "Exit Reason" field should contain "Disposal"
        Then the "Exit Date" field should contain "2016-01-10"
        Then the "Exit Note" field should contain "This \n is \n CQA115 \n Test 13"
        Then the "Packing Note" field should contain "Packing for CQA115 Test 13"
        Then close the browser




  Scenario: Testing links and "Go To Record" works #23
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA115_NE"
	    And user selects the "Object Exit" tab 
	    And the user clicks on result with text "CQA115.1"
	    Then the "Exit Number" field should contain "CQA115.1"
	    And the user clicks the "Go to record" button
	    Then the titlebar should contain "CQA115.1"
	    Then close the browser	

	Scenario: Deleting relation via list #25
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA115_NE"
	    And user selects the "Object Exit" tab 

	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA115.7" in the "Exit Number" field #might not work 
	    And the user saves the record
	    
	    And user clicks the "Delete Relation" button on the row that reads "CQA115.7" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then the "Related Object Exit Records" area should contain "CQA115.7"

	    And user clicks the "Delete Relation" button on the row that reads "CQA115.7" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then the "Related Object Exit Records" area should contain "CQA115.7"

	    And user clicks the "Delete Relation" button on the row that reads "CQA115.7" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "CQA115.7" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "CQA115.7" should not appear in the "Related Object Exit Records" area #needs Stepdef #not logged

		And user goes to the record with identification number "CQA115.7"
	    And user selects the "Object Exit" tab 
	    Then "CQA115_NE" should not appear in the "Related Object Exit Records" area  #needs Stepdef
	    And user selects the "Current Record" tab

	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser

	Scenario: Deleting relation via record editor #27
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA115_NE"
	    Then "CQA115_NE" should be in the "Identification Number" field

	    And user selects the "Object Exit" tab 
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA115.8" in the "Exit Number" field #might not work 
	    And the user saves the record
	    And the user clicks on result with text "CQA115.8"
	    
	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks cancel button # click cancel
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Object Exit Records" area should contain "CQA115.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And user clicks close button # close button == close symbol?
	    Then the dialog should be dismissed #needs stepdef
	    Then the "Related Object Exit Records" area should contain "CQA115.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA115.8" should not appear in the "Procedures" area  #needs Stepdef
	    Then "CQA115.8" should not appear in the "Related Object Exit Records" area

	    And user goes to the record with identification number "CQA115.8"
	    And user selects the "Object Exit" tab 
	    Then the "Related Object Exit Records" area should be empty
	    
	    And user selects the "Current Record" tab 
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 

  Scenario: Testing Functional Accessibility #31
	    Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA115_NE"
	    And user selects the "Object Exit" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "CQA115.9" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "CQA115.9" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "CQA115.9" in the top nav search field
	    Then the search results should contain "CQA115.9"
	    And the user clicks on result with text "CQA115.9"
	    Then "CQA115.9" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 





















