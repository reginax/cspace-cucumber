@administration
#Created by Forest Yang on 12/22/2015
Feature: Permission Enforcement

  #There will probably not be sufficient stepdefs for this one ...

  #Test31
  Scenario: Create New Page
    Given user is logged in as "User I" 
    Given user is on the "Create New" page
    Then the "Record Type A" radio button is not present
    Then the "Record Type B" radio button is not present
    Then the "Record Type C" radio button is present 
      And clicks on the Create button 
    Then new record should be created
      And user fills out required fields for record
      And the user saves the record
    Then the record is successfully saved
    Then the "Delete" button should not be present
    Then close the browser

  #Test33
  Scenario: Search
    Given user is logged in as "User I"
    Given user is on the "Find and Edit" page
    Then dropdown in search row should not contain "Record Type A"
    Then dropdown in search row should contain "Record Type B"
    Then dropdown in search row should contain "Record Type C"
    Then dropdown in search row should contain "Record Type D"
    Then dropdown in top nav search row should not contain "Record Type A"
    Then dropdown in top nav search row should contain "Record Type B"
    Then dropdown in top nav search row should contain "Record Type C"
    Then dropdown in top nav search row should contain "Record Type D"
      And user clicks "Advanced Search"
    Then the titlebar should contain "Advanced Search"
    Then dropdown in "Select record type" row should not contain "Record Type A"
    Then dropdown in "Select record type" row should contain "Record Type B"
    Then dropdown in "Select record type" row should contain "Record Type C"
    Then dropdown in "Select record type" row should contain "Record Type D"
    Then close the browser

  #Test35
  Scenario: Records still in edit mode
    Given user is logged in as "User I"
    Given user is on the "My Collectionspace" page
      And selects "Record Type C" from the top nav search record type select field
      And clicks on the top nav search submit button
    Then user is redirected to the "Find and Edit" page
    Then dropdown in search row should not contain "Record Type A"
    Then dropdown in search row should contain "Record Type B"
    Then dropdown in search row should contain "Record Type C"
    Then dropdown in search row should contain "Record Type D"
      And user clicks on a record that has a record of Type A, B, and D related
   #Test37 continued from Test35: Listing of records in sidebar of Write Record
    Then the sidebar should not contain "Record Type A"
    Then the sidebar should contain "Record Type B"
    Then the sidebar should contain "Record Type D"
   #Test39 continued from Test37: Adding records from Write Record
    Then the add button is present for "Record Type D"
      And user clicks the add button for "Record Type D"
    Then the dropdown in the dialog should contain "Record Type D"
    Then the dropdown in the dialog should not contain "Record Type A"
    Then the dropdown in the dialog should not contain "Record Type B"
      And user adds a record of "Record Type D"
    Then the record is successfully related.
   #Test41 continued from Test39: Secondary Tab of Write Record
    Then the "Record Type A" tab is not present
    Then the "Record Type B" tab is present
    Then the "Record Type D" tab is present
      And user selects the "Record Type B" tab
      And user clicks on a "Record Type B" record
    Then the record should be read only
    Then the add button is not present
      And user selects the "Record Type D" tab
      And user clicks on a "Record Type D" record
    Then the record should be editable
    Then the add button is present
    Then the "Create New" button is present
   #Test43 continued from Test41: Record Read Only Mode
      And user clicks on a "Record Type B" related record that has a record of Type A, C, and D related
    Then the record should be read only
    Then the "Cancel" button is not present
    Then the "Save" button is not present
    Then the "Delete" button is not present
   #Test45 continued from Test43: Right sidebar from Read record
    Then the sidebar should not contain "Record Type A"
    Then the sidebar should contain "Record Type C"
    Then the sidebar should contain "Record Type D"
    Then the sidebar should not contain the add button
   #Test47 continued from test45: Secondary Tab of read record:
    Then the "Record Type A" tab is not present
   #Is this a mistake? the wiki says the record of type B should have a related record of type B...
    Then the "Record Type B" tab is present
    Then the "Record Type D" tab is present
      And user selects the "Record Type B" tab
      And user clicks on a "Record Type B" record
    Then the record should be read only
    Then the add button is not present
      And user selects the "Record Type D" tab
      And user clicks on a "Record type D" record
    Then the record should be editable
    Then the add button is not present
    Then the "Delete" button is not present
    Then close the browser

  #Test49
  Scenario: My Collectionspace page
    Given user is logged in as "User I" 
    Given user is on the "My Collectionspace" page
    Then dropdown in top nav search row should not contain "Record Type A"
    Then dropdown in top nav search row should contain "Record Type B"
    Then dropdown in top nav search row should contain "Record Type C"
    Then dropdown in top nav search row should contain "Record Type D"
    Then close the browser

  #Test61
  Scenario: Create New Page
    Given user is logged in as "User I"
    Given user is on the "Create New" page
    Then the "Vocabulary A" radio button is not present
    Then the "Vocabulary B" radio button is not present
    Then close the browser

  #Test63
  Scenario: Search
    Given user is logged in as "User I"
    Given user is on the "Find and Edit" page
    Then dropdown in search row should not contain "Vocabulary A"
    Then dropdown in search row should not contain "Vocabulary B"
    Then dropdown in top nav search row should not contain "Vocabulary A"
    Then dropdown in top nav search row should not contain "Vocabulary B"
    Given user is on the "Create New" page
    Then dropdown in top nav search row should not contain "Vocabulary A"
    Then dropdown in top nav search row should not contain "Vocabulary B"
    Then close the browser

  #Test65
  Scenario: Predictive Text for NONE vocabularies in READ record
    Given user is logged in as "User I"
      And selects "Record Type B" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type B" record
    Then the "Used Terms" list should not link to vocabularies
    Then the vocabulary fields should not be editable
    Then close the browser

  #Test67
  Scenario: Predictive Text in WRITE record
    Given user is logged in as "User I"
      And selects "Record Type C" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type C" record
    Then the "Used Terms" list should not link to vocabularies
      And user deletes a "Vocabulary A" vocab field
      And the user saves the record
    Then the record is successfully saved
    Then the "Used Terms" list should not contain the vocabulary term
      And user enters "xxx" in the deleted vocab field
    Then the error message bar should appear
    Then close the browser

  #Test71,73, 75
  Scenario: Create New Page, Search and Edit Functionality, Predictive text in READ record
    Given user is logged in as "User II"
    Given user is on the "Create New" page
    Then the "Vocabulary B" radio button is not present
      And selects "Vocabulary B" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a vocabulary term
    Then the vocabulary should be in "View Only" mode
    The the "Save" button is not present
    Then the "Cancel" button is not present
      And selects "Record Type B" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type B" record
    Then the record should be read only
      And user clicks on a "Terms Used" link
    Then the vocabulary is successfully loaded
    Then the vocabulary should be read only
    Then close the browser

  #Test77
  Scenario: Predictive text in WRITE record
    Given user is logged in as "User II"
    Given user is on the "My Collectionspace" page
      And selects "Record Type C" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user deletes a "Vocabulary A" vocab field
      And the user saves the record
    Then the record is successfully saved
    Then the "Used Terms" list should not contain the vocabulary
      And user enters "Jam" in the deleted vocab field
    Then the vocabulary autocomplete should appear
    Then the vocabulary autocomplete should not contain the option to add a new term
      And user clicks on something from autocomplete options
      And the user saves the record
    Then the record is successfully saved
    Then the "Used Terms" list should contain the vocabulary term
    Then close the browser

  #Test81, 83
  Scenario: Create New Page, Search and edit functionality
    Given user is logged in as "User III"
    Given user is on the "Create New" page
      And selects the "Vocabulary B" radio button on the Create New page
      And clicks on the Create button
      And enters "Hello it's me" in the "Vocabulary B" "Display Name" field
      And the user saves the record
    Then the record is successfully saved
    Then the "Delete" button is not present
      And selects "Vocabulary B" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Vocabulary B" term
    Then the vocabulary term should be editable
      And user edits a field
      And the user saves the record
    Then the record is successfully saved
    Then the dropdown in the top right row should contain "Record Type B"
    Then close the browser

  #Test 85
  Scenario: Predictive Text in READ record
    Given user is logged in as "User III"
    Given user is on the "My Collectionspace" page
      And selects "Record Type B" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type B" record
      And user finds a "Vocabulary A" vocab term
    Then the "Used Terms" list should contain the vocabulary term
    Then the record should be read only
      And the user clicks the link to the vocabulary term
    Then the vocabulary term is successfully loaded
    Then close the browser

  #Test87
  Scenario: Predictive text in WRITE record
    Given user is logged in as "User III"
    Given user is on the "My Collectionspace" page
      And selects "Record Type C" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type C" record
      And user finds a "Vocabulary A" vocab term
    Then the "Used Terms" list should contain the vocabulary term
      And user deletes the vocabulary term
      And the user saves the record
    Then the record is successfully saved
    Then the "Used Terms" list should not contain the vocabulary term
      And user enters "Jam" in the deleted vocab field
    Then the vocabulary autocomplete should contain the option to add a new term
      And user adds "Jam" to a vocabulary
      And the user saves the record
    Then the record is successfully saved
    Then the "Used Terms" list should contain "Jamm"
    Then close the browser

  #Test91
  Scenario: Behavior on NONE/READ combination vocabulary from WRITE record
    Given user is logged in as "User IV"
    Given user is on the "My Collectionspace" page
      And selects "Record Type A" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type A" record
      And user finds a "Vocabulary A" vocab term
    Then the "Used Terms" list should contain the vocabulary term
      And user deletes the vocabulary term
      And the user saves the record
    Then the record is successfully saved
    Then the "Used Terms" list should not contain the vocabulary term
      And the user enters "Jam" in the deleted vocab field
    Then the vocabulary autocomplete should not contain "Vocabulary A" terms
    Then the vocabulary autocomplete should not contain the option to add a new term
      And user clicks on something from autocomplete options
      And the user saves the record
    Then the record is saved successfully
    Then the "Used Terms" list should contain the vocabulary term
    Then close the browser

  #Test93
  Scenario: Behavior on NONE/WRITE combination vocabulary from WRITE record
    Given user is logged in as "User V"
    Given user is on the "My Collectionspace" page
      And selects "Record Type A" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type A" record
      And user finds a "Vocabulary A" vocab term
    Then the "Used Terms" list should contain the vocabulary term
      And user deletes the vocabulary term
      And the user saves the record
    Then the record is succesfully saved
    Then the "Used Terms" list should not contain the vocabulary term
      And the user enters "Jam" in the deleted vocab field
    Then the vocabulary autocomplete should not contain "Vocabulary A" terms
    Then the vocabulary autocomplete should contain the option to add a new term
      And user clicks on something from autocomplete options
      And the user saves the record
    Then the record is saved successfully
    Then the "Used Terms" list should contain the vocabulary term
    Then close the browser

  #Test95
  Scenario: Behavior on READ/WRITE combination vocabulary from WRITE record
    Given user is logged in as "User VI" 
    Given user is on the "My Collectionspace" page
      And selects "Record Type A" from the top nav search record type select field
      And clicks on the top nav search submit button
      And user clicks on a "Record Type A" record
      And user finds a "Vocabulary A" vocab term
    Then the "Used Terms" list should contain the vocabulary term
      And user deletes the vocabulary term
      And the user saves the record
    Then the record is succesfully saved
    Then the "Used Terms" list should not contain the vocabulary term
      And the user enters "Jam" in the deleted vocab field
    Then the vocabulary autocomplete should contain the option to add a new term
      And user clicks on something from autocomplete options
      And the user saves the record
    Then the record is saved successfully
    Then the "Used Terms" list should contain the vocabulary term
    Then close the browser  