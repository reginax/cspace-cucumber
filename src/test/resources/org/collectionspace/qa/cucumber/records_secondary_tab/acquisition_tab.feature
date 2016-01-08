# Created by Cesar Villalobos on November 20th 2015

@recordssecondarytab
Feature: Acquisition Tab
  # Enter feature description here

    Scenario: Working Acquisition Secondary Tab #1 
        Given the user is in the "My CollectionSpace" page
       
        And user goes to the record with identification number "CQA93_E" #not empty
        And user selects the "Acquisition" tab     
        Then the "Related Acquisition Records" area should be empty
       
        And user goes to the record with identification number "CQA93_NE"
        And user selects the "Acquisition" tab
        Then "CQA93.1" should appear in the "Related Acquisition Records" area

        Then close the browser

    Scenario: Dismissing the dialog #3 
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA93_NE"

        #Variation A
        And the user clicks on the "Add record" button 
        And the user clicks the "close" button 
        Then the "Related Acquisition Records" area should only contain "CQA93.1"

        #Variation B
        And the user clicks on the "Add record" button
        And the user presses the "ESC" key 
        Then the "Related Acquisition Records" area should only contain "CQA93.1"

    Scenario: Searching and adding multiple Acquisition records #5 
        And the user clicks on the "Add record" button 
        And the user clicks the "search" button 
        Then the search results should contain "CQA93.3" 
        Then the search results should contain "CQA93.2" 

        And the user selects the box with result "CQA93.3" 
        And the user selects the box with result "CQA93.2"  
        And the user clicks the "Add to current record" button #needs Step def #7

        #Expected, Group #1
        Then the dialog should be dismissed 
        Then "CQA93.3" should appear in the "Related Acquisition Records" area
        Then "CQA93.2" should appear in the "Related Acquisition Records" area 
        Then "CQA93.3" should appear in the "Procedures" area 
        Then "CQA93.2" should appear in the "Procedures" area 


        And the user clicks on result with text "CQA93.3" 
        Then an "Edit Acquisition Record" form should be displayed 
        Then the "Acquisition Reference Number" field should contain "CQA93.3"
        And the user clicks the "Delete this relation." button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then "CQA93.3" should not appear in the "Related Acquisition Records" area 


        And the user clicks on result with text "CQA93.2" 
        Then an "Edit Acquisition Record" form should be displayed 
        Then the "Acquisition Reference Number" field should contain "CQA93.2"
        And the user clicks the "Delete this relation." button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then "CQA93.2" should not appear in the "Related Acquisition Records" area 
        Then close the browser

    Scenario: Warning when navigating away from new Acquisition record #7 
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA93_NE"
        Then "CQA93_NE" should be in the "Identification Number" field
        And user selects the "Acquisition" tab 
        
        And the user clicks on the "Add record" button
        And clicks on the "Create New" button
        
        Then the dialog should be dismissed
        Then the message "Creating new record..." should be displayed
        
        Then the "Acquisition Reference Number" field should be empty
        And user enters "CQA93.4" in the "Acquisition Reference Number" field


        #Variation A
        And user selects the "Current Record" tab
        Then a leave confirmation dialogue should appear 
        And the user clicks the5e "close" button  
        Then the "Acquisition Reference Number" field should contain "CQA93.4"


        #Variation B
        And user selects the "Current Record" tab
        Then a leave confirmation dialogue should appear #needs StepDef
        And the user clicks the "cancel" button  #might not work
        Then the "Acquisition Reference Number" field should contain "CQA93.4"

        ## Variation D
        And user selects the "Current Record" tab
        And the user clicks the "Don't save" button 
        And user selects the "Acquisition" tab 
        Then "CQA93.4" should not appear in the "Related Acquisition Records" area


        #Variation C
        And the user clicks on the "Add record" button
        And clicks on the Create button
        And user enters "CQA93.4" in the "Acquisition Reference Number" field 
        And user selects the "Current Record" tab
        And the user clicks the "save" button

        And user selects the "Acquisition" tab 
        Then "CQA93.4" should appear in the "Related Acquisition Records" area 

        And user goes to the record with identification number "CQA93.4"
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then close the browser

    Scenario: Cancel changes button #9 
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA93_NE"
        And user selects the "Acquisition" tab
        And the user clicks on the "Add record" button #needs step def
        And clicks on the "Create new" button

        # Variation A
        Then the message "Creating new record..." should be displayed
        Then the "cancel changes" button at the bottom of the page should not be clickable
        Then the "cancel changes" button at the top of the page should not be clickable
        
        And user enters "CQA93.5" in the "Acquisition Reference Number" field
        And the user clicks the "cancel changes" button 
        Then the "Acquisition Reference Number" field should be empty

        # Variation B
        And user enters "CQA93.5" in the "Acquisition Reference Number" field
        And the user clicks the "save" button 
        Then the "cancel changes" button at the top of the page should not be clickable 
        Then the "cancel changes" button at the bottom of the page should not be clickable 
   
   
        And the user clicks the "Go to record" button
        And the user clicks the "Delete" button 
        Then a delete confirmation dialogue should appear
        And the user clicks the confirmation delete button
        Then a deletion should be confirmed in a dialogue
        Then close the browser

    Scenario: Check Acquisition Reference Number and successful save and All fields saved on edited Acquisition record 

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And user goes to the record with identification number "CQA93_NE" 
        And user selects the "Acquisition" tab 

        And the user clicks on the "+ Add Record" button
        And clicks on the Create button
        And the user saves the record # click the save button
        Then the message "Please specify an Acquisition Reference Number" should appear #fail
        And user enters "CQA93.11" in the "Acquisition Reference Number" field
        And user saves the record
        Then the message "Relation successfully created." should appear #success!
        
        And user enters "2016-01-01" in the "Accession Date" field
        And user enters "Cesar Villalobos" in the "Acquisition Authorizer" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "2016-02-02" in the "Acquisition authorizer date" field
        And user enters "2016-03-03" in the "Acquisition Date" field
        And user selects "Purchase" from the "Acquisition Method" drop down box
        And user enters "Cesar Villalobos" in the "Acquisition Source" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Owner" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "93.1" in the "Transfer of Title Number" field
        And user enters "93.2" in the "Group purchase price value" field
        And user enters "93.3" in the "Object offer price value" field
        And user enters "93.4" in the "Object purchaser offer price value" field
        And user enters "93.5" in the "Object purchase price value" field
        And user enters "93.6" in the "Original object purchase price" field
        And user enters "CQA93_11 Reason \n none" in the "Acquisition Reason" field
        And user enters "CQA93_11 Acquisition Note \n none" in the "Acquisition Note" field
        And user enters "CQA93_11 Provisos \n none" in the "Acquisition Provisos" field
        And user selects "Euro" from the "Currency" drop down box
        And user enters "93.7" in the "Value" field
        And user enters "CQA93 Fund" in the "Funding source" field
        And user selects "CQA93 Fund" from autocomplete options
        And user enters "None" in the "Source provisos" field
        And user enters "93.8" in the "Credit Line" field
        And user enters "CQA93 Digging Event" in the "Field collection event name" field
        
        And user saves the record
        Then the message "Acquisition successfully saved" should appear #success!

        Then the "Accession Date" field should contain "2016-01-01"
        Then the "Acquisition Authorizer" field should contain "Cesar Villalobos"
        Then the "Acquisition authorizer date" field should contain "2016-02-02"
        Then the "Acquisition Date" field should contain "2016-03-03"
        Then the "Acquisition Method" field should contain "Purchase"
        Then the "Acquisition Source" field should contain "Cesar Villalobos"
        Then the "Owner" field should contain "Cesar Villalobos"
        Then the "ransfer of Title Number" field should contain "93.1"
        Then the "Group purchase price value" field should contain "93.2"
        Then the "Object offer price value" field should contain "93.3"
        Then the "Object purchaser offer price value" field should contain "93.4"
        Then the "Object purchase price value" field should contain "93.5"
        Then the "Original object purchase price" field should contain "93.6"
        Then the "Acquisition Reason" field should contain "CQA93_11 Reason \n none"
        Then the "Acquisition Note" field should contain "CQA93_11 Acquisition Note \n none"
        Then the "Acquisition provisos" field should contain "CQA93_11 Provisos \n none"
        Then the "Currency" field should contain "Euro"
        Then the "Value" field should contain "93.7"
        Then the "Funding source" field should contain "CQA93 Fund"
        Then the "Source provisos" field should contain "None"
        Then the "Credit Line" field should contain "93.8"
        Then the "Field collection event name" field should contain "CQA93 Digging Event"

        # Test 13 --> Successful save on edited record
        
        And user enters "2017-01-01" in the "Accession Date" field
        And user enters "Jennifer Be" in the "Acquisition Authorizer" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "2017-02-02" in the "Acquisition authorizer date" field
        And user enters "2017-03-03" in the "Acquisition Date" field
        And user selects "Purchase" from the "Acquisition Method" drop down box
        And user enters "Jennifer Be" in the "Acquisition Source" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "Jennifer Be" in the "Owner" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "93.13.1" in the "Transfer of Title Number" field
        And user enters "93.13.2" in the "Group purchase price value" field
        And user enters "93.13.3" in the "Object offer price value" field
        And user enters "93.13.4" in the "Object purchaser offer price value" field
        And user enters "93.13.5" in the "Object purchase price value" field
        And user enters "93.13.6" in the "Original object purchase price" field
        And user enters "CQA93_13 Reason \n none" in the "Acquisition Reason" field
        And user enters "CQA93_13 Acquisition Note \n none" in the "Acquisition Note" field
        And user enters "CQA93_13 Provisos \n none" in the "Acquisition Provisos" field
        And user selects "Euro" from the "Currency" drop down box
        And user enters "93.13.7" in the "Value" field
        And user enters "CQA93 Fund" in the "Funding source" field
        And user selects "CQA93 Fund" from autocomplete options
        And user enters "Some" in the "Source provisos" field
        And user enters "93.13.8" in the "Credit Line" field
        And user enters "CQA93 Digging Event" in the "Field collection event name" field
        And user saves the record
        Then the message "Acquisition successfully saved" should appear #success!

        Then the "Accession Date" field should contain "2017-01-01"
        Then the "Acquisition Authorizer" field should contain "Jennifer Be"
        Then the "Acquisition authorizer date" field should contain "2017-02-02"
        Then the "Acquisition Date" field should contain "2017-03-03"
        Then the "Acquisition Method" field should contain "Purchase"
        Then the "Acquisition Source" field should contain "Jennifer Be"
        Then the "Owner" field should contain "Jennifer Be"
        Then the "ransfer of Title Number" field should contain "93.13.1"
        Then the "Group purchase price value" field should contain "93.13.2"
        Then the "Object offer price value" field should contain "93.13.3"
        Then the "Object purchaser offer price value" field should contain "93.13.4"
        Then the "Object purchase price value" field should contain "93.13.5"
        Then the "Original object purchase price" field should contain "93.13.6"
        Then the "Acquisition Reason" field should contain "CQA93_13 Reason \n none"
        Then the "Acquisition Note" field should contain "CQA93_13 Acquisition Note \n none"
        Then the "Acquisition provisos" field should contain "CQA93_13 Provisos \n none"
        Then the "Currency" field should contain "Euro"
        Then the "Value" field should contain "93.13.7"
        Then the "Funding source" field should contain "CQA93 Fund"
        Then the "Source provisos" field should contain "Some"
        Then the "Credit Line" field should contain "93.13.8"
        Then the "Field collection event name" field should contain "CQA93 Digging Event"
        And the user clicks the "Go To Record" button
        And the user clicks the "Delete" button
        Then a delete confirmation dialogue should appear #needs Step
        And the user clicks the delete button        
        Then close the browser
        


    # Scenario: Listing displays correct fields #21 
        #skip?


    Scenario: Testing links and "Go To Record" works #23 
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA93_NE"
        And user selects the "Acquisition" tab 
        And the user clicks on result with text "CQA93.1"
        Then the "Acquisition Reference Number" field should contain "CQA93.1"
        And the user clicks the "Go to record" button
        Then the titlebar should contain "CQA93.1"
        Then the "Acquisition Reference Number" field should contain "CQA93.1"
        Then close the browser  

    Scenario: Deleting Relation via List #25 
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA93_NE"
        And user selects the "Acquisition" tab 

        And the user clicks on the "Add record" button #needs step def
        And clicks on the Create button
        And user enters "CQA93.7" in the "Acquisition Reference Number" field #might not work 
        And the user saves the record
        
        And user clicks the "Delete Relation" button on the row that reads "CQA93.7" #Green "X" button. Needs step def
        Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
        And user clicks cancel button
        Then the dialog should be dismissed #needs Step def
        Then the "Related Acquisition Records" area should contain "CQA93.7"

        And user clicks the "Delete Relation" button on the row that reads "CQA93.7" #Green "X" button. Needs step def. Again
        Then delete confirmation dialogue should appear
        And user clicks the "close" button # close button == close symbol? #Needs stepdef???
        Then the dialog should be dismissed
        Then the "Related Acquisition Records" area should contain "CQA93.7"


        And user clicks the "Delete Relation" button on the row that reads "CQA93.7" #Green "X" button. Needs step def. Last time.
        Then delete confirmation dialogue should appear
        And user clicks on the delete button
        Then "CQA93.7" should not appear in the "Procedures" sidebar #needs StepDef #notlogged
        Then "CQA93.7" should not appear in the "Related Acquisition Records" area #needs Stepdef #not logged

        And user goes to the record with identification number "CQA93.7"
        And user selects the "Acquisition" tab 
        Then "CQA93_NE" should not appear in the "Related Acquisition Records" area  #needs Stepdef
        And user selects the "Current Record" tab

        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then close the browser

    Scenario: Deleting Relation via record editor #27 
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA93_NE"
        Then "CQA93_NE" should be in the "Identification Number" field

        And user selects the "Acquisition" tab 
        And the user clicks on the "Add record" button #needs step def
        And clicks on the Create button
        And user enters "CQA93.8" in the "Acquisition Reference Number" field #might not work 
        And the user saves the record
        And the user clicks on result with text "CQA93.8"
        
        And the user clicks the "Delete this relation" button
        Then a delete confirmation dialogue should appear #needs Stepdef
        And user clicks cancel button # click cancel
        Then the dialog should be dismissed #needs stepdef
        Then the "Related Acquisition Records" area should contain "CQA93.8"

        And the user clicks the "Delete this relation" button
        Then a delete confirmation dialogue should appear #needs Stepdef
        And user clicks close button # close button == close symbol?
        Then the dialog should be dismissed #needs stepdef
        Then the "Related Acquisition Records" area should contain "CQA93.8"

        And the user clicks the "Delete this relation" button
        Then a delete confirmation dialogue should appear #needs Step
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        # Then the record editor should no longer be displayed (below list)
        Then "CQA93.8" should not appear in the "Procedures" area  #needs Stepdef
        Then "CQA93.8" should not appear in the "Related Acquisition Records" area

        And user goes to the record with identification number "CQA93.8"
        And user selects the "Acquisition" tab 
        Then the "Related Acquisition Records" area should be empty
        
        And user selects the "Current Record" tab 
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then close the browser 

    Scenario: Testing Functional Accessibility #31 
        Given the user is in the "My CollectionSpace" page
        And user goes to the record with identification number "CQA93_NE"
        And user selects the "Object Exit" tab 

        And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
        And the user presses the "Enter" key #needs Stepdef
        And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
        And the user presses the "Enter" key #needs Stepdef
        And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
        Then everything should have been clickable #needs Stepdef
        And user enters "CQA93.9" in the "Acquisition Reference Number" field #might not work 
        And the user saves the record
        And the user presses the "Tab" key until reaching the text field containing "CQA93.9" #needs Stepdef
        Then the text field should be clickable  #needs Stepdef

        And selects "Acquisition" from the top nav search record type select field # And using the top right search area, select intake from the drop down
        And user enters "CQA93.9" in the top nav search field
        Then the search results should contain "CQA93.9"
        And the user clicks on result with text "CQA93.9"
        Then "CQA93.9" should be in the "Identification Number" field   #needs Stepdef
        And the user clicks the delete button
        Then a delete confirmation dialogue should appear #needs Stepdef
        And the user clicks the delete button 
        Then the deletion should be confirmed in a dialogue
        Then close the browser 
