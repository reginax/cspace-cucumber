@person
Feature: Person Vocabulary Data Entry


  #Test 3
  Scenario: Create new Person record, fill in fields and save
    Given user is on a blank "Person" record
      And user selects "Ancient Greek" from dropdown in "Language" row
      And user selects "Hello" from dropdown in "Salutation" row
      And user selects "Mr" from dropdown in "Title" row
      And user selects "Artist" from dropdown in "Team Type" row
      And user selects "Accepted" from dropdown in "Status" row
      And user selects "Female" from dropdown in "Gender" row
      And user enters "<source>" in the "Person" "Source" field
      And user enters "<occupation>" in the "Person" "Occupation" field
      And user enters "<school/style>" in the "Person" "School/Style" field
      And user enters "<group>" in the "Person" "Group" field
      And user enters "<nationality>" in the "Person" "Nationality" field
      And user enters "<place of birth>" in the "Person" "Place of Birth" field
      And user enters "<place of death>" in the "Person" "Place of Death" field

      #consider using pystring

      And user enters "This person \n was a steel-drivin' man" in the "Person" "Biographical Note" field
      And user enters "Hallowed \n Provenance" in the "Person" "Name Notes" field
      And user clicks the plus to repeat the "Person" "School/Style" field
      And user clicks the plus to repeat the "Person" "Occupation" field
      And user enters "<school/style2>" in the repeated "Person" "School/Style" field
      And user enters "<occupation2>" in the repeated "Person" "Occupation" field
      And user clicks on the Save button
    Then a "New Record successfully created" message should appear with the current time at the bottom of the page
    Then "Ancient Greek" should be in "Language" row
    Then "Hello" should be in "Salutation" row
    Then "Mr" should be in "Title" row
    Then "Artist" should be in "Team Type" row
    Then "Accepted" should be in "Status" row
    Then "Female" should be in "Gender" row
    Then "<source>" should be in the "Person" "Source field"
    Then "<occupation>" should be in the "Person" "Occupation" field
    Then "<school/style>" should be in the "Person" "School/Style" field
    Then "<group>" should be in the "Person" "Group" field
    Then "<nationality" should be in the "Person" "Nationality" field
    Then "<place of birth>" should be in the "Person" "Place of Birth" field
    Then "<place of death>" should be in the "Person" "Place of Death" field
    Then "This person \n was a steel-drivin' man" should be in the "Person" "Biographical Note" field
    Then "Hallowed \n Provenance" should be in the "Person" "Name Notes" field
    Then "<school/style2>" should be in the repeated "Person" "School/Style" field
    Then "<occupation2>" should be in the repeated "Person" "Occupation" field

  #Test 9
  Scenario: Repeat groups and check for alternating shading
    Given user is on a "Person" record
      And user clicks on the plus to repeat the "Person Term Group" form 
      And user clicks on the plus to repeat the "Person Term Group" form 
    Then the new "Person Term Group" forms should alternate between dark and light shading
      And user clicks on the plus to repeat the "Address" form
      And user clicks on the plug to repeat the "Address" form
    Then the new "Address" forms should alternate between dark and light shading.


  #Test 11
  #need to test for clicking cancel changes button at top of page as well
  Scenario: Check that changes are not saved
    Given user is on a "Person" record
      And user clicks Cancel changes button at bottom of page
    Then nothing should happen
    Then Cancel changes button at top of page should be disabled
    Then Cancel changes button at bottom of page should be disabled
      And user enters "revert this" in the "Display name" field
      And user selects "Yoruba" from dropdown in  "Language" row
      And user clicks Cancel changes button at bottom of page
    Then Cancel changes button at top of page should be active
    Then Cancel changes button at bottom of page should be active
    Then record should be reverted to before changes were made
     And user enters "Revertica Notica" in the "Display name" field
     And user clicks on the Save button
     And user clicks Cancel changes button at bottom of page
    Then nothing should happen
    Then Cancel changes button at top of page should be disabled
    Then Cancel changes button at bottom of page should be disabled

  #Test 13
  Scenario: Edit page and attempt to leave. Warning appears, save.
    Given user is on a "Person" record
      And user enters "Saved Change" in the "Person" "Display name" field
      And user clicks on "Find and Edit" menu item
    Then a confirmation dialogue should appear
      And user clicks on the Save button
    Then the record is successfully saved
    Then user should be redirected to the page navigated to
    Then "Saved Change" should be in the "Person" "Display name" field

  Scenario: Edit page and attempt to leave. Warning appears, do not save.
    Given user is on a "Person" record
      And user enters "Unsaved Change" in the "Person" "Display name" field
      And user clicks on "Find and Edit" menu item
    Then a confirmation dialogue should appear
      And user clicks on the Don't Save button
    Then the record is not successfully saved
    Then user should be redirected to the page navigated to
    Then "Unsaved Change" should not be in the "Person" "Display name" field  

  Scenario: Edit page and attempt to leave. Warning appears, user cancels.
    Given user is on a "Person" record
      And user enters "Tentative Change" in the "Person" "Display name" field
      And user clicks on "Find and Edit" menu item
    Then a confirmation dialogue should appear
      And user clicks on the Cancel button
    Then the dialogue is dismissed

  #Test 21, not sure on what stepdefs are appropriate
  Scenario: User tabs to "Forename", enters something and then tabs to save and saves.
    Given user is on a "Person" record
      And user tabs to "Person" "Occupation" field
    Then user should be able to enter "Tabber" in the "Person" "Occupation" field
      And user enters "Tabber" in the "Person" "Occupation" field
      And user tabs to the Save button at bottom of page
      And user hits enter
    Then the record is successfully saved
    Then "Tabber" should be in the "Person" "Occupation" field





