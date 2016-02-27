# Created by Regina Xu on 2/26/16

@vocabterms
Feature: Organization Vocabulary Page

Scenario: Vocabularies
    Actions:
        From the Create New screen, choose the Organization radio button
    Expected:
        A list of vocabularies should appear in a drop-down menu
    Actions:
        Choose the "Local Organizations" vocabulary and click Create

        A blank Organization authority record editor should appear
        In the top right corner, the label "Local Organizations" should appear
    Actions:
        Write "Joe Bean and Company" in the Display Name field and save the record
    Expected:
        The records should save as expected and the label "Local Organizations" should still appear in the top right corner
    Actions:
        Return to the Create New screen and choose Organization
        Choose the "ULAN Organizations" vocabulary from the drop-down and click Create
    Expected:
        A blank Organization authority record editor should appear
        In the top right corner, the label "ULAN Organizations" should appear
    Actions:
        Write "Joe Bean and Sons" in the Display Name field and save the record
    Expected:
        The records should save as expected and the label "ULAN Organizations" should still appear in the top right corner
    Actions:
        Using the upper right search bar, write "Joe Bean" in the keyword search
        Select "Organization" from the drop down and press search
    Expected:
        Both records you created should appear in the search results
    Actions:
        Using the upper right search bar, write "Joe Bean" in the keyword search
        Select "Organization" from the drop down a new drop down will appear to the right
        Select "Local Organizations" from the drop down and press search
    Expected:
        Only the first record you just created ("Joe Bean and Company") should appear in the search results
    Actions:
        Click on the record for "Joe Bean and Company" that appears in the search results
    Expected:
        The records should load and the label "Local Organizations" should appear in the top right corner
    Actions:
        Using the upper right search bar, write "Joe Bean" in the keyword search
        Select "Organization" from the drop down a new drop down will appear to the right
        Select "Organization-ULAN" from the drop down and press search
    Expected:
        Only the second record you created ("Joe Bean and Sons") should appear in the search results
    Actions:
        Click on the record for "Joe Bean and Sons" that appears in the search results
    Expected:
        The record should load and the label "Organization ULAN" should appear in the top right corner
    Actions:
        From the Create New screen, create a new Cataloging record and fill in the required fields
        Type "Joe" in the Content->Organization field
    Expected:
        Both Joe Bean and Company and Joe Bean and Sons should appear in the term completion drop down
    Actions:
        Choose "Joe Bean and Sons"
        Save the record
    Expected:
        "Joe Bean and Sons" remains in the Content->Organization field and appears in the right sidebar
    Actions:
        Click on "Joe Bean and Sons" from the "Terms Used" section of the right sidebar
    Expected:
        You should successfully pivot to the record for "Joe Bean and Sons"

        Create another new cataloging record and fill in the required fields
        Type "Joe" in the Content->Organization field
    Expected:
        Both "Joe Bean and Sons" and "Joe Bean and Company" should appear in the term completion drop down
    Actions:
        Choose "Joe Bean and Company"
        Save the record
    Expected:
        "Joe Bean and Company" remains in the Content->Organization field and appears in the right sidebar
    Actions:
        Click on "Joe Bean and Company" from the "Terms Used" section of the right sidebar
    Expected:
        You should successfully pivot to the record for "Joe Bean and Company"

Scenario: Display Name

    Actions:
        From the Create New screen, create a new Organization record.
        Enter "Organization" in the  Organization Information section -> Main Body Name field
        Click the save button
    Expected:
        A message mentioning that the record "must contain a non-empty display name" should be displayed in the Message Bar at bottom
        Organization should not be saved
    Actions:
        Write some Display Name and Save
    Expected:
        The Display Name should now be displayed above the tabs
    Actions:
        Create a new repeatable Term block Click the the Green Tab with the "+" sign. Upper right hand corner above the Term Blocks.
        Write a different Display Name
        Mark this Term block as "Preferred" then Save
    Expected:
        The new Display Name should be displayed above the tabs

Scenario: All fields saved on new and edited Organization record

    Actions:
        Variation a: Create a new Organization record
        Variation b: Edit an existing Organization record (Search for an Organization you know exists, using the top right search area)
        Fill out the entire record (except for the Hierarchy section at bottom) based on the following:
            In the select boxes (drop down boxes), select something other than the first
            In the authority fields, either write something and add it using the small dialog that appears. Or write something and select from the options that appears.
            In the text areas (multiline text fields), write multiline text.
            In the regular text areas write regular text
        Create at least two fields or groups for any repeatable fields or groups
        Click the bottom save button
    Expected:
        A "New Record successfully created" (variation a)/"Record successfully saved" (variation b) message should appear along with the current time (at the bottom of the page)
        After the successful save message appear, All the fields should contain the same value as you entered/selected
        After the successful save message appear, The authorities should be displayed under Terms Used in the right sidebar
        After the successful save message appear, The newlines should still be present in text areas
        After the successful save message appear, The select boxes should contain the same values as you selected
        After the successful save message appear, The Date fields should select the same dates as you selected

Scenario: Removing values from all fields

    Actions:
        Continue from test 3 (or open existing Organization record (via the search functionality))
        Remove the values from all the fields in the record, except the Display Name for each of the term(s) in the record.
        click the Save button
    Expected:
        A success message from save should appear
        The header above the tabs should show only the Preferred Display Name for the Organization record
        All the fields should remain empty
    Actions:
        Delete the Display Name from the Preferred term
        Click the save button
    Expected:
        The message "Could not update vocabulary" should be displayed above the Organization record
        Organization should not be saved

Scenario: Fold/Unfolding boxes

    Actions:
        variations: Do this for each of the boxed areas
        click the fold/unfold symbol or text next to it
    Expected:
        First time the boxed area should fold, and symbol should change to folded
        Second time the boxed area should unfold, and symbol should change to unfolded

Scenario: Deletion of Record

    Actions:
        Create a new Organization Authority record and fill in at least the Display Name
        Take note of the Display Name of the record
        Click the "Delete" button in the very bottom of the organization record
    Expected:
        The delete button should be disabled and nothing should happen
    Actions:
        Save the record
        Click the "Delete" button in the very bottom of the organization record
    Expected:
        A dialog should appear asking you to confirm deletion
    Actions:
        click cancel.
    Expected
        Dialog should be dismissed
        no other changes should occur.
    Actions:
        Click the delete button again
    Actions:
        click the close symbol
    Expected
        Dialog should be dismissed
        no other changes should occur.
    Actions:
        Click the delete button again
        In the appearing dialog, click Delete
    Expected:
        A dialog should appear requesting Confirmation of your delete. Click Delete
        You should be redirected to the Find and Edit page
    Actions:
        Using the top right search area, select Organization from the drop down and enter the Display Name of the deleted record
    Expected:
        The Organization should not be found.

    Actions:
        Open an existing Organization Authority record that has at least one Used By record in the right sidebar (indicating that this organization term is used in that record)
        Click the "Delete" button in the very bottom of the organization record
    Expected:
        A dialog should appear warning that “This Organization record cannot be removed. It is used by other records."
        The record should not be deleted.

Scenario: Docking Title Bar

    Actions:
        Continue from Scenario(or create a new record)
        If your browser has a scroll bar visible, scroll the page down
    Expected:
        The title bar (term name, record/vocabulary type) should remain pinned to the top of the page while you scroll
    Actions
        If your browser does not have a scroll bar visible, add enough instances of a repeatable field to lengthen the page to where a scroll bar is necessary
        Scroll the page down
    Expected:
        The title bar (term name, record/vocabulary type) should remain pinned to the top of the page while you scroll

Scenario: Alternating shading for repeated groups

    Actions:
        Select the green plus sign above the Term group twice to create two additional instances of the group
    Expected:
        The new Term groups should alternate between dark/light shading
    Actions:
        Select the green plus sign above the Address group twice to create two additional instances of the group
    Expected:
        The new Address groups should alternate between dark/light shading

Warnings
Scenario: Cancel Changes buttons

    Actions:
        Open an existing Organization Vocabulary record, do not make any changes
        Variation A: Click Cancel changes button at the top of the page
        Variation B: Click Cancel changes button at the bottom of the page
    Expected:
        Cancel changes buttons should be disabled and nothing should happen
    Actions:
        Edit at least one field, and click or Tab out of that field
        Variation A: Click Cancel changes button at the top of the page
        Variation B: Click Cancel changes button at the bottom of the page
    Expected:
        Cancel changes button should be active
        Record should be reverted to before changes were made
    Actions:
        Edit at least one field, and click or Tab out of that field
        Click the Save button
        Variation A: After successful save, click the Cancel changes button at the top of the page
        Variation B: After successful save, click the Cancel changes button at the bottom of the page
    Expected:
        Cancel changes button should be disabled and nothing should happen

Scenario: Warning on attempting to leave edited page

    Actions:
        Variation a: Create a new Organization record
        Variation b: Edit an existing Organization record
        Edit a field (on variation a, at least fill out Display Name), and click or Tab out of that field
        Click the Find and Edit menu item
    Expected:
        A dialog should appear, warning to navigate away from edited/unsaved page
    Actions:
        Variation I: click Save button
        Variation II: click Don't Save button
        Variation III: click the Cancel button
        Variation IV: click the close symbol in NE corner
    Expected:
        on (I): Organization should be saved and user redirected to the page you were navigating to. Check whether saved by navigating back to the record.
        on (II): Organization should not be saved and user should be redirected to he page you were navigating to. Check whether saved by navigating back to the authority.
        on (III) and (IV): dialog should be dismissed without any changes (no saves or redirects).

Keyboard Navigation:
Scenario: All fields available via the keyboard

    Actions:
        Use tab through the entire formula
    Expected:
        Each of the fields should be reachable
        The two save buttons, as well as Cancel button, should be reachable
        The folding functionality should be usable (tab to it and hit space)
        It should at all times be possible to see where the focus is

Scenario: Vocabulary Fields usable via keyboard only

    Actions:
        Go to an organization authority field. (Example: the Current Owner field in the Object Exit record, which accepts both Organization authority and Person authority terms.)
        Variation a: Enter a prefix (the start of a search term) that matches an existing organization.
        Variation b: Enter a prefix that matches a non-existing organization
    Expected
        Variation a: The drop down of existing authorities should be reachable using keyboard only
        Variation b: The options on that drop down menu to cancel (use the Esc key) and Add term to (near the bottom of that menu) should be available using keyboard only

Scenario5: Date Fields usable via keyboard only

    Actions:
        Open existing, or create new Organization
        Go to a date field using the keyboard only
        Try selecting a date of a different month, year, and day than the current (the date fields in Organization are structured dates, and not calendar dates with date pickers. Kim Brasen 09-20-2013)
    Expected
        This should all be doable using keyboard only

Preferred and Non-Preferred Terms
Scenario6: Preferred and Non-Preferred Terms: NPT Not Allowed

    Actions:
        Log out of CollectionSpace
        Log back in to the LifeSci tenant by clicking on the link in the text on the left side of the login screen
        From Create New screen, create a new Organization.
        Enter "Museum of the Moving Image" in the Display Name field
        Create a second repeatable term block
        Enter "Moving Image" in the second Display Name field
        Create a third repeatable term block
        Enter "American Museum of the Moving Image" in the third Display Name field
        Mark "Moving Image" as preferred
        Save the record
        Create a new Loan In record and fill in the required fields
        Type "Moving" in the "Lender" field
    Expected:
        In the term completion drop down, "Moving Image" should appear in black
        Underneath "Moving Image", "Museum of the Moving Image" and "American Museum of the Moving Image" should appear indented in grey
    Actions:
        Click on "Museum of the Moving Image"
    Expected:
        "Museum of the Moving Image" should not be clickable and nothing should happen
    Actions:
        Click on "American Museum of the Moving Image"
    Expected:
        "American Museum of the Moving Image" should not be clickable and nothing should happen
    Actions:
        Click on "Moving Image"
    Expected:
        The field now contains the term "Moving Image"
    Actions:
        Save the record
    Expected:
        The Lender field still contains the term "Moving Image" and the term should appear in the right sidebar
    Actions:
        Click on the term in the right sidebar
    Expected:
        You should navigate to the Organization record for "Moving Image" indicating that "Moving Image" is the Preferred term and "Museum of the Moving Image" and "American Museum of the Moving Image" are a non-preferred terms

Scenario7: Preferred and Non-Preferred Terms: Non-preferred terms allowed

    Actions:
        Log out of CollectionSpace
        Log back in to the core tenant
        From Create New screen, create a new Organization.
        Enter "Museum of the Moving Image" in the Display Name field
        Create a second repeatable term block
        Enter "Moving Image" in the second Display Name field
        Create a third repeatable term block
        Enter "American Museum of the Moving Image" in the third Display Name field
        Mark "Moving Image" as preferred
        Save the record
        Create a new Loan In record and fill in the required fields
        Type "Moving" in the "Lender" field
    Expected:
        In the term completion drop down, "Moving Image" should appear in black
        Underneath "Moving Image", "Museum of the Moving Image" and "American Museum of the Moving Image" should appear indented in black
    Actions:
        Click on "Museum of the Moving Image"
    Expected:
        The field now contains the term "Museum of the Moving Image"
    Actions:
        Save the record
    Expected:
        The Lender field still contains the term "Museum of the Moving Image" and the term should appear in the right sidebar
    Actions:
        Click on "Museum of the Moving Image" in the right sidebar
    Expected:
        You should navigate to the Organization record for "Moving Image" indicating that "Moving Image" is the Preferred term and "Museum of the Moving Image" is a non-preferred term

Hierarchal Authorities QA Scenariolan - Organization Authority

    Actions:
        Create a new Organization Authority record
        Set the Display Name to "Foo Company"
        Set the broader context to "Foo Worldwide" (add if necessary when prompted)
        Set a narrower context to "Foo Division" (add if necessary when prompted)
        Add a repeatable narrower context to "Foo Subsidiary" (add if necessary when prompted)
        Save.
    Expected:
        Broader context (Foo Worldwide), Narrower contexts (Foo Division and Foo Subsidiary) and equivalent context (none) should be correct.

    Actions:
        Try to type something in the equivalent context field
    Expected:
        Equivalent context field should either be hidden, or should be read-only and nothing should happen

    Actions:
        Search for "Foo Subsidiary", and edit that record.
        Set a narrower context to "Foo One" (add if necessary when prompted)
        Add a repeatable narrower context to "Foo Two" (add if necessary when prompted)
        Save.
    Expected:
        Check that the narrower context list (Foo One and Foo Two), broader context (Foo Company), and equivalent context (Foo Division) are correct.

    Actions:
        Add another narrower context to "Foo Three" (add if necessary when prompted)
        Save.
    Expected:
        Check that the narrower context list (Foo One, Foo Two, Foo Three), broader context (Foo Company), and equivalent context (Foo Division) are correct.

    Actions:
        Search for "Foo Two", and open that record.
    Expected:
        Check that broader context (Foo Subsidiary) and equivalent context (Foo One, Foo Three) are correct.

    Actions:
        Search for "Foo Division", and open that record.
    Expected:
        Check that broader context (Foo Company) and equivalent context (Foo Subsidiary) are correct.

    Actions:
        Set a narrower context to "Foo X" (add if necessary when prompted)
        Add a narrower context to "Foo Y" (add if necessary when prompted)
        Save.
    Expected:
        Check that broader context (Foo Company), equivalent context (Foo Subsidiary), and narrower contexts (Foo X and Foo Y) are correct.

    Actions:
        Add a value to the History field.
        Save.
    Expected:
        Check that broader context (Foo Company), equivalent context (Foo Subsidiary), and narrower contexts (Foo X and Foo Y) are still correct.

    Actions:
        Search for "Foo" on Organization,
    Expected:
        Ensure the list is complete (Worldwide, Company, Subsidiary, Division, and Foo One, Two, Three, X, and Y), and then browse to several to ensure that the entries in their Hierarchy sections look right.

That hierarchy should be:

    Foo Worldwide
        Foo Company
            Foo Subsidiary
                Foo One
                Foo Two
                Foo Three
            Foo Division
                Foo X
                Foo Y

    Actions:
        Create a new Organization record
        Fill out display name
        In the Narrower Context field enter "Foo Two".
    Expected:
        A dialog should appear saying something like "Foo Two currently has broader term Foo Subsidiary. Change broader term?"

    Actions:
        Click No
    Expected:
        Dialog should be dismissed
        No changes should occur

    Actions:
        Change the Narrower context field to "Foo Two" again
        In the appearing dialog, click the close symbol
    Expected:
        Dialog should be dismissed
        No changes should occur

    Actions:
        Change the Narrower context field to "Foo Two" again
        In the appearing dialog, click Yes
        Save the record
    Expected:
        After the successful save message appear, the new term should be displayed as entered. The previously entered term should no longer be displayed in the field.

        Click the Go To button next to Foo Two
    Expected:
        The broader term for Foo Two should be the term you created in the previous test, not Foo Subsidiary

    Actions:
        Enter a value in any field in the record, other than in the Hierarchy section.
        Save the record
        Delete the record
    Expected:
        You should not be able to delete the record. Instead you should receive the message "This Organization record can not be removed. It has a Narrower Context."

    *# Remove the Narrower context
        Add a broader context
        Save the record
        Delete the record
    Expected:
        You should not be able to delete the record. Instead you should receive the message ""This Organization record can not be removed. It has a Broader Context."

    *# Add a narrower context, alongside the existing Broader Context.
        Save the record
        Delete the record
    Expected:
        You should not be able to delete the record. Instead you should receive the message ""This Organization record can not be removed. It has a Narrower Context."

    *# Remove both the narrower and the broader contexts
        Delete the record
    Expected:
        You should be able to successfully delete the record
    Actions:
        Search for the record
    Expected:
        The record should not appear in the search results