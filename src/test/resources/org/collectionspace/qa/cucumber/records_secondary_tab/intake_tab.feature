# Created Nov 5, 2015 by Cesar Villalobos
# Things that need to be done:
    # Right now, everything is mainly pseudocode that needs to be translated into tests still which I will begin to due tomorrow. 
    # I have marked things that I was not sure how to do with ' # // '.
    # These are steps in the writing of the test that I was not sure how to do
    # And/or if step definitons were missing
    # If there are unwritten StepDefs, then I marked them as such with an end comment
    # Tests 10/11/13/21: 
        # I'm not sure how to proceed with them because some of the things that they ask are no longer there
        # which I suspect were removed since they say (version 1.x) nex to them

@secondary
Feature: Intake Tab 
  
  # Test 1
  Scenario: The user will be working in the Intake Secondary Tab. They Will then try to add a record and is able to dismiss the dialog.

    Given user is on the "My CollectionSpace" page 
    And user goes to the record with identification number "04131995"
    And user selects the "Intake" tab 
    Then "041319951" should appear in the "Related Intake Records" area

    And user goes to the record with identification number "CQA110_E"
    And user selects the "Intake" tab 
    Then the "Related Intake Records" area should be empty


  # Begin Test 3:
    And the user clicks on the "Add record" button #needs step def
    And the user clicks the "close" button 
    Then no changes to the record will occur 

    And the user clicks on the "Add record" button
    And the user presses the "ESC" key 
    Then No changes to the record will occur 

  #Test 5 Scenario: Trying to add search for and add multiple intake records
    And the user clicks on the "Add record" button 
    And the user clicks the "search" button
    Then the search results should contain "041319951.2" 
    Then the search results should contain "041319951.3"

    And the user selects the box with result "041319951.3"  
    And the user selects the box with result "041319951.2"  
    And the user clicks the "Add to current record" button 
    Then the dialog should be dismissed

    Then "041319951.2" should appear in the "Related Intake Records" area 
    Then "041319951.3" should appear in the "Related Intake Records" area 
    Then "041319951.2" should appear in the "Procedures" area 
    Then "041319951.3" should appear in the "Procedures" area
    A ----- CONFLICT 
    nd the user clicks on result with text "041319951.2"
    Then an "Edit Intake Record" form should be displayed 
    Then the "Intake Entry Number" field should contain "041319951.2"

    And the user clicks on the result with text "041319951.3"
    Then an "Edit Intake Record" form should be displayed 
    Then the "Intake Entry Number" field should contain "041319951.3"

    And the user clicks the "Delete this relation." button
    Then a delete confirmation dialogue should appear
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then "041319951.3" should not appear in the "Related Intake Records" area 

    And the user clicks on result with text "041319951.2"
    And the user clicks the "Delete this relation." button
    Then a delete confirmation dialogue should appear 
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then "041319951.2" should not appear in the "Related Intake Records" area 



  # Test 7
  # this test might be wrong because it says that a new line should should be displayed below the listing of records
  Scenario: Warning when nagivating away form the new intake record
    Given the user is in the "My CollectionSpace" page
    And user enters "04131995" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And the user clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field
    And user selects the "Intake" tab 
    
    ###### VARIATION A ######
    And the user clicks on the "Add record" button
    And clicks on the Create button

    Then the message "Creating new record..." should be displayed
    Then the "Intake Entry Number" field should be empty
    And user enters "041319953.4" in the "Intake Entry Number" field
    And user selects the "Current Record" tab

    
    Then a leave confirmation dialogue should appear 
    And the user clicks the close button  
    Then the dialogue should be dismissed 
    And the user clicks the cancel button 
    Then the "Intake Entry Number" should contain "04131995.4"

    And user selects the "Current Record" tab
    And the user clicks the "Don't save" button 
    And user enters "041319953.4" in the top nav search field
    Then the search results should not contain "041319953.4"

    

    And user goes to the record with identification number "04131995"
    And user selects the "Intake" tab 

    And the user clicks on the "Add record" button
    And clicks on the Create button
    And user enters "041319953.4" in the "Intake Entry Number" field 
    And user selects the "Current Record" tab
    Then a leave confirmation dialogue should appear
    And the user clicks the save button
    And user selects the "Intake" tab 
    Then "041319953.4" should appear in the "Related Intake Records" area 

    And user goes to the record with identification number "041319953.4"
    And the user clicks the delete button
    Then a delete confirmation dialogue should appear
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then close the browser

  # Test 9
  Scenario: Testing the cancel changes button
    Given the user is in the "My CollectionSpace" page
    And user goes to the record with identification number "04131995"
    Then "04131995" should be in the "Identification Number" field

    And user selects the "Intake" tab 
    And the user clicks on the "Add record" button
    And clicks on the Create button
    # Then the dialog should be dismissed

    Then the message "Creating new record..." should be displayed
    Then the "cancel changes" button at the top of the page should not be clickable 
    Then the "cancel changes" button at the bottom of the page should not be clickable 
    And user enters "04131995.5" in the "Intake Entry Number" field
    
    Then the "cancel changes" button at the top of the page should be clickable 
    Then the "cancel changes" button at the bottom of the page should be clickable  
    And the user clicks the "cancel changes" button 
    Then the "Intake Entry Number" field should be empty


    And user enters "04131995.5" in the "Intake Entry Number" field
    And the user clicks the "save" button
    Then the "cancel changes" button at the top of the page should not be clickable 
    Then the "cancel changes" button at the bottom of the page should not be clickable 
   
    And the user clicks the "Go to record" button
    And the user clicks the "Delete" button 
    Then a delete confirmation dialogue should appear
    And the user clicks the confirmation delete button
    Then a deletion should be confirmed in a dialogue
    Then close the browser



    # Test 10: Does not seem to be a feature of the current CollectionSpace build...
  # Scenario: Create new from Used By/ Procedures area
    # Given the user is in the "My CollectionSpace" page
    # And user enters "04131995" in the top nav search field
    # And clicks on the top nav search submit button
    # Then the search results should contain "04131995"
    # And the user clicks on result with text "04131995"
    # Then "04131995" should be in the "Identification Number" field

    # Given that the user is on any existing record
    # And the user clicks the "Add" button in the "Used By"/Procedures area in the right side of the page
    # then a dialog should come up
    # and the user selects any kind of relationship
    # And under record type the user selects "Intake"
    And clicks on the Create button
    # Then you should be taken to the secondary intake tab
    # Then an empty form should be displayed under the list of related objects


    # Test 11 
    Scenario: Check Intake Entry Number and successful save
        Given user is on the "My CollectionSpace" page 
        And user goes to the record with identification number "04131995"
        And user selects the "Intake" tab 

        And the user clicks on the "+ Add Record" button
        And clicks on the Create button
        And the user saves the record # click the save button
        Then the message "Please specify an Intake Entry Number" should appear 

        And user enters "CQA110_11" in the "Intake Entry Number" field
        And the user clicks on the "Save" button

        Then the message "Relation successfully created." should appear
        Then "CQA110_11" should appear in the "Related Intake Records" area

        And user enters "2016-01-31" in the "Entry Date" field
        And user selects "Enquiry" from the "Entry Reason" drop down box
        And user selects "Found on doorstep" from the "Entry Method" drop down box
        And user enters "Cesar Villalobos" in the "Depositor" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "None" in the "Depositor Requirements" field
        And user enters "Cesar Villalobos" in the "Current Owner" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Testing CQA_110" in the "Entry Note" field
        And user enters "Testing testing" in the "Packing Note" field
        And user enters "2016-02-31" in the "Return Date" field
        And user enters "2015-12-31" in the "Field Collection Date" field
        And user enters "California" in the "Field collection place" field
        And user selects "commissioned" from the "Field collection Method" drop down box
        And user enters "This is a test for CQA-110" in the "Field collection note" field
        And user enters "110" in the "Field collection number" field
        And user enters "CQA-110 Testing" in the "Field collection event name"
        And user enters "Cesar Villalobos" in the "Field collection source" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Field collector" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Valuer" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Inc" in the "Insurer" field
        And user selects "Cesar Inc" from autocomplete options
        And user enters "110.1" in the "Reference Number" field #there are more than 1!
        And user enters "110110110" in the "Policy Number" field
        And user enters "2016-01-04" in the "Renewal Date" field
        And user enters "Taking care of CQA-110" in the "Insurance Note" field
        And user selects "Observed" from the "Condition Check Method" drop down box
        And user selects "Consideration" from the "Condition Check Reason" drop down box
        And user enters "Jennifer Be" in the "Condition Check Assessor" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "This is \n a test \n for 110" in the "Condition Check Note" field
        And user enters "2016-01-06" in the "Condition Check Date" field
        And user enters "04131995" in the "Condition Check Reference Number" field
        And user enters "CQA113.2" in the "Current Location" field
        And user selects "CQA113.2" from the "Current Location" drop down box
        And user selects "Dangerous" from the " Current Location Fitness" drop down box
        And user enters "For CQA-110" in the "Current Location Note" field
        And user enters "2016-01-22" in the "Location Date" field
        And user enters "California" in the "Normal Location" field
        And user selects "California" from autocomplete options
        And user clicks the "Save" button

        Then the message "Intake successfully saved" should appear

        # Then now make sure everything remains intact

        Then the "Entry Date" field should contain "2016-01-31"
        Then the "Entry Reason" field should contain "Enquiry"
        Then the "Entry Method" field should contain "Found on doorstep"
        Then the "Depositor" field should contain "Cesar Villalobos"
        Then the "Depositor Requirements" field should contain "None"
        Then the "Current Owner" field should contain "Cesar Villalobos"
        Then the "Entry Note" field should contain "Testing CQA_110"
        Then the "Packing Note" field should contain "Testing testing"
        Then the "Return Date" field should contain "2016-02-31"
        Then the "Field Collection Date" field should contain "2015-12-31"
        Then the "Entry Method" field should contain "commissioned"
        Then the "Field collection place" field should contain "California"
        Then the "Field collection Note" field should contain "This is a test for CQA-110"
        Then the "Field collection Number" field should contain "110"
        Then the "Field collection event name" field should contain "CQA-110 Testing"
        Then the "Field collection source" field should contain "Cesar Villalobos"
        Then the "Field collector" field should contain "Cesar Villalobos"
        Then the "Valuer" field should contain "Cesar Villalobos"
        Then the "Insurer" field should contain "Cesar Inc"
        Then the "Reference Number" field should contain "110.1"
        Then the "Policy Number" field should contain "110110110"
        Then the "Renewal Date" field should contain "2016-01-04"
        Then the "Insurance Note" field should contain "Taking care of CQA-110"
        Then the "Condition Check Method" field should contain "Observed"
        Then the "Condition Check Reason" field should contain "Consideration"
        Then the "Condition Check Assessor" field should contain "Jennifer Be"
        Then the "Condition Check Note" field should contain "This is \n a test \n for 110"
        Then the "Condition Check Date" field should contain "2016-01-06"
        Then the "Condition Check Reference Number" field should contain "04131995"
        Then the "Current Location" field should contain "CQA113.2"
        Then the "Current Location Fitness" field should contain "Dangerous"
        Then the "Current Location Note" field should contain "For CQA-110"
        Then the "Location Date" field should contain "2016-01-22"
        Then the "Normal Location" field should contain "California"
        Then the "Field collection method" field should contain "commissioned"
        

        Then close the browser

    #Test 13: Editing a saved record
        And user enters "2016-01-27" in the "Entry Date" field
        And user selects "Consideration" from the "Entry Reason" drop down box
        And user selects "In person" from the "Entry Method" drop down box
        And user enters "Cesar Villalobos" in the "Depositor" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Take care of CQA110-13" in the "Depositor Requirements" field
        And user enters "Cesar Villalobos" in the "Current Owner" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Testing CQA_110 Test 13" in the "Entry Note" field
        And user enters "Testing testing Test 13" in the "Packing Note" field
        And user enters "2017-02-31" in the "Return Date" field
        And user enters "2016-12-31" in the "Field Collection Date" field
        And user enters "California" in the "Field collection place" field
        And user selects "netted" from the "Field collection Method" drop down box
        And user enters "This is a test for CQA-110 Test 13" in the "Field collection note" field
        And user enters "110_13" in the "Field collection number" field
        And user enters "CQA-110 Testing Test 13" in the "Field collection event name"
        And user enters "Cesar Villalobos" in the "Field collection source" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Field collector" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Villalobos" in the "Valuer" field
        And user selects "Cesar Villalobos" from autocomplete options
        And user enters "Cesar Inc" in the "Insurer" field
        And user selects "Cesar Inc" from autocomplete options
        And user enters "110.1.13" in the "Reference Number" field #there are more than 1!
        And user enters "110110110.13" in the "Policy Number" field
        And user enters "2016-01-06" in the "Renewal Date" field
        And user enters "Taking care of CQA-110 Test 13" in the "Insurance Note" field
        And user selects "X-Rayed" from the "Condition Check Method" drop down box
        And user selects "Damaged in transit" from the "Condition Check Reason" drop down box
        And user enters "Jennifer Be" in the "Condition Check Assessor" field
        And user selects "Jennifer Be" from autocomplete options
        And user enters "This is \n a test \n for 110 \n Test 13." in the "Condition Check Note" field
        And user enters "2016-01-07" in the "Condition Check Date" field
        And user enters "04131995.13" in the "Condition Check Reference Number" field
        And user enters "CQA113.2" in the "Current Location" field
        And user selects "CQA113.2" from the "Current Location" drop down box
        And user selects "Reasonable" from the " Current Location Fitness" drop down box
        And user enters "For CQA-110 Test 13" in the "Current Location Note" field
        And user enters "2016-07-22" in the "Location Date" field
        And user enters "California" in the "Normal Location" field
        And user selects "California" from autocomplete options
        And user clicks the "Save" button

        Then the message "Intake successfully saved" should appear

        # Then now make sure everything remains intact

        Then the "Entry Date" field should contain "2016-01-27"
        Then the "Entry Reason" field should contain "Consideration"
        Then the "Entry Method" field should contain "In person"
        Then the "Depositor" field should contain "Cesar Villalobos"
        Then the "Depositor Requirements" field should contain "Take care of CQA110-13"
        Then the "Current Owner" field should contain "Cesar Villalobos"
        Then the "Entry Note" field should contain "Testing CQA_110 Test 13"
        Then the "Packing Note" field should contain "Testing testing Test 13"
        Then the "Return Date" field should contain "2017-02-31"
        Then the "Field Collection Date" field should contain "2016-12-31"
        Then the "Entry Method" field should contain "commissioned"
        Then the "Field collection place" field should contain "California"
        Then the "Field collection Note" field should contain "This is a test for CQA-110 Test 13"
        Then the "Field collection Number" field should contain "110_13"
        Then the "Field collection event name" field should contain "CQA-110 Testing Test 13"
        Then the "Field collection source" field should contain "Cesar Villalobos"
        Then the "Field collector" field should contain "Cesar Villalobos"
        Then the "Valuer" field should contain "Cesar Villalobos"
        Then the "Insurer" field should contain "Cesar Inc"
        Then the "Reference Number" field should contain "110.1.13"
        Then the "Policy Number" field should contain "110110110.13"
        Then the "Renewal Date" field should contain "2016-01-06"
        Then the "Insurance Note" field should contain "Taking care of CQA-110 Test 13"
        Then the "Condition Check Method" field should contain "X-Rayed"
        Then the "Condition Check Reason" field should contain "Damaged in transit"
        Then the "Condition Check Assessor" field should contain "Jennifer Be"
        Then the "Condition Check Note" field should contain "This is \n a test \n for 110 \n Test 13."
        Then the "Condition Check Date" field should contain "2016-01-07"
        Then the "Condition Check Reference Number" field should contain "04131995.13"
        Then the "Current Location" field should contain "CQA113.2"
        Then the "Current Location Fitness" field should contain "Reasonable"
        Then the "Current Location Note" field should contain "For CQA-110 Test 13"
        Then the "Location Date" field should contain "2016-07-22"
        Then the "Normal Location" field should contain "California"
        Then the "Field collection method" field should contain "netted"
        And the user clicks the "Delete this relation" button
        Then a delete confirmation dialogue should appear #needs Step
        And the user clicks the delete button        
        Then close the browser


  # Test 23
  Scenario: Testing links and "Go To Record" works 
    Given the user is in the "My CollectionSpace" page
    And user goes to the record with identification number "04131995"
    And user selects the "Intake" tab 
    And the user clicks on result with text "041319951"
    Then the "Intake Entry Number" field should contain "041319951"
    And the user clicks the "Go to record" button
    Then the titlebar should contain "041319951"
    Then the "Intake Entry Number" field should contain "041319951"
    Then close the browser

  # Test 25
  Scenario: Deleting relation via list
    Given the user is in the "My CollectionSpace" page
    And user goes to the record with identification number "04131995"


    And user selects the "Intake" tab 
    And the user clicks on the "Add record" button #needs step def
    And clicks on the Create button
    And user enters "0413199525" in the "Intake Entry Number" field #might not work 
    And the user saves the record
   
    And user clicks the "Delete Relation" button on the row that reads "0413199525" #Green "X" button. Needs step def
    Then delete confirmation dialogue should appear 
    And user clicks cancel button
    Then the dialog should be dismissed 
    Then the "Related Intake Records" are should contain "0413199525"


    And user clicks the "Delete Relation" button on the row that reads "0413199525" #Green "X" button. Needs step def
    Then delete confirmation dialogue should appear
    And user clicks close button
    Then the dialog should be dismissed
    Then the "Related Intake Records" are should contain "0413199525"

    And user clicks the "Delete Relation" button on the row that reads "0413199525" #Green "X" button. Needs step def
    Then delete confirmation dialogue should appear
    And user clicks on the delete button
    Then "0413199525" should not appear in the "Procedures" sidebar 
    Then "0413199525" should not appear in the "Related Intake Records" area

    And user goes to the record with identification number "0413199525"
    And the user clicks the delete button
    Then a delete confirmation dialogue should appear
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then close the browser


  # Test 27
  Scenario: Deleting relation via record editor
    Given the user is in the "My CollectionSpace" page
    And user goes to the record with identification number "04131995"

    And user selects the "Intake" tab 
    And the user clicks on the "Add record" button 
    And clicks on the Create button
    And user enters "0413199527" in the "Intake Entry Number" field
    And the user saves the record
    And the user clicks on result with text "0413199527"

    
    And the user clicks the "Delete this relation." button
    Then a delete confirmation dialogue should appear #needs Stepdef
    And user clicks cancel button 
    Then the dialog should be dismissed 
    Then the "Related Intake Records" area should contain "0413199527"

    And the user clicks the "Delete this relation." button
    Then a delete confirmation dialogue should appear #needs Stepdef
    And user clicks close button 
    Then the dialog should be dismissed 
    Then the "Related Intake Records" area should contain "0413199527"

    And the user clicks the "Delete this relation." button
    Then a delete confirmation dialogue should appear
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then "0413199527" should not appear in the "Procedures" area  
    Then "0413199527" should not appear in the "Related Intake Records" area

    And user goes to the record with identification number "0413199527"
    And user selects the "Intake" tab 
    Then the "Related Intake Records" area should be empty
    And user selects the "Current Record" tab 
    And the user clicks the delete button
    Then a delete confirmation dialogue should appear
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then close the browser 

  # Test 31
  Scenario: Testing Functional Accessibility. The user should only use the keyboard while doing the following commands
    Given the user is in the "My CollectionSpace" page
    And user enters "04131995" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And the user clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field
    And user selects the "Intake" tab 

    And the user presses the "Tab" key until reaching the "Add record" button  #needs Stepdef
    And the user presses the "Enter" key #needs Stepdef
    And the user presses the "Tab" key until reaching the "Create" button #needs Stepdef
    And the user presses the "Enter" key #needs Stepdef
    And the user presses the "Tab" key until reaching the "Run" button #needs Stepdef
    Then everything should have been clickable #needs Stepdef
    And user enters "0413199531" in the "Intake Entry Number" field #might not work 
    And the user saves the record
    And the user presses the "Tab" key until reaching the text field containing "0413199531" #needs Stepdef
    Then the text field should be clickable  #needs Stepdef

    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
    And user enters "0413199531" in the top nav search field
    Then the search results should contain "0413199531"
    And the user clicks on result with text "0413199531"
    Then "0413199531" should be in the "Identification Number" field   #needs Stepdef
    And the user clicks the delete button
    Then a delete confirmation dialogue should appear #needs Stepdef
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then close the browser 

