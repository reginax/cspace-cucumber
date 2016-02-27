# Created by Regina Xu on 2/26/16

@administration
Feature: User Management
Scenario 0.1: Check that the Administrator user is properly displayed

    Actions:
        Login with full privileges
        Go to administration

    Expected:
        The Administrator user should be displayed on the list to the left
    Actions:
        Click the Administrator user

    Expected:
        The edit user form should be displayed
        The email address should be: admin@core.collectionspace.org
        Both the "Email Address" and "Full Name" fields should be greyed-out (read-only)
        Full name should be Administrator
        The TENANT_ADMINISTRATOR role should be marked

Scenario 0.2: Check that the Reader user is properly displayed

    Actions:
        Login with full privileges
        Go to administration

    Expected:
        The Administrator user should be displayed on the list to the left
    Actions:
        Click the Reader user

    Expected:
        The edit user form should be displayed
        The email address should be: reader@core.collectionspace.org
        Both the "Email Address" and "Full Name" fields should be greyed-out (read-only)
        Full name should be Reader
        The TENANT_READER role should be marked

User creation related
Scenario Missing values on user creation

    Actions:
        login as administrative user
        go to the administrative area by clicking the Administration tab in the UI or simply http://qa.collectionspace.org:8180/collectionspace/ui/html/administration.html
        Verify that the Users tab is the active tab. (If not, click that tab.)
        click the "+ User" (Create New User) button
        variation 1: Fill out all fields but Email Address
        variation 2: Fill out all fields but Full Name
        variation 3: Fill out all fields but Password
        variation 4: Fill out all fields but Confirm Password
        variation 5: Fill out all fields but Full Name and Email Address
        Click save
    Expected:
        "Required field is empty:" error message
        User should not appear on list of users to the left

Scenario 3: Invalid email address on user creation

    Actions:
        Continue from Scenario(or log in as administrative user, go to the Administration pages and click the "+ User" (Create New User) button)
        Make sure Full Name, Password, Confirm Password are valid
        Variation a: Leave the Email text field blank
        Variation b: In Email text field, enter: "false@mail"
        Variation c: In Email text field, enter: "falsemail"
        Variation d: In Email text field, enter: "falsemail.Scenario"
        Let status be active
        Click Save
    Expected:
        Error message for invalid email address
        User should not appear on list of users to the left ("New Record" will appear instead)

Scenario Non-matching Passwords on user creation

    Actions:
        Continue from Scenario 3 (or log in as administrative user, go to the Administration pages and click the "+ User" (Create New User) button)
        Make sure Full Name, Email Address are valid
        Variation 1: Fill in Password, leave confirm password blank
        Variation 2: Fill in Password, fill in something different in confirm password
        Variation 3: Fill in Confirm Password, leave Password blank
        Let status be active
        Click Save
    Expected:
        An error message about non-matching passwords should appear
        User should not appear on list of users to the left

Scenario 7: Invalid Password Length on user creation

    Actions:
        Continue from Scenario(or log in as administrative user, go to the Administration pages and click the "+ User" (Create New User) button)
        make sure Full Name, Email Address are valid
        Variation 1: Write "Scenario123" (excluding the quotes) in Password (you can use copy/paste)
        Variation 2: Write "Scenario123456789012345678901" (excluding the quotes) in Password (you can use copy/paste)
        Click save button
    Expected:
        An error message about non-matching passwords should appear
    Actions:
        Fill out the Confirm Password field with a password matching the one you typed in Password field
        Click Save button
    Expected:
        An error message about password length should appear
    Actions:
        Change the Password and Confirm Password fields to "Scenario"
        Click Save button
    Expected:
        The new user should be saved, and appear in the list of Users at left
        The error messages should disappear

Scenario 9: Canceling changes during user creation

    Actions:
        Continue from Scenario 7 (or log in as administrative user, go to the Administration pages and click the "+ User" (Create New User) button)
        Enter text in each of the fields in the User record
        Set Status to Inactive
        Click the box next to at least one role, in the list of Roles at right
        Click Cancel changes
    Expected:
        Any text you've entered is removed and all of the text fields in the User record are blank (empty)
        The Status has reverted to Active
        No boxes are checked in the list of Roles at right

Scenario: Successful user creation

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        click "+ User" (Create New User)
        Fill in valid Email Address, Full Name, Password, Confirm Password
        Let status be active
        Select at least two roles for the user
        Click delete
    Expected:
        The delete button should be inactive and nothing should happen
    Actions:
        Click Save
    Expected:
        Success message
        User appearing on list to the left
    Actions:
        Click user on list to the left
    Expected:
        User data should appear in the user details box
        All the data should be the same as entered earlier. (Note: the Password and Confirm Password values will be hidden.)
        The roles should match those you set
    Actions:
        Click on the Sign out button
        Enter email and password of the newly created user
        Click the Sign in button
    Expected:
        The Find and Edit page should be displayed (collectionspace/ui/core/html/findedit.html)

User editing and detail viewing related
Scenario: Successful edit of user

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        if no user exists, create one according to steps in Scenario "Successful user creation"
        click on a user name from list of users
    Expected:
        All fields but the "User Id" field in the User Details area should be active. The "User Id" field should be greyed-out (read-only).
    Actions:
        Change Email Address, Full Name fields
        Change the roles assigned to user
        Click the save button
    Expected:
        The old username should not be on list of users
        The new username should be on list of users
        The user details should contain the changed values
        The newly selected roles should be selected

User Deletion
Scenario: Successful deletion

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        If there is no users on the list that you are comfortable deleting, create a new user according to steps in Scenario "Scenario: Successful user creation"
        click the "Delete" button
    Expected:
        Dialog should appear, rest of page should be out of focus
    Actions:
        variation 1: Click the cancel button in the appearing dialog
        variation 2: Click the close symbol in top right corner of the appearing dialog
    Expected:
        User should still appear on list of users
        User should still be selected and in edit mode
    Actions:
        Click Delete
    Expected:
        User should not appear on list of users
        Text should appear that user was deleted successfully
        The user details area should not display details for any user
    Actions:
        Click the Log Out button
        Fill in the username and password of the deleted user
    Expected:
        Error message explaining "Invalid email/password combination"

Scenario 23: Can user delete him/herself

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        Select the user you are logged in as, from the users list
    Expected:
        No delete button should appear

Warnings on leaving an unsaved screen
Scenario 31: Allow to leave page on empty fields on user creation

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        click "+ User" (Create New User)
        Click the "Find and Edit" tab
    Expected:
        URL = collectionspace/ui/html/findedit.html

Scenario 33: Warn when leaving page after unsaved change

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        Variation 1: Edit Existing user, change one field's value, and tab or click out of that field
        Variation 2: click "+ User" (Create New User) and change/fill out at least one field, and tab or click out of that field
        Variation 3: Edit Existing user, change some role(s)
        Click anything that will remove you from the view of user you are editing (eg. Find and Edit tab, "+ User" button, Another username from list, etc)
    Expected:
        Confirmation dialog warning of unsaved changes

Scenario 35: Cancel functionality of confirmation dialog when leaving page after unsaved changes

    Actions:
        Continue from Scenario 33
        You should have the dialog warning you to leave displayed
        Variation 1: Click the "Cancel" button
        Variation 2: Click the close symbol of dialog
    Expected:
        Dialog disappear
        User details should still be filled out

Scenario 37: Save functionality of confirmation dialog when leaving page after unsaved changes

    Actions:
        Continue from Scenario 35 (or login as administrative user, go to the Administration pages and click the "+ User" (Create New User) button)
        Fill in valid Email Address, Full Name, Password, Confirm Password
        Click anything that will remove you from the view of user you are editing (eg. Find and Edit tab, "+ User" button, Another username from list, etc)
        In the dialog warning you to leave, click the save button
    Expected
        You should be taken to the item/link you clicked
    Actions:
        click Administration tab
    Expected:
        New user should be on list
        The user should contain the user details you entered

Scenario 37: "Don't Save" functionality of confirmation dialog when leaving page after unsaved changes

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        click "+ User" (Create New User)
        Fill in valid Email Address, Full Name, Password, Confirm Password
        Click Find and Edit tab
        Click the "Don't save" button
    Expected:
        Dialog should disappear
    Actions:
        click Administration tab
    Expected:
        New user should not be on list

Activation and Deactivation:
Scenario1: Deactivation of user

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        click some user on the list to the left
        select Inactive from the status drop-down to the right
        Click Save
    Expected:
        A successful saved message should appear
        Status should be inactive on user list to the left
    Actions:
        click the log out link top right corner of screen
        attempt to login using deactivated user
    Expected:
        Error message saying "Invalid email/password combination"

Scenario3: Activation of user

    Actions:
        if no user is currently inactive, follow the "deactivation of user" Scenario above.
        login as administrative user
        go to collectionspace/ui/html/administration.html
        select an inactive user on the list to the left
        select Active from the status drop-down to the right
        Click Save
    Expected:
        A successfully saved message should appear
        Status should be active on the user list to the left
    Actions:
        click the log out link top right corner of screen
        attempt to login using activated user
    Expected:
        URL= collectionspace/ui/html/findedit.html

Scenario: User cannot deactivate himself

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        click on the user you logged in as on the list to the left
    Expected:
        The status select-box should be missing or disabled
        The delete button should be disabled

Search area
Scenario: Search area prerequisite

    Actions:
        login as administrative user
        go to collectionspace/ui/html/administration.html
        click "+ User" (Create New User)
        In Email Address type: "mailman@Scenariomail.com"
        In Full Name type: "The Big Lebowski"
        In Password type: "secretpass"
        In Confirm Password type: "secretpass"
        Let status be active
        click Save

Scenario: Successful user search

    Actions:
        If you haven't already, follow the steps in "Scenario: Search area prerequisite" (should only be done once)
        go to the user administration
        Variation 1: enter "Big" in the find area (Scenario full word)
        Variation 2: enter "big" in the find area (Scenario case sensitivity)
        Variation 3: enter "big lebowski" in the find area (Scenario multiple words)
        Variation 4: enter "bi" in the find area (Scenario partial match)
        Variation 5: enter "the lebowski" in the find area (Scenario separate words)
        Variation 6: enter "big le" in the find area (Scenario fragments)
        Variation 7: enter "" in the find area
        click find user
    Expected
        The user "The Big Lebowski" should appear on list of users

Scenario: Show All users button

    Actions:
        Continue from Scenario (or login as administrative user, go to user administration pages)
        enter "snth" in the find area
    Expected:
        The user "The Big Lebowski" should not appear on list of users
        The Show all users button should be visible
    Actions:
        Click the Show all users button
    Expected:
        All users should be shown (including "The Big Lebowski")
        Show all users button should disappear

Keyboard Navigation:
Scenario: Navigation to user administration using keyboard

    Actions
        Navigate to the administration page using tab only
    Expected
        At all times it is possible to see where focus is
        The ordering of tab movement is sensible

Scenario: General keyboard navigation

    Actions
        Add new user, using keyboard only
        Edit existing user, using keyboard only
        Delete user, using keyboard only
        Navigate away from edited user using keyboard only:
            Select user to edit
            Change e-mail address without saving
            Click administration Find and edit menu item
            Select "Don't save" on the dialog
    Expected
        At all times it is possible to see where focus is. (The focus indication in Chrome and Safari is subtle; see the resolved bug: CSPACE-3823)
        The ordering of tab movement is sensible
        All the above is doable using only keyboard

Scenario: Enter submits user creation (FUTURE)

    Actions: (Do the following using keyboard only)
        login as administrative user
        go to collectionspace/ui/html/administration.html
        click "+ User" (Create New User)
        Fill in valid Email Address, Full Name, Password, Confirm Password
        Let status be active
        Press the Enter key
    Expected:
        User should be saved (ie. pressing Enter should trigger a Save) (known bug: CSPACE-2031)

Scenario: Enter submits search (FUTURE)

Successful user search

    Actions:
        If you haven't already, follow the steps in "Search area prerequisite"
        login as administrative user
        go to collectionspace/ui/html/administration.html
        enter "Big" in the find area
        Hit the enter button
    Expected
        The user "The Big Lebowski" should appear on list of users (ie. enter should trigger search) (known bug: CSPACE-3817)