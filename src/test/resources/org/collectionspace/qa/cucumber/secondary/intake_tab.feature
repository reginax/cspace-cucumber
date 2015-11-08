# Created Nov 5, 2015 by Cesar Villalobo
# Things that need to be done:
    # Right now, everything is mainly pseudocode that needs to be translated into tests still which I will begin to due tomorrow. 
    # I have marked things that I was not sure how to do with ' # // '.
    # These are steps in the writing of the test that I was not sure how to do
    # And/or if step definitons were missing


@secondary
Feature: Intake Tab 
  
  # Test 1
  Scenario: Working Intake Secondary Tab
    Given user is on the "My CollectionSpace" page 
      And user enters "32" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
    Then the search results should contain "32"
      And the user clicks on result with text "32"
    Then "32" should be in the "Identification Number" field
      # // And user clicks on the "Intake" tab
    # // Then "Intake" records should be listed in a table
    # // Then if there are no related Intake records
    Then the list in the "Intake" row should contain "No related records yet"

  # Test 3
  Scenario: User tries to dismiss the dialog
  # // And the user clicks on the "+ Add Record" button
  # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
  # And Variation A: Click the close buttonin the top right corner of the dialog
  # And Vatiation B: Hit ESC on your keyboard
  # Then No changes to the record will occur

  #Test 5
  Scenario: Trying to add search for and add multiple intake records
  # // And the user clicks on the "+ Add Record" button
  # And the user selects any kind of relationship
  # And the user clicks the search button next ot the search existing area
  # Then a list of records should appear
  # And the user marks at least two of the records
  # And the user clicks the "Add to Current Record" button
  # Then the dialog should be dismissed
  # Then the newly added records should be listed in the Related Records list near the top of the screen
  # Then In the "Used By" area of the sidebar on the right side of the page, the newly added records should also be properly displayed
  # And the user clicks the identificaiton number of one of the added records on the "Related Records" list near the top of the screen
  # Then an "Edit Intake Record" form should be displayed undernearth the listing, filled out with data from the seelected Intake record
  # And the user clicks another idenficiation number from the list
  # Then the Edit Intake Record form should be updated to correspoind to the new record you clicked


  # Test 7
  Scenario: Warning when nagivating away form the new intake record
  # Given the user is in the "Secondary Intake Tab" of any record
  # And the user clicks on the "+ Add Record" button
  # Then a dialog should appear
  # And the user selects any kind of relationship
  And clicks on the Create button
  # Then the dialog should be dismissed
  # Then in the listing of the records, a new line should apear on top of the list with a text similar to "New Ralate Record"
  # Then an empty Intake record form should be displayed below the listing of records

  # And the user fills in at leas the Intake Entry Number field
  # And the user clicks any link/item to navigate away from the current page
  # Variation A: In the appearing dialog warning you navigate away click close butotn
  # Variation B: In the appearing dialog warning you navigate away click cancel button
  # Variation C: In the dialog, click Save
  # Variation D: Int he dialog, click Dont Save
  # Then A + B dialog should be dismissed
  # Then C + D User should be navigated to the page they clicked
  # Then C The record should be saved. You can check this by searching for the record or looking at the find and edit page
  # Then D The record should NOT be saved. You can check this by searching for the record or look at the Find and edit page


  # Test 9
  Scenario: # Enter scenario name here
  # Given the user is in the "Secondary Intake Tab" of any record
  # And the user clicks on the "+ Add Record" button
  # Then a dialog should appear
  # And the user selects any kind of relationship
  And clicks on the Create button
  # Variation A: Click cancel changes button at the top of the page
  # Variation B: Click cancel changes button at the bottom of the page
  # Then The cancel changes buttons should be disabled and nothing should happen

  # And the user clicks at least one field
  # Variation A: Click cancel changes button and the top of the page
  # Variation B: Click cancel changes button and the bottom of the page
  # Then the cancel changes butotn should be active
  # Then the related record should be reverted to before changes were made

  # And the user Enters any Intake Entry Number
  And the user saves the record
  # Variation A: After successful save, click the cancel changes button at the top of the page
  # Variation B: After successful save, click the Cancel changes button at the bottom of the page
  # Then the cancel changes button should be disabled and nothing should happen

  # Test 10
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
  # And a successful save message appears
  # Then all fields should display the values you entered


  # Test 13, 21 and 23
  Scenario: All fields saved on edited Intake record. 
      After this, We check if the Listing displaus correct values
      Then we test the links and make sure that the "Go To Record" works
    # Go to any existing record with a related intake record by clicking its id/entry nymber
    # Click the intake tab
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
    # Via the find and edit page, go to a ctataloging record that has intake records related to it by clicking its identification/entry number
    # Click the green "x" (delete button) next ot an object in the related record list at the top of the page
    Then delete confirmation dialogue should appear # Then the dialog should appear asking you to delete this relation

    And user clicks cancel button
    # Then the dialog should be dismissed
    # Then no other changfes should ocurr

    # Click the green "x" (delete button) # again
    Then delete confirmation dialogue should appear
    And user clicks close button # close button == close symbol?
    # Then the dialog should be dismissed
    # Then no other changes should occurr

    # Click the green "x" (delete button) # again
    Then delete confirmation dialogue should appear
    And user clicks on the delete button
    # Then the removed record should neither be show in the right Procedures sidebar or in the main "Related Intake Records" area

    # And using the top right search area, select intake formt he drop down
    # And enter the entry number of the deleted object relation
    # Then the deleted object relation should be found but no longer related to the original record


  # Test 27
  Scenario: Deleting relation via record editor
    Given the user is in the "Find and Edit" page
    # Go to a record that has intake related to it by clicking its ID number
    # Take note of the intake entry number of the record
    # Click the delete relation button at the top right of the record
    Then delete confirmation dialogue should appear # A dialog should appear asking you to confirm removing relationship

    And user clicks cancel button # click cancel
    # Then the dialog should be dismissed
    # nother changes should occur

    # Click the delete relation button at the top right of the record (again)
    And user clicks close button # close button == close symbol?
    # Then the dialog should be dismissed
    # no changes should ocurr 

    # Click the delete relation button at the top right of the record (again)
    Then delete confirmation dialogue should appear 
    # In the appearing dialog, click Delete
    # Then the record editor should no longer be displayed (below list)
    # Then the deleted relation should not be shown in the right "Related Procedures" area

    # Using the top right search area, select intake from the drop down menu
    # And enter the Id number of the deleted object relation
    # Then the deleted object relation should be down but no longer related to the original record

  # Test 31
  Scenario: Testing Functional Accessibility 
      The user should only use the keyboard while doing the following commands
    # Go to the secondary intake tab
    # // And the user clicks on the "+ Add Intake" button to create a new object record
    # Tab through the form to make sure everything is reachable and authorities and ates can be handled using the keyboard
    # Save the record
    # Make sure the link to the newly created record is reachable by keyboard 
    # Make sure the key to the newly created record is reachable by keyboard

    # Then the entire test should be doable using only a keyboard
    # Then at all times you should be able to see where focus is















