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
      And user enters "<source>" in the "Source" field
      And user enters "<occupation>" in the "Occupation" field
      And user enters "<school/style>" in the "School/Style" field
      And user enters "<group>" in the "Group" field
      And user enters "<nationality>" in the "Nationality" field
      And user enters "<place of birth>" in the "Place of Birth" field
      And user enters "<place of death>" in the "Place of Death" field
      And user enters "This person \n was a steel-drivin' man" in the "Biographical Note" field
      And user enters "Hallowed \n Provenance" in the "Name Notes" field
      And user clicks the plus to repeat the "School/Style" field
      And user clicks the plus to repeat the "Occupation" field
      And user enters "<school/style2>" in the repeated "School/Style" field
      And user enters "<occupation2>" in the repeated "Occupation" field
      And user clicks on the Save button
    Then a "New Record successfully created" message should appear with the current time at the bottom of the page
    Then "Ancient Greek" should be in "Language" row
    Then "Hello" should be in "Salutation" row
    Then "Mr" should be in "Title" row
    Then "Artist" should be in "Team Type" row
    Then "Accepted" should be in "Status" row
    Then "Female" should be in "Gender" row
    Then "<source>" should be in the "Source field"
    Then "<occupation>" should be in the "Occupation" field
    Then "<school/style>" should be in the "School/Style" field
    Then "<group>" should be in the "Group" field
    Then "<nationality" should be in the "Nationality" field
    Then "<place of birth>" should be in the "Place of Birth" field
    Then "<place of death>" should be in the "Place of Death" field
    Then "This person \n was a steel-drivin' man" should be in the "Biographical Note" field
    Then "Hallowed \n Provenance" should be in the "Name Notes" field
    Then "<school/style2>" should be in the repeated "School/Style" field
    Then "<occupation2>" should be in the repeated "Occupation" field

