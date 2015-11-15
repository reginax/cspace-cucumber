# Created Nov 5, 2015 by Cesar Villalobos
# Things that need to be done:
    # Right now, everything is mainly pseudocode that needs to be translated into tests still which I will begin to due tomorrow. 
    # I have marked things that I was not sure how to do with ' # // '.
    # These are steps in the writing of the test that I was not sure how to do
    # And/or if step definitons were missing
    # If there are unwritten StepDefs, then I marked them as such with an end comment



@secondary
Feature: Intake Tab 
  
  # Test 1
  Scenario: The user will be working in the Intake Secondary Tab. They Will then try to add a record and is able to dismiss the dialog.

    Given user is on the "My CollectionSpace" page 
    And user enters "04131995" in the top nav search field
    And selects "Cataloging" from the top nav search record type select field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And the user clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field
    And user selects the "Intake" tab 
    Then if there are no related Intake records "No related records selected" should be displayed # needs StepDef

  # Begin Test 3:
    And the user clicks on the "Add record" button #needs step def
    # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
    And the user clicks the "close" button 
    Then no changes to the record will occur #StepDefs

    And the user clicks on the "Add record" button
  # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
    And the user clicks the "ESC" button on their keyboard # Needs StepDef
    Then No changes to the record will occur #Needs stepDef

  #Test 5 Scenario: Trying to add search for and add multiple intake records
    And the user clicks on the "Add record" button #NeedsStepDef
    # THIS DOESNT GIVE ME AN OPTION: # And the user selects any kind of relationship
    And the user clicks the "search" button #needs StepDef maybe? 
    Then the search results should contain "041319952"
    # And the user marks at least two of the records  
    And the user clicks the "Add to current record" button
    # Then the dialog should be dismissed
    # Then the newly added records should be listed in the Related Records list near the top of the screen
    # Then In the "Used By" area of the sidebar on the right side of the page, the newly added records should also be properly displayed
    And the user clicks on result with text "041319952" # Might not work
    Then an "Edit Intake Record" form should be displayed 
    # Then an "Edit Intake Record" form should be displayed undernearth the listing, filled out with data from the seelected Intake record
    # And the user clicks another idenficiation number from the list
    # Then the Edit Intake Record form should be updated to correspoind to the new record you clicked


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
  And the user clicks on the "Add record" button #needs step def
  # Then a dialog should appear
  # Doesn't let me do this# And the user selects any kind of relationship
  And clicks on the Create button
  # Then the dialog should be dismissed
  Then the message "Creating new record..." should be displayed # needs StepDef
  # Then an empty Intake record form should be displayed below the listing of records
  And user enters "041319953" in the "Intake Entry Number" field #might not work 
  # And the user clicks any link/item to navigate away from the current page
  Then a leave confirmation dialogue should appear #needs StepDef
  And the user clicks the close button  #might not work
  Then the dialogue should be dismissed #needs Stepdef
  And the user clicks the cancel button #should work
  And the user clicks the "Don't save" button #needs stepDef
  # Then the record should not be saved: 
  And user enters "041319953" in the top nav search field
  Then the search results should not contain "041319953"

  And user enters "04131995" in the top nav search field
  And clicks on the top nav search submit button
  Then the search results should contain "04131995"
  And the user clicks on result with text "04131995"
  Then "04131995" should be in the "Identification Number" field
  And user selects the "Intake" tab 
  And the user clicks on the "Add record" button #needs step def
  # Then a dialog should appear
  And clicks on the Create button
  And user enters "041319953" in the "Intake Entry Number" field #might not work 
  # And the user clicks any link/item to navigate away from the current page
  Then a leave confirmation dialogue should appear #needs StepDef
  And the user clicks the save button
  And user enters "041319953" in the top nav search field
  Then the search results should contain "041319953"
  And the user clicks on result with text "04131995"
  And the user clicks the delete button
  Then a delete confirmation dialogue should appear
  And the user clicks the delete button 
  Then the deletion should be confirmed in a dialogue


  # Test 9
  Scenario: Testing the cancel changes button
  Given the user is in the "My CollectionSpace" page
  And user enters "04131995" in the top nav search field
  And clicks on the top nav search submit button
  Then the search results should contain "04131995"
  And the user clicks on result with text "04131995"
  Then "04131995" should be in the "Identification Number" field
  And user selects the "Intake" tab 
  And the user clicks on the "Add record" button #needs step def
  And clicks on the Create button
  # Then the dialog should be dismissed
  Then the message "Creating new record..." should be displayed # needs StepDef
  Then the "cancel changes" button at the top of the page should not be clickable #needs Stepdef
  Then the "cancel changes" button at the bottom of the page should not be clickable #needs Stepdef
  And user enters "041319953" in the "Intake Entry Number" field #might not work
  Then the "cancel changes" button at the top of the page should be clickable #needs Stepdef
  Then the "cancel changes" button at the bottom of the page should be clickable  #needs Stepdef
  And the user clicks the "cancel changes" button # do i need to spedify which button?  #needs step def
  # Then the related record should be reverted to before changes were made

  And user enters "041319954" in the "Intake Entry Number" field #might not work 
  And the user saves the record
  Then the "cancel changes" button at the top of the page should not be clickable #needs Stepdef
  Then the "cancel changes" button at the bottom of the page should not be clickable #needs Stepdef
  And the user clicks the "Go to record" button
  And the user clicks the "Delete" button 
  Then a delete confirmation dialogue should appear
  And the user clicks the confirmation delete button
  Then a deletion should be confirmed in a dialogue
  Then close the browser



  # Test 10: Does not seem to be a feature of the current CollectionSpace build...
  Scenario: Create new from Used By/ Procedures area
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


  # Test 13, 21 and 23
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


  # Test 23 (Continued from 21)
    # Given that the user is on the secondary Intake Tab
    # And the user clicks the ID number of a record in the list of related records
    # Then the record from the record you clicked should be shown below

    # And the user clicks te "Go To Record" link, above the intake form
    # Then you should be redirected to the Intake record, which should now be displayed  in the Primary Tab with the field values intact

  # Test 25
  Scenario: Deleting relation via list
    Given the user is in the "My CollectionSpace" page
    And user enters "04131995" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And the user clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field
    And user selects the "Intake" tab 
    And the user clicks on the "Add record" button #needs step def
    And clicks on the Create button
    And user enters "0413199525" in the "Intake Entry Number" field #might not work 
    And the user saves the record
    And user clicks the "Delete Relation" button on the row that reads "0413199525" #Green "X" button. Needs step def
    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation
    And user clicks cancel button
    Then the dialog should be dismissed #needs Step def
    Then no other changfes should ocurr #needs Step def

    And user clicks the "Delete Relation" button on the row that reads "0413199525" #Green "X" button. Needs step def
    Then delete confirmation dialogue should appear
    And user clicks close button # close button == close symbol? Needs stepdef???
    Then the dialog should be dismissed
    Then no other changes should occurr

    And user clicks the "Delete Relation" button on the row that reads "0413199525" #Green "X" button. Needs step def
    Then delete confirmation dialogue should appear
    And user clicks on the delete button
    Then "0413199525" should not appear in the "Procedures" sidebar #needs StepDef
    Then "0413199525" should not appear in the "Related Intake Records" area #needs Stepdef

    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
    And user enters "0413199525" in the top nav search field
    Then the search results should contain "0413199525"
    And the user clicks on result with text "0413199525"
    Then "0413199525" should be in the "Identification Number" field   #needs Stepdef
    And user selects the "Intake" tab 
    Then "04131995" should not appear in the "Related Intake Records" area  #needs Stepdef
    And user selects the "Current Record" tab 
    And the user clicks the delete button
    Then a delete confirmation dialogue should appear #needs Stepdef
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    Then close the browser


  # Test 27
  Scenario: Deleting relation via record editor
    Given the user is in the "My CollectionSpace" page
    And user enters "04131995" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And the user clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field
    And user selects the "Intake" tab 
    And the user clicks on the "Add record" button #needs step def
    And clicks on the Create button
    And user enters "0413199527" in the "Intake Entry Number" field #might not work 
    And the user saves the record
    And the user clicks the result that contains "0413199527" in the "Entry Number" field
    
    And the user clicks the "Delete this relation" button
    Then a delete confirmation dialogue should appear #needs Stepdef
    And user clicks cancel button # click cancel
    Then the dialog should be dismissed #needs stepdef
    Then no changes should occur #needs step def

    And the user clicks the "Delete this relation" button
    Then a delete confirmation dialogue should appear #needs Stepdef
    And user clicks close button # close button == close symbol?
    Then the dialog should be dismissed #needs stepdef
    Then no changes should ocurr #needs stepdef

    And the user clicks the "Delete this relation" button
    Then a delete confirmation dialogue should appear #needs Step
    And the user clicks the delete button 
    Then the deletion should be confirmed in a dialogue
    # Then the record editor should no longer be displayed (below list)
    Then "0413199527" should not appear in the "Procedures" area  #needs Stepdef
    And the user 

    Then the deleted relation should not be shown in the right "Related Procedures" area

    And selects "Intake" from the top nav search record type select field # And using the top right search area, select intake from the drop down
    And user enters "0413199527" in the top nav search field
    Then the search results should contain "0413199527"
    And the user clicks on result with text "0413199527"
    Then "0413199527" should be in the "Identification Number" field   #needs Stepdef
    And user selects the "Intake" tab 
    Then "04131995" should not appear in the "Related Intake Records" area  #needs Stepdef
    And user selects the "Current Record" tab 
    And the user clicks the delete button
    Then a delete confirmation dialogue should appear #needs Stepdef
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

