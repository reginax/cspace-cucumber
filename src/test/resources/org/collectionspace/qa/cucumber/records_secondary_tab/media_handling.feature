# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Media Handling Page Tab
  # Enter feature description here

	Scenario:  Working Media Handling Secondary tab #1
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA114_NE"

	    And user selects the "Media Handling" tab
	    Then "CQA114.1" should appear in the "Related Media Handling Records" area

	    And user goes to the record with identification number "CQA114_E" #not empty
	    Then the "Related Media Handling Records" area should be empty
	    Then close the browser

	Scenario:  Dismissing the dialog #2
  		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA114_NE"

		#Variation A
		And the user clicks on the "Add record" button #needs step def
	    And the user clicks the "close" button 
	    Then the "Related Media Handling Records" area should only contain "CQA114.1"

	    #Variation B
	    And the user clicks on the "Add record" button
	    And the user presses the "ESC" key # Needs StepDef
	    Then the "Related Media Handling Records" area should only contain "CQA114.1"

	Scenario: Searching and adding multiple Media Handling records #3
		And the user clicks on the "Add record" button #NeedsStepDef
	    And the user clicks the "search" button #needs StepDef maybe? 
	    Then the search results should contain "CQA114.3" 
	    Then the search results should contain "CQA114.2" 

	    And the user selects the box with result "CQA114.3" 
	    And the user selects the box with result "CQA114.2"  
	    And the user clicks the "Add to current record" button #needs Step def #7

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA114.3" should appear in the "Related Media Handling Records" area  #needs Stepdef
	    Then "CQA114.2" should appear in the "Related Media Handling Records" area  #needs Stepdef
	    Then "CQA114.3" should appear in the "Procedures" area  #needs Stepdef
	    Then "CQA114.2" should appear in the "Procedures" area  #needs Stepdef

	    And the user clicks on result with text "CQA114.3" 
	    Then an "Edit Media Record" form should be displayed 
	    Then the "Identification Number" field should contain "CQA114.3"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA114.3" should not appear in the "Related Media Handling Records" area

	    And the user clicks on result with text "CQA114.2" 
	    Then an "Edit Media Record" form should be displayed 
	    Then the "Identification Number" field should contain "CQA114.2"
	    And the user clicks the "Delete this relation." button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then "CQA114.2" should not appear in the "Related Media Handling Records" area 

	    Then close the browser



	Scenario: Warning when navigating away from new Media Handling record #4
  		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA114_NE"
	    Then "CQA114_NE" should be in the "Identification Number" field
	    And user selects the "Media Handling" tab

	    And the user clicks on the "Add record" button #needs step def
		And clicks on the "Create New" button

		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed # needs StepDef
		And user enters "CQA114.4" in the "Media Handling Number" field 


	    #Variation A
    	And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear 
	    And the user clicks the "close" button  
	    Then the "Identification Number" field should contain "CQA114.4"

		#Variation B
		And user selects the "Current Record" tab
	    Then a leave confirmation dialogue should appear #needs StepDef
	    And the user clicks the "cancel" button  #might not work
	    Then the "Identification Number" field should contain "CQA114.4"

	    ## Variation D
	    And user selects the "Current Record" tab
	    And the user clicks the "Don't save" button 
	   	And user selects the "Media Handling" tab 
	    Then "CQA114.4" should not appear in the "Related Media Handling Records" area


		#Variation C
		And the user clicks on the "Add record" button
    	And clicks on the Create button
    	And user enters "CQA114.4" in the "Identification Number" field 
		And user selects the "Current Record" tab
		And the user clicks the "save" button

	    And user selects the "Media Handling" tab 
	    Then "CQA114.4" should appear in the "Related Media Handling Records" area 

	    And user goes to the record with identification number "CQA114.4"
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser

	Scenario: Cancel changes button #5
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA114_NE"
		And user selects the "Media Handling" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the bottom of the page should not be clickable
	    Then the "cancel changes" button at the top of the page should not be clickable
	    
	    And user enters "CQA114.5" in the "Identification Number" field #might not work
	    And the user clicks the "cancel changes" button 
    	Then the "Identification Number" field should be empty

	    # Variation B 
	    And user enters "CQA114.5" in the "Identification Number" field #might not work
	    And the user clicks the "save" button 
	    Then the "cancel changes" button at the top of the page should not be clickable 
    	Then the "cancel changes" button at the bottom of the page should not be clickable 
   

	    And the user clicks the "Go to record" button
	    And the user clicks the "Delete" button 
	    Then a delete confirmation dialogue should appear
	    And the user clicks the confirmation delete button
	    Then a deletion should be confirmed in a dialogue
	    Then close the browser


	Scenario: Check Identification Number and successful save, and edited Media Handling record 
        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And user goes to the record with identification number "CQA114_NE" 
        And user selects the "Media Handling" tab 

        And the user clicks on the "+ Add Record" button
        And clicks on the Create button
        And the user saves the record # click the save button
        Then the message "Please specify an Identification Number" should appear #fail
        And user enters "CQA114.11" in the "Identification Number" field
        And user saves the record
        Then the message "Relation successfully created." should appear #success!  
        
        And user enters "CQA114 Form Filling" in the "Title" field
        And user selects "base" from the "Part" drop down box
        And user selects "area" from the "Dimension" drop down box
        And user selects "Ruler" from the "Method" drop down box
        And user selects "carats" from the "Dimension Unit" drop down box
        And user enters "Cesar Villalobos" in the "Measured By" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "114.2" in the "Value" field
        And user enters "114.3" in the "Value Quantifier" field
        And user enters "2016-01-01" in the "Date" field
        And user enters "CQA114 Summary box" in the "Summary" field
        And user enters "Cesar Villalobos" in the "Contributor" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Creator" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Publisher" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user selects "Dataset" from the "Types" drop down box
        And user enters "CQA114 Coverage Box" in the "Coverage" field
        And user enters "2016-02-02" in the "Dates" field
        And user enters "CQA114 Source Box" in the "Source" field
        And user enters "CQA114.1" in the "Relations" field
        And user enters "None" in the "Subjects" field     
        And user selects "French" from the "Languages" drop down box
        And user enters "No copyright here" in the "Copyright statement" field
        And user enters "Cesar Villalobos" in the "Rights holder" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "CQA114 description box" in the "Description" field   
        And user saves the record
        Then the message "Media Handling successfully saved" should appear #succes

        ## test 11 thens

        Then the "Title" field should contain "CQA114 Form Filling"
        Then the "Part" field should contain "base"
        Then the "Dimension" field should contain "area"
        Then the "Method" field should contain "Ruler"
        Then the "Dimension Unit" field should contain "carats"
        Then the "Measured By" field should contain "Cesar Villalobos"
        Then the "Value" field should contain "114.2"
        Then the "Value Quantifier" field should contain "114.3"
        Then the "Date" field should contain "2016-01-01"
        Then the "Summary" field should contain "CQA114 Summary box"
        Then the "Types" field should contain "Dataset"
        Then the "Coverage" field should contain "CQA114 Coverage Box"
        Then the "Dates" field should contain "2016-02-02"
        Then the "Source" field should contain "CQA114 Source Box"
        Then the "Creator" field should contain "Cesar Villalobos"
        Then the "Relations" field should contain "CQA114.1"
        Then the "Subjects" field should contain "None"
        Then the "Publisher" field should contain "Cesar Villalobos"
        Then the "Copyright statement" field should contain "No copyright here"
        Then the "Rights holder" field should contain "Cesar Villalobos"
        Then the "Description" field should contain ""
        Then the "Description" field should contain "CQA114 description box"
        Then the "Languages" field should contain "French"

        #### Test 13
        And user enters "CQA114 Form Filling Part 1" in the "Title" 
        And user selects "frame" from the "Part" drop down box
        And user selects "base" from the "Dimension" drop down box
        And user selects "Odometers" from the "Method" drop down box
        And user selects "feet" from the "Dimension Unit" drop down box
        And user enters "Jennifer Be" in the "Measured By" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "114.2.2" in the "Value" field
        And user enters "114.3.3" in the "Value Quantifier" field
        And user enters "2017-01-01" in the "Date" field
        And user enters "CQA114 Summary box Pt 2" in the "Summary" field
        And user enters "Jennifer Be" in the "Contributor" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "Jennifer Be" in the "Creator" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "Jennifer Be" in the "Publisher" field
        And user selects "Jennifer Be" from autocomplete options
        And user selects "Dataset" from the "Types" drop down box
        And user enters "CQA114 Coverage Box edited" in the "Coverage" field
        And user enters "2017-02-02" in the "Dates" field
        And user enters "CQA114 Source Box edited" in the "Source" field
        And user enters "CQA114.1" in the "Relations" field
        And user enters "None" in the "Subjects" field     
        And user selects "German" from the "Languages" drop down box
        And user enters "All copyrights deserved" in the "Copyright statement" field
        And user enters "Jennifer Be" in the "Rights holder" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "CQA114 description box pt 2" in the "Description" field   
        And user saves the record
        Then the message "Media Handling successfully saved" should appear #succes

        ## test 13 thens

        Then the "Title" field should contain "CQA114 Form Filling Part 1"
        Then the "Part" field should contain "frame"
        Then the "Dimension" field should contain "base"
        Then the "Method" field should contain "Odometers"
        Then the "Dimension Unit" field should contain "feet"
        Then the "Measured By" field should contain "Jennifer Be"
        Then the "Value" field should contain "114.2.2"
        Then the "Value Quantifier" field should contain "114.3.3"
        Then the "Date" field should contain "2017-01-01"
        Then the "Summary" field should contain "CQA114 Summary box Pt 2"
        Then the "Types" field should contain "Dataset"
        Then the "Coverage" field should contain "CQA114 Coverage Box edited"
        Then the "Dates" field should contain "2017-02-02"
        Then the "Source" field should contain "CQA114 Source Box edited"
        Then the "Creator" field should contain "Jennifer Be"
        Then the "Relations" field should contain "CQA114.1"
        Then the "Subjects" field should contain "None"
        Then the "Publisher" field should contain "Jennifer Be"
        Then the "Copyright statement" field should contain "All copyrights deserved"
        Then the "Rights holder" field should contain "Jennifer Be"
        Then the "Description" field should contain "CQA114 description box pt 2"
        Then the "Languages" field should contain "German"
        And the user clicks the "Go To Record" button	    
	    And the user clicks the "Delete" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button         
        Then close the browser

	Scenario: Testing links and "Go To Record" works #10
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA114_NE"
	    And user selects the "Media Handling" tab 
	    And the user clicks on result with text "CQA114.1"
	    Then the "Identification Number" field should contain "CQA114.1"
	    And the user clicks the "Go to record" button
	    Then the titlebar should contain "CQA114.1"
	    Then the "Identification Number" field should contain "CQA114.1"
	    Then close the browser	

	Scenario: Deleting relation via list #11
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA114_NE"
	    And user selects the "Media Handling" tab 

	    And the user clicks on the "Add record" button 
	    And clicks on the Create button
	    And user enters "CQA114.7" in the "Identification Number" field 
	    And the user saves the record
	    
	    And user clicks the "Delete Relation" button on the row that reads "CQA114.7" #Green "X" button. Needs step def
	    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
	    And user clicks cancel button
	    Then the dialog should be dismissed #needs Step def
	    Then the "Related Media Handling Records" area should contain "CQA114.7"

	    And user clicks the "Delete Relation" button on the row that reads "CQA114.7" #Green "X" button. Needs step def. Again
	    Then delete confirmation dialogue should appear
	    And user clicks the "close" button # close button == close symbol? #Needs stepdef???
	    Then the dialog should be dismissed
	    Then the "Related Media Handling Records" area should contain "CQA114.7"


	    And user clicks the "Delete Relation" button on the row that reads "CQA114.7" #Green "X" button. Needs step def. Last time.
	    Then delete confirmation dialogue should appear
	    And user clicks on the delete button
	    Then "CQA114.7" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
	    Then "CQA114.7" should not appear in the "Related Media Handling Records" area #needs Stepdef #not logged

    	And user goes to the record with identification number "CQA114.7"
        And user selects the "Media Handling" tab 
	    Then "CQA114_NE" should not appear in the "Related Media Handling Records" area  #needs Stepdef
	    And user selects the "Current Record" tab

	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser

	Scenario: Deleting relation via record editor #Test 27
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA114_NE"
	    Then "CQA114_NE" should be in the "Identification Number" field

	    And user selects the "Media Handling" tab
	    And the user clicks on the "Add record" button #needs step def
	    And clicks on the Create button
	    And user enters "CQA114.8" in the "Identification Number" field #might not work 
	    And the user saves the record
	    And the user clicks on result with text "CQA114.8"
	    
	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear
	    And user clicks cancel button 
	    Then the dialog should be dismissed
	    Then the "Related Media Handling Records" area should contain "CQA114.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear 
	    And user clicks close button # close button == close symbol?
	    Then the dialog should be dismissed 
	    Then the "Related Media Handling Records" area should contain "CQA114.8"

	    And the user clicks the "Delete this relation" button
	    Then a delete confirmation dialogue should appear #needs Step
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA114.8" should not appear in the "Procedures" area  #needs Stepdef
	    Then "CQA114.8" should not appear in the "Related Media Handling Records" area

	    And user goes to the record with identification number "CQA114.8"
	    And user selects the "Media Handling" tab
	    Then the "Related Media Handling Records" area should be empty
	    
	    And user selects the "Current Record" tab 
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 

	Scenario: Testing Functional Accessibility #31
		Given the user is in the "My CollectionSpace" page
	    And user goes to the record with identification number "CQA114_NE"
	    And user selects the "Media Handling" tab 

	    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
	    And the user presses the "Enter" key #needs Stepdef
	    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
	    Then everything should have been clickable #needs Stepdef
	    And user enters "CQA114.9" in the "Intake Entry Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "CQA114.9" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
	    And user enters "CQA114.9" in the top nav search field
	    Then the search results should contain "CQA114.9"
	    And the user clicks on result with text "CQA114.9"
	    Then "CQA114.9" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 