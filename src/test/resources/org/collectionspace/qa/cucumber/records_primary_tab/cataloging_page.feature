# Created by Regina Xu on 11/17/2015
# Updated 2/26/16: need to match step defs
@recordsprimarytab
Feature: Cataloging Page Test Plan

Scenario: Identification number
    Given user is on the "Create New" page
      And clicks on the Create button
      And the user saves the record
    Then the message "Please specify an Identification Number" should be displayed
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Object Identification Information" row
    Then the message "IN2016.1" should be displayed
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Object Identification Information" row
    Then the message "IN2016.2" should be displayed

Scenario: Correct Display of header on new
    When user enters "test" in the "Cataloging" "Object Name" field
     And the user saves the record
    # currently not displayed:
    Then the message "IN2016.1 - test" should be displayed

    When user enters "test1" in the "Cataloging" "Object Name" field
     And the user saves the record
    Then the message "IN2016.1 - test1" should be displayed

Scenario: All fields saved on new cataloging record and edited record

    # Object Identification Information->Object Name->Object Name
    When user enters "test1" in the "Cataloging" "Object Name" field

    # all under Object Description Information
    When user enters "test2" in the "Cataloging" "Style" field
    When user enters "test3" in the "Cataloging" "Material" field
    When user enters "test4" in the "Cataloging" "Material Component" field
    When user enters "test5" in the "Cataloging" "Material Source" field
    When user enters "test6" in the "Cataloging" "People" field
    When user enters "test7" in the "Cataloging" "Person" field
    When user enters "test8" in the "Cataloging" "Organization" field
    When user enters "test8" in the "Cataloging" "Other" field
    When user enters "test9" in the "Cataloging" "Concept" field
      And user selects "Associated Concepts" from dropdown in "Concept"
    When user enters "test10" in the "Cataloging" "Activity" field
    When user enters "test11" in the "Cataloging" "Event Name" field
    When user enters "test12" in the "Cataloging" "Event Name Type" field
    When user enters "test13" in the "Cataloging" "Inscriber" field # in Inscription Content
      And user selects "Local Persons" from dropdown in "Inscriber"
    When user enters "test13" in the "Cataloging" "Inscriber" field # in Inscription Description
      And user selects "Local Persons" from dropdown in "Inscriber"

    # all under Object Production Information
    When user enters "test0" in the "Cataloging" "Production People" field
    When user enters "test1" in the "Cataloging" "Production Person" field
      And user selects "Local Persons" from dropdown in "Production Person"
    When user enters "test2" in the "Cataloging" "Production Organization" field
      And user selects "Local Organizations" from dropdown in "Production Organization"

    # all under Object History and Association Information
    When user enters "test3" in the "Cataloging" "Associated Event Organization" field
      And user selects "Local Organizations" from dropdown in "Associated Event Organization"
    When user enters "test4" in the "Cataloging" "Associated Event People" field
    When user enters "test5" in the "Cataloging" "Associated Event Person" field
      And user selects "Local Persons" from dropdown in "Associated Event Person"
    When user enters "test6" in the "Cataloging" "Associated Organization" field
      And user selects "Local Organizations" from dropdown in "Associated Organization"
    When user enters "test7" in the "Cataloging" "Associated People" field
    When user enters "test8" in the "Cataloging" "Associated Person" field
      And user selects "Local Persons" from dropdown in "Associated Person"
      And the user saves the record
    Then the record is successfully saved   
    # checks that time is also shownin bottom message bar
    Then "GMT-0800 (PST)" should be displayed in the message bar   
    Then "test5" should appear in the Terms Used sidebar
    Then "assocEventPerson" should appear in the Terms Used sidebar
    Then "test13" should appear in the Terms Used sidebar
    Then "inscriptionContentInscriber" should appear in the Terms Used sidebar
    Then "test9" should appear in the Terms Used sidebar
    Then "contentConcept" should appear in the Terms Used sidebar
    Then "test1" should appear in the Terms Used sidebar
    Then "objectProductionPerson" should appear in the Terms Used sidebar
    Then "test8" should appear in the Terms Used sidebar
    Then "objectProductionPerson" should appear in the Terms Used sidebar

# How to remove values from fields? 
Scenario: Removing values from all fields 
    When user removes the values from all the fields in the formula, except the Identification number
      And the user saves the record
    Then the record is successfully saved   
    Then the message "IN2016.2" should be displayed
    Then the "Terms Used" area in the right sidebar should be empty.
    All the fields should be saved as empty (check by browsing to the object record via find and edit)
    When user Deletes the Identification Number
    And the user saves the record
    Then the message "Please specify an Identification Number" should be displayed above object formula
    Then Object should not be saved

Scenario: Warning on attempting to leave edited page with 4 variations: Variation I: click Save button; II: click Don't Save button; III: click the Cancel button; IV: click the close symbol in NE corner
    When user enters "2" in the "Cataloging" "Date Period" field
    And user clicks "Create New"
    Then delete confirmation dialogue should appear # using this step def since dialog css same for delete and leave 
      And user clicks the confirmation save button
    Then the record is successfully saved   
    Given user is on the "Create New" page 
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Object Identification Information" row
      And user clicks "Create New"
    Then delete confirmation dialogue should appear 
      And user clicks the confirmation don't save button
    Then the message "Find and Edit" should be displayed
    Given user is on the "Create New" page 
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Object Identification Information" row
      And user clicks "Create New"
    Then delete confirmation dialogue should appear 
      And user clicks cancel button 
    Then the message "Find and Edit" should be displayed
    Given user is on the "Create New" page 
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Object Identification Information" row
      And user clicks "Create New"
    Then delete confirmation dialogue should appear 
      And user clicks close button 
   Then the message "Find and Edit" should be displayed

Scenario: Structured Date
    Given user is on the "Create New" page
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Object Identification Information" row
      And the user saves the record
    And user clicks on the "Production Date" field
    When user enters "test1" in the "Cataloging" "Display Date" field
    When user enters "test2" in the "Cataloging" "Date Period" field
    When user enters "test3" in the "Cataloging" "Association" field
    When user enters "test4" in the "Cataloging" "Note" field
    When user enters "1975" in the "Cataloging" "Year" field
    When user enters "4" in the "Cataloging" "Month" field
    When user enters "5" in the "Cataloging" "Day" field
      And the user saves the record
    Then "test1" should appear in the "Production Date" area
    And user clicks on the "Production Date" field
    Then "test1" should appear in the "Display Date" area
    Then "test2" should appear in the "Date Period" area
    Then "test3" should appear in the "Association" area
    Then "test4" should appear in the "Note" area

Scenario: Cancel Changes buttons
    Then disables top and bottom "cancel" buttons
    When user enters "2" in the "Cataloging" "Display Date" field
    Then enables top and bottom "cancel" buttons
      And the user saves the record 
    Then disables top and bottom "cancel" buttons

Scenario: Deletion of Record
    Given user is on the "Create New" page
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Object Identification Information" row
    Then disables top and bottom "delete" buttons
      And the user saves the record
      And the user clicks on the delete button
    Then delete confirmation dialogue should appear
      And user clicks cancel button
    # This checks that dialog is dismissed & no other changes occurred:
    Then the record is successfully saved
      And the user clicks on the delete button
    Then delete confirmation dialogue should appear
      And user clicks the confirmation delete button
    Then deletion should be confirmed in a dialogue
      And user clicks close button
    Then the record is successfully saved
      And the user clicks on the delete button
    Then the message "Find and Edit" should be displayed

    When using the top right search area, select "Object" from the drop down and enter the identification number of the deleted record
    Then the Object should not be found.
    When user creates a new cataloging record and fill in at least the identification number
    And take note of the identification number of the record
    And the user saves the record
    And user clicks on the "Add" button # + a related Loan In record
    And the user saves the record
    And user clicks on the "Delete" button 
    Then a dialog should appear asking you to delete this record and its relationships
    And user clicks on the "cancel button
    Then the "Dialog" should be dismissed
    Then no other changes should occur.
    And user clicks on the "delete" button
    And cuser licks oclosebutton
    Then "Dialog" should be dismissed
    Then no other changes should occur.
    And user clicks on the "delete" button
    Then the message "Find and Edit" should be displayed
    And selects Object from the drop down
    And enters the identification number of the deleted record 
    Then Object should not be found.

Scenario: Fold/Unfolding boxes
    Given user is on the "Create New" page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Object Identification Information"
    Then the "Object Identification Information" section should fold
    Then the "Fold" symbol next to "Object Identification Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Identification Information"
    Then the "Exhibition Information" section should unfold
    Then the "Fold" symbol next to "Object Identification Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Description Information"
    Then the "Object Description Information" section should fold
    Then the "Fold" symbol next to "Object Description Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Description Information"
    Then the "Object Description Information" section should unfold
    Then the "Fold" symbol next to "Object Description Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Production Information"
    Then the "Object Production Information" section should fold
    Then the "Fold" symbol next to "Object Production Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Production Information"
    Then the "Object Production Information" section should unfold
    Then the "Fold" symbol next to "Object Production Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object History and Association Information"
    Then the "Object History and Association Information" section should fold
    Then the "Fold" symbol next to "Object History and Association Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object History and Association Information"
    Then the "Object History and Association Information" section should unfold
    Then the "Fold" symbol next to "Object History and Association Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Owner's Contribution Information"
    Then the "Object Owner's Contribution Information" section should fold
    Then the "Fold" symbol next to "Object Owner's Contribution Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Owner's Contribution Information"
    Then the "Object Owner's Contribution Information" section should unfold
    Then the "Fold" symbol next to "Object Owner's Contribution Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Viewer's Contribution Information"
    Then the "Object Viewer's Contribution Information" section should fold
    Then the "Fold" symbol next to "Object Viewer's Contribution Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Viewer's Contribution Information"
    Then the "Object Viewer's Contribution Information" section should unfold
    Then the "Fold" symbol next to "Object Viewer's Contribution Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Reference Information"
    Then the "Reference Information" section should fold
    Then the "Fold" symbol next to "Reference Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Reference Information"
    Then the "Reference Information" section should unfold
    Then the "Fold" symbol next to "Reference Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should fold
    Then the "Fold" symbol next to "Object Collection Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should unfold
    Then the "Fold" symbol next to "Object Collection Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Hierarchy"
    Then the "Object Hierarchy" section should fold
    Then the "Fold" symbol next to "Object Hierarchy" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Hierarchy"
    Then the "Object Hierarchy" section should unfold
    Then the "Fold" symbol next to "Object Hierarchy" should be an unfolded symbol

Scenario: Warning on attempting to add related object/procedures to unsaved object
    Given user is on the "Create New" page
      And clicks on the Create button
    When user clicks the "Add" button on the "Used By / Procedures" area to the right
    Then "Please save the record you are creating before trying to relate other records to it" should be displayed in the message bar
    When user clicks the "Add" button on the "Used By / Cataloging" area to the right
    Then "Please save the record you are creating before trying to relate other records to it" should be displayed in the message bar
