# Created by cbn at 9/16/15
@perms
Feature: #Enter feature name here
  # Enter feature description here

  Scenario Outline: Create Roles
    Given user is on the "Administration" page
      And user clicks on "Roles & Permissions" tab
      And user clicks on the button with text "+ Role"
    Then the "Role Name" field should be visible in the "Roles & Permissions" form
      And user enters "<role name>" in the "Roles & Permissions" "Role Name" field
      And user adds permissions for "<role name>"
      And the user saves the record
    Examples:
    |role name|
    | role1   |
    | role2   |
    | role3   |
    | role4   |
    | role5   |
    | role6   |
    | role7   |
    | role8   |

