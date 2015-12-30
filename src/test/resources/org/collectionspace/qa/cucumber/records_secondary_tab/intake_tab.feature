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
  Scenario: Create new from Used By/ Procedures area
    Given the user is in the "My CollectionSpace" page
    And user enters "04131995" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And the user clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field

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
    # Given the user is in the "Secondary Intake Tab" of any record
    # And the user clicks on the "+ Add Record" button
    # And the user selects any kind of relationshop 
    And clicks on the Create button
    And the user saves the record # click the save button
    # Then you should get an error mesage telling you to fill out the Intake Entry Number

    # And the user fills in at least the intake entry number fiele  
    And the user saves the record # click the save button
    # Then a successful saved message should be displayed
    # Then the "New related Record" line in the list above the form should change to display the information of the newly created record

    # And the user fills out the entire form based on the following
    # In the authority fields either enter existing authorities or add new authorities
        # Try to use as many different types of aurhorities as possible
    # In the select boxes (drop downs) select something other than the first
    # In the text area (multi text fields) write a multiline text
    # In the regular text area write regular text
    And the user saves the record # click the BOTTOM save button 
    # And the user clicks the Save button # might be the same as above
    # And a successful save message appears
    # Then all fields should display the values you entered


  # Test 13, 21
  Scenario: All fields saved on edited Intake record. 
      After this, We check if the Listing displaus correct values
      Then we test the links and make sure that the "Go To Record" works
    # Go to any existing record with a related intake record by clicking its id/entry nymber
      And the user clicks the "Intake" tab    # Click the intake tab
    # Select an existing intake record
    # Modify the information in the form based on the following:
      # In the authority fields, enter either existing authorities or create new ones
      # try to create as many new ones as you can
      # In the select boxes (drop downs) select something other than the first
      # In the text area (multi text fields) write a multiline text
      # In the regular text area write regular text   
    And the user saves the record # click the BOTTOM save button 
    # And a successful save message appears
    # Then all fields should display the values you entered  

  # Test 21  (Continued from 13)
    # Take note of the time stamp of the last save
    # Then in the listing of the Used By/Procedures in the right frame, the entry of the newly create record should be displayed with: Intake Entry #, Record Type and Last edit date


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

