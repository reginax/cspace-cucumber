@administration
@author FY
Feature: General Administration

  #Test1
  Scenario: Administration is available for administrative account
    Given user is on the "My CollectionSpace" page
      And user selects the "Administration" tab
    Then the url should contain "collectionspace/ui/core/html/administration.html"
    Then close the browser

  #Test2

  #Likely a crippling lack of stepdefs

  Scenario: Administration is unavailable for user account without administrative privileges
    Given user is on the "My CollectionSpace" page
      And user selects the "Administration" tab
      And user selects the "Roles & Permissions" tab
      And user clicks the "+ Role" button
      And user enters "No Admin" in the "Administration" "Role Name" field
      And user sets Permissions for "termlist" to None
      And user sets Permissions for "users" to None
      And user sets Permissions for "role" to None
      And user clicks the "Save" button
      And user selects the "Users" tab
      And user clicks the "+ User" button
      And user enters "Notanemail@notanemail.com" in the "Administration" "Email Address" field
      And user enters "No Admin User" in the "Administration" "Full Name" field
      And user enters "12341234" in the "Administration" "Password" field
      And user enters "12341234" in the "Administration" "Confirm Password" field
      And user clicks "No Admin" from Roles list 
      And user clicks the "Save" button
      And user clicks the "Sign Out" button
      And user enters "Notanemail@notanemail.com" in the "Email" field
      And user enters "12341234" in the "Password" field
      And user clicks the "Sign In" button
    Then the Adminstration tab should not appear
