@person
Feature: Person Vocabulary Data Entry
  Scenario: All fields saved on new and edited Person record
    Given user is on a blank "Person" record
      And user selects something in select boxes other than first
      And user fills out "Source" authority field
        Or user fills out "Occupation" authority field
        Or user fills out "School/style" authority field
        Or user fills out "Group" authority field
        Or user fills out "Nationality" authority field
        Or user fills out "Place of Birth" authority field
        Or user fills out "Place of Death" authority field
      And user writes multiline text in text areas
      And user writes regular text
      And user saves the record
     Then "New Record successfully created" message should appear with current time, at bottom of page
     Then all fields should be updated with the data user entered
     Then authorities should be displayed under "Used Terms"
     Then newlines should be present in text areas
     Then select boxes should contain values user selected
     Then date fields should contain dates user selected


