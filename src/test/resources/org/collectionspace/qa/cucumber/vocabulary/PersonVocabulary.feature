@person
Feature: Person Vocabulary Data Entry


#Test 3
  Scenario: Create new Person record, fill in fields and save
    Given user is on a blank "Person" record
      And selects "Ancient Greek" from dropdown in "Language" row
      And selects "Hello" from dropdown in "Salutation" row
      And selects "Mr" from dropdown in "Title" row
      And selects "Artist" from dropdown in "Team Type" row
      And selects "Accepted" from dropdown in "Status" row
      And selects "Female" from dropdown in "Gender" row
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
      And the user saves the record
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
    Then "<school/style2>" should be in the second "Person" "School/Style" field
    Then "<occupation2>" should be in the second "Person" "Occupation" field
    Then close the browser

#Test 9
  Scenario: Repeat groups and check for alternating shading
    Given user is on a "Person" record
      And user clicks on the plus to repeat the "Person Term Group" form 
      And user clicks on the plus to repeat the "Person Term Group" form 
    Then the new "Person Term Group" forms should alternate between dark and light shading
      And user clicks on the plus to repeat the "Address" form
      And user clicks on the plug to repeat the "Address" form
    Then the new "Address" forms should alternate between dark and light shading
    Then close the browser


#Test 11
#stepdefs for clicking button at bottom and at top of page uncertain
#need to test for clicking cancel changes button at top of page as well
  Scenario: Check that changes are not saved
    Given user is on a "Person" record
      And clicks on the Cancel changes button at bottom of page
    Then nothing should happen
    Then the Cancel changes button at top of page should not be clickable
    Then the Cancel changes button at bottom of page should not be clickable
      And user enters "revert this" in the "Display name" field
      And user selects "Yoruba" from dropdown in  "Language" row
      And clicks on the Cancel changes button at bottom of page
    Then the Cancel changes button at top of page should be clickable
    Then the Cancel changes button at bottom of page should be clickable
    Then record should be reverted to before changes were made
     And user enters "Revertica Notica" in the "Display name" field
     And user clicks on the Save button
     And clicks on the Cancel changes button at bottom of page
    Then nothing should happen
    Then the Cancel changes button at top of page should not be clickable
    Then the Cancel changes button at bottom of page should not be clickable
    Then close the browser

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
    Then close the browser

  Scenario: Edit page and attempt to leave. Warning appears, do not save.
    Given user is on a "Person" record
      And user enters "Unsaved Change" in the "Person" "Display name" field
      And user clicks on "Find and Edit" menu item
    Then a confirmation dialogue should appear
      And user clicks on the Don't Save button
    Then the record is not successfully saved
    Then user should be redirected to the page navigated to
    Then "Unsaved Change" should not be in the "Person" "Display name" field  
    Then close the browser

  Scenario: Edit page and attempt to leave. Warning appears, user cancels.
    Given user is on a "Person" record
      And user enters "Tentative Change" in the "Person" "Display name" field
      And user clicks on "Find and Edit" menu item
    Then a confirmation dialogue should appear
      And user clicks on the Cancel button
    Then the dialogue is dismissed
    Then close the browser

#Test 21, not sure on which stepdefs are appropriate
  Scenario: User tabs to "Forename", enters something and then tabs to save and saves.
    Given user is on a "Person" record
      And user tabs to "Person" "Occupation" field
    Then user should be able to enter "Tabber" in the "Person" "Occupation" field
      And user enters "Tabber" in the "Person" "Occupation" field
      And user tabs to the Save button at bottom of page
      And user hits enter
    Then the record is successfully saved
    Then "Tabber" should be in the "Person" "Occupation" field
    Then close the browser

#Test 23
  Scenario: Create Loan In and select "Joe Bean" from drop down menu for Lender using keyboard only
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the "Create New" page
      And clicks on the Create button
    Then the titlebar should contain "Loan In"
      And user enters "Joe" in the "Loan In" "Lender" field
    Then a drop down menu should appear in the "Lender" row
#need to decide on stepdef for select using keyboard only
      And user selects "Joe Bean" from dropdown in "Lender" row 
    Then "Joe Bean" should be in the "Loan In" "Lender" field
    Then close the browser

  Scenario: Create Loan In and add nonexisting Person through Lender drop down
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the "Create New" page
      And clicks on the Create button
    Then the titlebar should contain "Loan In"
      And user enters "Does Not Exist" in the "Loan In" "Lender" field
    Then a drop down menu should appear in the "Lender" row
      And user selects "Local Persons" from dropdown in "Lender" row
    Then the titlebar should contain "Does Not Exist"
      And user enters "Does Not Exist" in the top nav search field
      And selects "Person" from the top nav search record type select field
      And clicks on the top nav search submit button
    Then the search results should contain "Does Not Exist"
    Then close the browser

#Test 25
#Assumes that the stepdef exists: user tabs to ____  ____ field 
  Scenario: Make change to date field using keyboard only
    Given user is on a blank "Person" record
      And user tabs to "Person" "Birth Date" field
    Then a drop down form should appear in the "Birth Date" row
      And user tabs to "Person" "Display Date" field
      And user enters "1/1/2011" in the "Person" "Display Date" field 
# Below is tentative, do not know stepdef for this yet
# And user tabs to the "Year", "Earliest/Single Date" box in the "Person" "Date" table
# And user enters "1234" in the "Year", "Earliest/Single Date" box in the "Person" "Date" table
    Then "1/1/2011" should be in the "Person" "Birth Date" field
    Then close the browser

#Test 26
  Scenario: Preferred term is "Samuel Clemens." NPT "Mark Twain" should not be clickable (LifeSci tenant)
# Uncertain stepdef
    Given user is logged on to the LifeSci tenant
      And user is on a blank "Person" record
      And user enters "Mark Twain" in the "Person" "Display Name" field
      And user clicks the plus to repeat the "Person Term Group" form
    Then an additional "Person Term Group" record should be present
      And user adds "Samuel Clemens" in the "Display Name" field of the second "Person Term Group" form
      And user clicks the plus to repeat the "Person Term Group" form
      And user adds "Samuel Langhorne Clemens" in the "Display Name" field of the third "Person Term Group" form
# Uncertain stepdef 
      And user marks the second "Person Term Group" form as preferred
      And the user saves the record
# Uncertain stepdef 
      And user navigates to the "Create New" page
      And selects the "Loan In" radio button on the "Create New" page
      And clicks on the Create button
    Then the titlebar should contain "Loan In" 
      And user fills in required fields for "Loan In" record
#types vs enters for stepdef?
      And user types "Mark" in the "Loan In" "Lender" field
    Then a drop down list should appear in the "Lender" row
# Uncertain stepdef
    Then "Samuel Clemens" should appear in black in the dropdown in "Lender" row
# Uncertain stepdef
    Then "Mark Twain" should appear indented in grey in the dropdown in "Lender" row
    Then "Mark Twain" should not be clickable
      And user clicks on "Samuel Clemens" from dropdown in "Lender" row
    Then "Samuel Clemens" should be in the "Loan In" "Lender" field
      And the user saves the record
    Then "Samuel Clemens" should appear in the Terms Used sidebar
      And user clicks on "Samuel Clemens" in the Terms Used sidebar
    Then the titlebar should contain "Samuel Clemens"
    Then close the browser

#Test 27
  Scenario: Preferred term is "Samuel Clemens." NPT "Mark Twain" should be clickable
    Given user is on a blank "Person" record
      And user enters "Mark Twain" in the "Person" "Display Name" field
      And user clicks the plus to repeat the "Person Term Group" form
    Then an additional "Person Term Group" record should be present
      And user adds "Samuel Clemens" in the "Display Name" field of the second "Person Term Group" form
      And user clicks the plus to repeat the "Person Term Group" form
      And user adds "Samuel Langhorne Clemens" in the "Display Name" field of the third "Person Term Group" form
# Uncertain stepdef 
      And user marks the second "Person Term Group" form as preferred
      And the user saves the record
# Uncertain stepdef 
      And user navigates to the "Create New" page
      And selects the "Loan In" radio button on the "Create New" page
      And clicks on the Create button
    Then the titlebar should contain "Loan In" 
      And user fills in required fields for "Loan In" record
#types vs enters for stepdef?
      And user types "Mark" in the "Loan In" "Lender" field
    Then a drop down list should appear in the "Lender" row
# Uncertain stepdef
    Then "Samuel Clemens" should appear in black in the dropdown in "Lender" row
# Uncertain stepdef
    Then "Mark Twain" should appear indented in black in the dropdown in "Lender" row
    Then "Mark Twain" should be clickable
      And user clicks on "Mark Twain" from dropdown in "Lender" row
    Then "Mark Twain" should be in the "Loan In" "Lender" field
      And the user saves the record
    Then "Mark Twain" should appear in the Terms Used sidebar
      And user clicks on "Mark Twain" in the Terms Used sidebar
    Then the titlebar should contain "Samuel Clemens"
    Then close the browser

#Test PLAN
  Scenario: Hierarchical Authorities
    Given user is on a blank "Person" record
      And user enters "Foo Family" in the "Person" "Display Name" field
      And user enters "Foo Clan" in the "Person" "Broader Context" field
    Then a drop down list should appear in the "Broader Context" row
# Uncertain stepdef
      And user adds "Foo Family" to Local Persons
      And user enters "Foo Parents" in the "Person" "Narrower Context" field
    Then a drop down list should appear in the "Narrower Context" row
# Uncertain stepdef
      And user adds "Foo Parents" to Local Persons from dropdown in "Narrower Context" row
      And user clicks the plus to repeat the "Person" "Narrower Context" field
      And user enters "Foo Kids" in the second "Person" "Narrower Context" field
    Then a drop down list should appear in the second "Narrower Context" row
# Uncertain stepdef
      And user adds "Foo Kids" to Local Persons from dropdown in second "Narrower Context" row
      And the user saves the record
    Then "Foo Clan" should be in the "Person" "Broader Context" field
    Then "Foo Family" should be in the "Person" "Narrower Context" field
    Then "Foo Kids" should be in the second "Person" "Narrower Context" field
# Uncertain stepdef
    Then the record should not contain the "Person" "Equivalent Context" field
# Uncertain stepdef
      And user clicks the "go to" button in the "Narrower Context" row
    Then the titlebar should contain "Foo Kids"
      And user enters "Johnny Foo" in the "Person" "Narrower Context" field
    Then a drop down list should appear in the "Narrower Context" row
# Uncertain stepdef
      And user adds "Johnny Foo" to Local Persons from dropdown in "Narrower Context" row
      And user clicks the plus to repeat the "Person" "Narrower Context" field
      And user enters "Sally Foo" in the second "Person" "Narrower Context" field
    Then a drop down list should appear in the second "Narrower Context" row
# Uncertain stepdef
      And user adds "Sally Foo" to Local Persons from dropdown in second "Narrower Context" row
      And the user saves the record
    Then "Johnny Foo" should be in the "Person" "Narrower Context" field
    Then "Sally Foo" should be in the second "Person" "Narrower Context" field
    Then "Foo Parents" should be in the "Person" "Equivalent Context" field
# Uncertain stepdef
    Then the "Person" "Equivalent Context" field should be read only
      And user clicks the plus to repeat the "Person" "Narrower Context" field
      And user enters "Cindy Loo Foo" in the third "Person" "Narrower Context" field
    Then a drop down list should appear in the third "Narrower Context" row
# Uncertain stepdef
      And user adds "Cindy Loo Foo" to Local Persons from dropdown in second "Narrower Context" row
      And the user saves the record
    Then "Foo Kids" should be in the "Person" "Broader Context" field
    Then "Cindy Loo Foo" should be in the third "Person" "Narrower Context" field
      And user enters "Sally Foo" in the top nav search field
      And selects "Person" from the top nav search record type select field
      And clicks on the top nav search submit button













