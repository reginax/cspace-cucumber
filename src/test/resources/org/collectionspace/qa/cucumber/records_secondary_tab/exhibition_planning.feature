# Created by Cesar Villalobos on 12/29/2015

@recordssecondarytab
Feature: Exhibition Planning Tab
  # Enter feature description here

 	Scenario: Working Exhibition Secondary Tab #1
        Given the user is in the "My CollectionSpace" page
       
        And user goes to the record with identification number "CQA105_E" #not empty
        And user selects the "Exhibition" tab     
        Then the "Related Exhibition Records" area should be empty
       
        And user goes to the record with identification number "CQA105_NE"
        And user selects the "Exhibition" tab
        Then "CQA105.1" should appear in the "Related Exhibition Records" area

        Then close the browser

	Scenario: Dismissing the dialog #3
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA105_NE"

        #Variation A
        And the user clicks on the "Add record" button 
        And the user clicks the "close" button 
        Then the "Related Exhibition Records" area should only contain "CQA105.1"

        #Variation B
        And the user clicks on the "Add record" button
        And the user presses the "ESC" key 
        Then the "Related Exhibition Records" area should only contain "CQA105.1"


	Scenario: Searching and adding multiple Exhibition records #5
        And the user clicks on the "Add record" button 
        And the user clicks the "search" button 
        Then the search results should contain "CQA105.3" 
        Then the search results should contain "CQA105.2" 

        And the user selects the box with result "CQA105.3" 
        And the user selects the box with result "CQA105.2"  
        And the user clicks the "Add to current record" button #needs Step def #7

        #Expected, Group #1
        Then the dialog should be dismissed 
        Then "CQA105.3" should appear in the "Related Exhibition Records" area
        Then "CQA105.2" should appear in the "Related Exhibition Records" area 
        Then "CQA105.3" should appear in the "Procedures" area 
        Then "CQA105.2" should appear in the "Procedures" area 


        And the user clicks on result with text "CQA105.3" 
        Then an "Edit Exhibition Record" form should be displayed 
        Then the "Exhibition Number" field should contain "CQA105.3"
        And the user clicks the "Delete this relation." button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then "CQA105.3" should not appear in the "Related Exhibition Records" area 


        And the user clicks on result with text "CQA105.2" 
        Then an "Edit Exhibition Record" form should be displayed 
        Then the "Exhibition Number" field should contain "CQA105.2"
        And the user clicks the "Delete this relation." button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then "CQA105.2" should not appear in the "Related Exhibition Records" area 
        Then close the browser

	Scenario: Warning when navigating away from new Exhibition record #7
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA105_NE"
        Then "CQA105_NE" should be in the "Identification Number" field
        And user selects the "Exhibition" tab 
        
        And the user clicks on the "Add record" button
        And clicks on the "Create New" button
        
        Then the dialog should be dismissed
        Then the message "Creating new record..." should be displayed
        
        Then the "Exhibition Number" field should be empty
        And user enters "CQA105.4" in the "Exhibition Number" field


        #Variation A
        And user selects the "Current Record" tab
        Then a leave confirmation dialogue should appear 
        And the user clicks the "close" button  
        Then the "Exhibition Number" field should contain "CQA105.4"


        #Variation B
        And user selects the "Current Record" tab
        Then a leave confirmation dialogue should appear #needs StepDef
        And the user clicks the "cancel" button  #might not work
        Then the "Exhibition Number" field should contain "CQA105.4"

        ## Variation D
        And user selects the "Current Record" tab
        And the user clicks the "Don't save" button 
        And user selects the "Exhibition" tab 
        Then "CQA105.4" should not appear in the "Related Exhibition Records" area


        #Variation C
        And the user clicks on the "Add record" button
        And clicks on the Create button
        And user enters "CQA105.4" in the "Exhibition Number" field 
        And user selects the "Current Record" tab
        And the user clicks the "save" button

        And user selects the "Exhibition" tab 
        Then "CQA105.4" should appear in the "Related Exhibition Records" area 

        And user goes to the record with identification number "CQA105.4"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then close the browser

	Scenario: Cancel Changes button #9
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA105_NE"
        And user selects the "Exhibition" tab
        And the user clicks on the "Add record" button
        And clicks on the "Create new" button

        # Variation A
        Then the message "Creating new record..." should be displayed
        Then the "cancel changes" button at the bottom of the page should not be clickable
        Then the "cancel changes" button at the top of the page should not be clickable
        
        And user enters "CQA105.5" in the "Exhibition Number" field
        And the user clicks the "cancel changes" button 
        Then the "Exhibition Number" field should be empty

        # Variation B
        And user enters "CQA105.5" in the "Exhibition Number" field
        And the user clicks the "save" button 
        Then the "cancel changes" button at the top of the page should not be clickable 
        Then the "cancel changes" button at the bottom of the page should not be clickable 
   
   
        And the user clicks the "Go to record" button
        And the user clicks the "Delete" button 
        Then a delete confirmation dialogue should appear
        And the user clicks the confirmation delete button
        Then a deletion should be confirmed in a dialogue
        Then close the browser


	Scenario: Check Exhibition Number and successful save, and all fields saved on edited Exhibition record #13

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And user goes to the record with identification number "CQA115_NE" 
        And user selects the "Media Handling" tab 

        And the user clicks on the "+ Add Record" button
        And clicks on the Create button
        And the user saves the record # click the save button
        Then the message "___" should appear #fail
        And user enters "CQA115.11" in the "Exhibition Number" field
        And user saves the record
        Then the message "______" should appear #success!
      
        
        And user enters "CQA115_Test_11" in the "Exhibition Title" field
        And user selects "Permanent" from the "Exhibition Type" drop down box

        And user enters "CQA115_Room" in the "Venues" field
        And user selects "CQA115_Room" from autocomplete options
        And user enters "2016-01-01" in the "Opening Date" field
        And user enters "2016-02-02" in the "Closing Date" field
        And user enters "115" in the "Attendance" field
        And user enters "www.CollectionSpace.org" in the "Web Address" field
        And user enters "CQA115 Working Group" in the "Working Group Title" field
        And user enters "CQA115 Notes Field" in the "Notes" field 
        And user enters "Cesar Villalobos" in the "Sponsor" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Organizer" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Person" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user selects "Curator" from the "Role" drop down box
        And user enters "CQA-115 Planning Notes" in the "Planning Notes" field
        And user enters "CQA-115 Curatorial Notes" in the "Curatorial Notes" field
        And user enters "CQA-115 Boilerplate Text" in the "Boilerplate Text" field
        And user enters "CQA-115 General Notes" in the "General Notes" field
        And user enters "CQA115.11.2" in the "Rotation Name" field
        And user enters "2016-03-03" in the "Start Date" field
        And user enters "2016-04-04" in the "End Date" field        
        And user enters "CQA115 Notes Field" in the "Notes" field
        And user enters "Cesar Villalobos" in the "Reference" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user selects "Catalog" from the "Reference Type" drop down box
        And user enters "CQA115 Ref Box" in the "Reference Note" field
        And user enters "CQA115.11.3" in the "Section" field
        And user enters "CQA115.11.4" in the "Location" field
        And user enters "CQA115.11.5" in the "Objects" field
        And user enters "CQA115.11.6" in the "Remarks" field
        And user selects "Labels written" from the "Status" drop down box #Conflicting status boxes?
        And user enters "2016-05-05" in the "Status Date" field
        And user enters "CQA115.11.6" in the "Remarks" field
        And user enters "Yes" in the "Object" field
        And user enters "CQA115" in the "Name" field
        And user enters "2016-06-06" in the "Cons. Check" field
        And user selects "Needed" from the "Cons. Treatment" field
        And user selects "Done" from the "Mount?" field
        And user enters "CQA115.11.3" in the "Section" field
        And user enters "CQA115.11.9" in the "Case" field
        And user enters "CQA115.11.10" in the "Seq. #" field
        And user enters "CQA115.11.11" in the "Rotation" field
        And user enters "CQA115.11.12" in the "Note" field

        And user saves the record
        Then the message "______" should appear #succes

        Then the "Exhibition Title" field should contain "CQA115_Test_11"
        Then the "Exhibition Type" field should contain "Permanent"
        Then the "CQA115_Room" field should contain "CQA115_Room"
        Then the "Opening Date" field should contain "2016-01-01"
        Then the "Closing Date" field should contain "2016-02-02"
        Then the "Attendance" field should contain "115"
        Then the "Web Address" field should contain "www.CollectionSpace.org"
        Then the "Working Group Title" field should contain "CQA115 Working Group"
        Then the "Notes" field should contain "CQA115 Notes Field"
        Then the "Sponsor" field should contain "Cesar Villalobos"
        Then the "Organizer" field should contain "Cesar Villalobos"
        Then the "Person" field should contain "Cesar Villalobos"
        Then the "Role" field should contain "Curator"
        Then the "Planning Notes" field should contain "CQA-115 Planning Notes"
        Then the "Curatorial Notes" field should contain "CQA-115 Curatorial Notes"
        Then the "Boilerplate Text" field should contain "CQA-115 Boilerplate Text"
        Then the "General Notes" field should contain "CQA-115 General Notes"
        Then the "Rotation Name" field should contain "CQA115.11.2"
        Then the "Start Date" field should contain "2016-03-03"
        Then the "End Date" field should contain "2016-04-04"
        Then the "Reference" field should contain "Cesar Villalobos"
        Then the "Reference Type" field should contain "Catalog"
        Then the "Reference Note" field should contain "CQA115 Ref Box"
        Then the "Section" field should contain "CQA115.11.3"
        Then the "Location" field should contain "CQA115.11.4"
        Then the "Objects" field should contain "CQA115.11.5"
        Then the "Remarks" field should contain "CQA115.11.6"
        Then the "Status" field should contain "Labels written"
        Then the "Status Date" field should contain "2016-05-05"
        Then the "Object" field should contain "Yes"
        Then the "Name" field should contain "CQA115"
        Then the "Cons. Check" field should contain "2016-06-06"
        Then the "Cons. Treatment" field should contain "Needed"
        Then the "Mount?" field should contain "Done"
        Then the "Seq. #" field should contain "CQA115.11.10"
        Then the "Rotation" field should contain "CQA115.11.11"
        Then the "Note" field should contain "CQA115.11.12"
        Then the "Case" field should contain "CQA115.11.9"

        ###Test 13
        
        And user enters "CQA115_Test_11 Test 13" in the "Exhibition Title" field
        And user selects "Temporary" from the "Exhibition Type" drop down box
        And user enters "CQA115_Room" in the "Venues" field
        And user selects "CQA115_Room" from autocomplete options
        And user enters "2017-01-01" in the "Opening Date" field
        And user enters "2017-02-02" in the "Closing Date" field
        And user enters "115_13" in the "Attendance" field
        And user enters "www.CollectionSpace.org" in the "Web Address" field
        And user enters "CQA115 Working Group 13" in the "Working Group Title" field
        And user enters "CQA115 Notes Field 13" in the "Notes" field 
        And user enters "Jennifer Be" in the "Sponsor" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "Jennifer Be" in the "Organizer" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "Jennifer Be" in the "Person" field
        And user selects "Jennifer Be" from autocomplete options
        And user selects "Educator" from the "Role" drop down box
        And user enters "CQA-115_13 Planning Notes" in the "Planning Notes" field
        And user enters "CQA-115_13 Curatorial Notes" in the "Curatorial Notes" field
        And user enters "CQA-115_13 Boilerplate Text" in the "Boilerplate Text" field
        And user enters "CQA-115_13 General Notes" in the "General Notes" field
        And user enters "CQA115.11.13.2" in the "Rotation Name" field
        And user enters "2017-03-03" in the "Start Date" field
        And user enters "2017-04-04" in the "End Date" field        
        And user enters "CQA115 Notes Field 13" in the "Notes" field
        And user enters "Jennifer Be" in the "Reference" field
        And user selects "Jennifer Be" from autocomplete options
        And user selects "Catalog" from the "Reference Type" drop down box
        And user enters "CQA115 Ref Box Test 13" in the "Reference Note" field
        And user enters "CQA115.11.13.3" in the "Section" field
        And user enters "CQA115.11.13.4" in the "Location" field
        And user enters "CQA115.11.13.5" in the "Objects" field
        And user enters "CQA115.11.13.6" in the "Remarks" field
        And user selects "Labels written" from the "Status" drop down box #Conflicting status boxes?
        And user enters "2017-05-05" in the "Status Date" field
        And user enters "CQA115.11.13.6" in the "Remarks" field
        And user enters "No" in the "Object" field
        And user enters "CQA115" in the "Name" field
        And user enters "2017-06-06" in the "Cons. Check" field
        And user selects "Not needed" from the "Cons. Treatment" field
        And user selects "Needed" from the "Mount?" field
        And user enters "CQA115.11.13.3" in the "Section" field
        And user enters "CQA115.11.13.9" in the "Case" field
        And user enters "CQA115.11.13.10" in the "Seq. #" field
        And user enters "CQA115.11.13.11" in the "Rotation" field
        And user enters "CQA115.11.13.12" in the "Note" field

        And user saves the record
        Then the message "______" should appear #succes

        Then the "Exhibition Title" field should contain "CQA115_Test_11 Test 13"
        Then the "Exhibition Type" field should contain "Temporary"
        Then the "CQA115_Room" field should contain "CQA115_Room"
        Then the "Opening Date" field should contain "2017-01-01"
        Then the "Closing Date" field should contain "2017-02-02"
        Then the "Attendance" field should contain "115_13"
        Then the "Web Address" field should contain "www.CollectionSpace.org"
        Then the "Working Group Title" field should contain "CQA115 Working Group 13"
        Then the "Notes" field should contain "CQA115 Notes Field 13"
        Then the "Sponsor" field should contain "Jennifer Be"
        Then the "Organizer" field should contain "Jennifer Be"
        Then the "Person" field should contain "Jennifer Be"
        Then the "Role" field should contain "Educator"
        Then the "Planning Notes" field should contain "CQA-115_13 Planning Notes"
        Then the "Curatorial Notes" field should contain "CQA-115_13 Curatorial Notes"
        Then the "Boilerplate Text" field should contain "CQA-115_13 Boilerplate Text"
        Then the "General Notes" field should contain "CQA-115_13 General Notes"
        Then the "Rotation Name" field should contain "CQA115.11.13.2"
        Then the "Start Date" field should contain "2017-03-03"
        Then the "End Date" field should contain "2017-04-04"
        Then the "Reference" field should contain "Jennifer Be"
        Then the "Reference Type" field should contain "Catalog"
        Then the "Reference Note" field should contain "CQA115 Ref Box Test 13"
        Then the "Section" field should contain "CQA115.11.13.3"
        Then the "Location" field should contain "CQA115.11.13.4"
        Then the "Objects" field should contain "CQA115.11.13.5"
        Then the "Remarks" field should contain "CQA115.11.13.6"
        Then the "Status" field should contain "Labels written"
        Then the "Status Date" field should contain "2017-05-05"
        Then the "Object" field should contain "No"
        Then the "Name" field should contain "CQA115"
        Then the "Cons. Check" field should contain "2017-06-06"
        Then the "Cons. Treatment" field should contain "Not needed"
        Then the "Mount?" field should contain "Needed"
        Then the "Seq. #" field should contain "CQA115.11.13.10"
        Then the "Rotation" field should contain "CQA115.11.13.11"
        Then the "Note" field should contain "CQA115.11.13.12"
        Then the "Case" field should contain "CQA115.11.13.9"
        Then close the browser


	# Scenario: Listing displays correct fields #21
		#skip

	Scenario: Testing links and "Go To Record" works #23
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA105_NE"
        And user selects the "Exhibition" tab 
        And the user clicks on result with text "CQA105.1"
        Then the "Exhibition Number" field should contain "CQA105.1"
        And the user clicks the "Go to record" button
        Then the titlebar should contain "CQA105.1"
        Then the "Exhibition Number" field should contain "CQA105.1"
        Then close the browser  

	Scenario: Deleting Relation via list #25
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA105_NE"
        And user selects the "Exhibition" tab 

        And the user clicks on the "Add record" button
        And clicks on the Create button
        And user enters "CQA105.7" in the "Exhibition Number" field
        And the user saves the record
        
        And user clicks the "Delete Relation" button on the row that reads "CQA105.7" #Green "X" button. Needs step def
        Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
        And user clicks cancel button
        Then the dialog should be dismissed
        Then the "Related Exhibition Records" area should contain "CQA105.7"

        And user clicks the "Delete Relation" button on the row that reads "CQA105.7" #Green "X" button. Needs step def. Again
        Then delete confirmation dialogue should appear
        And user clicks the "close" button # close button == close symbol? #Needs stepdef???
        Then the dialog should be dismissed
        Then the "Related Exhibition Records" area should contain "CQA105.7"


        And user clicks the "Delete Relation" button on the row that reads "CQA105.7" #Green "X" button. Needs step def. Last time.
        Then delete confirmation dialogue should appear
        And user clicks on the delete button
        Then "CQA105.7" should not appear in the "Procedures" sidebar
        Then "CQA105.7" should not appear in the "Related Exhibition Records" area #needs Stepdef #not logged

        And user goes to the record with identification number "CQA105.7"
        And user selects the "Exhibition" tab 
        Then "CQA105_NE" should not appear in the "Related Exhibition Records" area  #needs Stepdef
        And user selects the "Current Record" tab

        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then close the browser

	Scenario: Deleting relation via record editor #27
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA105_NE"
        Then "CQA105_NE" should be in the "Identification Number" field

        And user selects the "Exhibition" tab 
        And the user clicks on the "Add record" button #needs step def
        And clicks on the Create button
        And user enters "CQA105.8" in the "Exhibition Number" field #might not work 
        And the user saves the record
        And the user clicks on result with text "CQA105.8"
        
        And the user clicks the "Delete this relation" button
        Then a delete confirmation dialogue should appear #needs Stepdef
        And user clicks cancel button # click cancel
        Then the dialog should be dismissed #needs stepdef
        Then the "Related Exhibition Records" area should contain "CQA105.8"

        And the user clicks the "Delete this relation" button
        Then a delete confirmation dialogue should appear #needs Stepdef
        And user clicks close button # close button == close symbol?
        Then the dialog should be dismissed #needs stepdef
        Then the "Related Exhibition Records" area should contain "CQA105.8"

        And the user clicks the "Delete this relation" button
        Then a delete confirmation dialogue should appear #needs Step
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        # Then the record editor should no longer be displayed (below list)
        Then "CQA105.8" should not appear in the "Procedures" area  #needs Stepdef
        Then "CQA105.8" should not appear in the "Related Exhibition Records" area

        And user goes to the record with identification number "CQA105.8"
        And user selects the "Exhibition" tab 
        Then the "Related Exhibition Records" area should be empty
        
        And user selects the "Current Record" tab 
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
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
	    And user enters "CQA105.9" in the "Exhibition Number" field #might not work 
	    And the user saves the record
	    And the user presses the "Tab" key until reaching the text field containing "CQA105.9" #needs Stepdef
	    Then the text field should be clickable  #needs Stepdef

	    And selects "Exhibition" from the top nav search record type select field # And using the top right search area, select Exhibition from the drop down
	    And user enters "CQA105.9" in the top nav search field
	    Then the search results should contain "CQA105.9"
	    And the user clicks on result with text "CQA105.9"
	    Then "CQA105.9" should be in the "Identification Number" field   #needs Stepdef
	    And the user clicks the delete button
	    Then a delete confirmation dialogue should appear #needs Stepdef
	    And the user clicks the delete button 
	    Then the deletion should be confirmed in a dialogue
	    Then close the browser 
