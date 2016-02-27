# Created by Regina Xu on 2/26/16

@vocabterms
Feature: Storage Location Authority Page

Scenario: Vocabularies
    Actions:
        From the Create New screen, choose the Storage Location radio button
    Expected:
        A list of vocabularies should appear in a drop-down menu
    Actions:
        Choose the "Offsite Storage Locations" vocabulary and click Create New
    Expected:
        A blank Storage Location authority record editor should appear
        In the top right corner, the label "Storage Location [Offsite Storage Locations]" should appear
    Actions:
        Enter "Warehouse" in the Display Name field and save the record
    Expected:
        The record should save as expected and the label "Storage Location [Offsite Storage Locations]" should still appear in the top right corner
    Actions:
        Return to the Create New screen and choose Storage Location
        Choose the "Local Storage Locations" vocabulary from the drop-down and click Create
    Expected:
        A blank Storage Location authority record editor should appear
        In the top right corner, the label "Storage Location [Local Storage Locations]" should appear
    Actions:
        Enter "Warehouse Two" in the Display Name field and save the record
    Expected:
        The record should save as expected and the label "Storage Location [Local Storage Locations]" should still appear in the top right corner
    Actions:
        Using the upper right search bar, enter "Warehouse" in the keyword search
        Select "Storage Location" from the drop down and press search
    Expected:
        Both records you created should appear in the search results
    Actions:
        Using the upper right search bar, enter "Warehouse" in the keyword search
        Select "Storage Location" and "Offsite Storage Locations" from the drop downs and press search
    Expected:
        Only the first record you just created should appear in the search results
    Actions:
        Click on the record for "Warehouse" that appears in the search results
    Expected:
        The record should load and the label "Storage Location [Offsite Storage Locations]" should appear in the top right corner
    Actions:
        Using the upper right search bar, enter "Warehouse" in the keyword search
        Select "Storage Location" and "Local Storage Locations" from the drop downs and press search
    Expected:
        Only the second record you created ("Warehouse Two") should appear in the search results
    Actions:
        Click on the record for "Warehouse Two" that appears in the search results
    Expected:
        The record should load and the label "Storage Location [Local Storage Locations]" should appear in the top right corner
    Actions:
        Create a new Location/Movement/Inventory record
        Type "Warehouse" in the Current Location field
    Expected:
        Both Warehouse and Warehouse Two should appear in the term completion drop down
    Actions:
        Choose "Warehouse Two"
        Save the record. (In the confirmation dialog that appears after saving, choose "Save" - not "Hard Save".)
    Expected:
        "Warehouse Two" remains in the Current Location field and appears in the right sidebar
    Actions:
        Click on "Warehouse Two" from the "Terms Used" section of the right sidebar
    Expected:
        You should successfully pivot to the record for "Warehouse Two"
    Actions:
        Create another new Location/Movement/Inventory record
        Type "Warehouse" in the Current Location field
    Expected:
        Both Warehouse and Warehouse Two should appear in the term completion drop down
    Actions:
        Choose "Warehouse"
        Save the record. (In the confirmation dialog that appears after saving, choose "Save" - not "Hard Save".)
    Expected:
        "Warehouse" remains in the Current Location field and appears in the right sidebar
    Actions:
        Click on "Warehouse" from the "Terms Used" section of the right sidebar
    Expected:
        You should successfully pivot to the record for "Warehouse"

Scenario: Display Name

    Actions:
        From Create New screen, create a new Storage Location. (You'll next see a screen titled something like "Storage location term")
        Enter "Shelf 4B" in the Name (not Display Name) field
        Click the save button
    Expected:
        The message "Please specify a Display Name" should be displayed in the Message Bar at bottom
        The Storage location should not be saved
    Actions:
        Enter some Display Name
        Click or tab out of that field
    Expected:
        The Display Name should now be displayed above the tabs
    Actions:
        Create a new repeatable Term block by clicking the "+" button above the current block.
        Enter a different Display Name
        Mark this Term block as "Preferred"
    Expected:
        The new Display Name should be displayed above the tabs

Scenario: All fields saved on new and edited Storage Location record

    Actions:
        Variation a:Create a new Storage Location record
        Variation b:Edit an existing Storage Location record (Search for a Storage Location you know exists, using the top right search area)
        Enter values into each of the fields in the record, based on the following:
            In the select boxes (drop down boxes), select something other than the first
            In the authority fields, either write something and add it using the small dialog that appears. Or write something and select from the options that appears. The authority fields are:
                Source (Citation authority)
                Location broader context (Storage location authority)
                Location narrower context (Storage location authority)
                Location related term (Storage location authority) ver. 4.x
            In the text areas (multiline text fields), write multiline text.
            In the regular text areas write regular text
        Create at least two fields or groups for any repeatable fields or groups
        Click the bottom save button
    Expected:
        A "New Record successfully created" (variation a)/"Record successfully saved" (variation b) message should appear along with the current time, in bottom of the page
        After the successful save message appear, All the fields should contain the same value as you entered/selected
        After the successful save message appear, The authorities should be displayed under Terms Used Broader/narrower terms are not yet displayed in the right sidebar
        After the successful save message appear, The newlines should still be present in text areas
        After the successful save message appear, The select boxes should contain the same values as you selected
        After the successful save message appear, The Date fields should select the same dates as you selected

Scenario: Removing values from all fields

    Actions:
        Continue from Scenario (or open an existing Storage Location record (via the search functionality))
        Remove the values from all the fields in the formula, except for the Display Name in each Location Term Group
        click the Save button
    Expected:
        A success message from save should appear
        The header above the tabs should show only the Preferred Display Name for the Storage Location record
        After the successful save message appears, all of the fields should be shown as empty
    Actions:
        Delete the Display Name
        Click the save button
    Expected:
        The message "Please specify a Display Name" should be displayed above Storage Location formula
        Storage Location should not be saved

Scenario: Deletion of Record

    Actions:
        Create a new Storage Location Authority record and fill in at least the Display Name
        Take note of the Display Name of the record
        Click the "Delete" button in the very bottom of the object record
    Expected:
        The delete button should be disabled and nothing should happen
    Actions:
        Save the record
        Click the "Delete" button in the very bottom of the object record
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
        Confirmation of deletion dialog should appear. Click "Delete"
        You should be redirected to the Find and Edit page
    Actions:
        Using the top right search area, select Storage Location from the drop down and enter the Display Name of the deleted record
    Expected:
        The Storage Location should not be found.

    Actions:
        Open an existing Storage Location Authority record that has at least one related record (e.g. where at least one other record, such as an object or procedural record, uses this Storage Location Authority term as a value in one or more of its fields). (If you wish, you can create a new Location/Movement/Inventory record, enter the name of that existing Storage Location Authority record into its Current Location field, and save that Location/Movement/Inventory record. Then you can return to the existing Storage Location Authority record by clicking its link in the right sidebar.)
        Click the "Delete" button in the very bottom of the object record
    Expected:
        A dialog should appear warning that “This Storage location record can not be removed. It is used by other records."
        The record should not be deleted.

Scenario: Fold/Unfolding boxes

    Actions:
        variations: Do this for each of the boxed areas in the main record and the right sidebar
        click the fold/unfold symbol (triangle symbol) or the text next to it
    Expected:
        First time the boxed area should fold, and symbol should change to folded
        Second time the boxed area should unfold, and symbol should change to unfolded

Scenario: Docking Title Bar

    Actions:
        Continue from Scenario (or create a new record)
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

Warnings
Scenario1: Cancel Changes buttons

    Actions:
        Open an existing Storage Location Authority record, do not make any changes
        Variation A: Click Cancel changes button at the top of the page
        Variation B: Click Cancel changes button at the bottom of the page
    Expected:
        Cancel changes buttons should be disabled and nothing should happen
    Actions:
        Edit at least one field, and click or tab out of that field
        Variation A: Click Cancel changes button at the top of the page
        Variation B: Click Cancel changes button at the bottom of the page
    Expected:
        Cancel changes button should be active
        Record should be reverted to before changes were made
    Actions:
        Click the Save button
        Variation A: After successful save, click the Cancel changes button at the top of the page
        Variation B: After successful save, click the Cancel changes button at the bottom of the page
    Expected:
        Cancel changes button should be disabled and nothing should happen

Scenario3: Warning on attempting to leave edited page

    Actions:
        Variation a: Create a new Storage Location record
        Variation b: Edit an existing Storage Location record
        Edit a field (on variation a, at least fill out Display Name), and click or tab out of that field
        Click the Find and Edit menu item
    Expected:
        A dialog should appear, warning to navigate away from edited/unsaved page
    Actions:
        Variation I: click Save button
        Variation II: click Don't Save button
        Variation III: click the Cancel button
        Variation IV: click the close symbol in NE corner
    Expected:
        on (I): Storage Location should be saved and user redirected to the page navigated to. Check whether saved by navigating back to the record.
        on (II): Storage Location should not be saved and user should be redirected to the page navigated to. Check whether saved by navigating back to the authority.
        on (III) and (IV): dialog should be dismissed without any changes (no saves or redirects).

Keyboard Navigation:
Scenario1: All fields available via the keyboard

    Actions:
        Use tab through the entire formula (Note: In Safari, you must use "Option+tab" to tab through any hyperlinks)
    Expected:
        Each of the fields should be reachable
        The two save buttons, as well as Cancel button, should be reachable
        The folding functionality should be usable (tab to it and hit space)
        It should at all times be possible to see where the focus is

Scenario3: Vocabulary Fields usable via keyboard only

    Actions:
        Go to an authority field (eg. Broader context)
        Variation a: Write a part of an existing Storage Location (eg. "MST")
        Variation b: Write a nonexisiting Storage Location
    Expected
        Variation a: The drop down of existing authorities should be reachable using keyboard only
        Variation b: The options on that drop down menu to cancel (use the Esc key) and Add term to (near the bottom of that menu) should be available using keyboard only

Scenario5: Date Fields usable via keyboard only

    Actions:
        Open existing, or create new Storage Location
        Go to a date field using the keyboard only
        Try selecting a date of a different month, year, and day than the current (Note: In Safari and Chrome, you may need to use "Option+tab" to tab into the days of the month area first, before you can successfully select a date.)
    Expected
        This should all be doable using keyboard only

Preferred and Non-Preferred Terms
Scenario6: Preferred and Non-Preferred Terms: NPT Not Allowed

    Actions:
        Log out of CollectionSpace
        Log back in to the LifeSci tenant by clicking on the link in the text on the left side of the login screen
        From Create New screen, create a new Storage Location.
        Enter "Cellar Crypt" in the Display Name field
        Create a second repeatable term block
        Enter "Cellar" in the second Display Name field
        Create a third repeatable term block
        Enter "Crypt" in the third Display Name field
        Mark "Cellar" as preferred
        Save the record
        Create a new Location/Movement/Inventory record
        Type "Cell" in the "Current Location" field
    Expected:
        In the term completion drop down, "Cellar" should appear in black
        Underneath "Cellar", "Cellar Crypt" should appear indented in grey
    Actions:
        Click on "Cellar Crypt"
    Expected:
        "Cellar Crypt" should not be clickable and nothing should happen
    Actions:
        Click on "Cellar"
    Expected:
        The field now contains the term "Cellar" and the term should appear in the header bar
    Actions:
        Save the record
    Expected:
        The Current Location field still contains the term "Cellar" and the term should appear in the header and the right sidebar
    Actions:
        Click on the term in the right sidebar
    Expected:
        You should navigate to the Storage Location Authority record for "Cellar" indicating that "Cellar" is the Preferred term and "Cellar Crypt" are a non-preferred terms

Scenario7: Preferred and Non-Preferred Terms: Non-preferred terms allowed

    Actions:
        Log out of CollectionSpace
        Log back in to the core tenant
        From Create New screen, create a new Storage Location.
        Enter "Basement" in the Display Name field
        Create a second repeatable term block
        Enter "Cellar" in the second Display Name field
        Create a third repeatable term block
        Enter "Cellar Crypt" in the third Display Name field
        Mark "Cellar" as preferred
        Save the record
        Create a new Location/Movement/Inventory record
        Type "Cell" in the "Current Location" field
    Expected:
        In the term completion drop down, "Cellar" should appear in black
        Underneath "Cellar", "Cellar Crypt" should appear indented in black
    Actions:
        Click on "Cellar Crypt"
    Expected:
        The field now contains the term "Cellar Crypt" and the term should appear in the right sidebar
    Actions:
        Save the record
    Expected:
        The Current Location field still contains the term "Cellar Crypt" and the term should still appear in the right sidebar
    Actions:
        Click on "Cellar Crypt" in the right sidebar
    Expected:
        You should navigate to the Storage Location Authority record for "Cellar" indicating that "Cellar" is the Preferred term and "Cellar Crypt" is a non-preferred term

Hierarchical Authorities QA Scenariolan - Storage Location Authority

    Actions:
        Create a new Storage Location Authority record
        Set the Display Name to "Foo State"
        Set the broader context to "Foo Country" (add if necessary when prompted)
        Set a narrower context to "Foo City" (add if necessary when prompted)
        Add a repeatable narrower context to "Foo District" (add if necessary when prompted)
        Save.
    Expected:
        Broader context (Foo Country), Narrower contexts (Foo City and Foo District) and equivalent context (none) should be correct.

    Actions:
        Try to type something in the equivalent context field
    Expected:
        Equivalent context field should be read-only and nothing should happen

    Actions:
        Search for "Foo City", and edit that record.
        Set a narrower context to "Foo Borough" (add if necessary when prompted)
        Add a repeatable narrower context to "Foo Town" (add if necessary when prompted)
        Save.
    Expected:
        Check that the narrower context list (Foo Borough and Foo Town), broader context (Foo State), and equivalent context (Foo District) are correct.

    Actions:
        Add another repeatable narrower context to "Foo Community" (add if necessary when prompted)
        Save.
    Expected:
        Check that the narrower context list (Foo Borough, Foo Town, Foo Community), broader context (Foo State), and equivalent context (Foo District) are correct.

    Actions:
        Search for "Foo Town", and open that record.
    Expected:
        Check that broader context (Foo City) and equivalent context (Foo Borough, Foo Community) are correct.

    Actions:
        Search for "Foo District", and open that record.
    Expected:
        Check that broader context (Foo State) and equivalent context (Foo City) are correct.

    Actions:
        Set a narrower context to "Foo Street" (add if necessary when prompted)
        Add a repeatable narrower context to "Foo Lane" (add if necessary when prompted)
        Save.
    Expected:
        Check that broader context (Foo State), equivalent context (Foo City), and narrower contexts (Foo Street and Foo Lane) are correct.

    Actions:
        Add an access note.
        Save.
    Expected:
        Check that broader context (Foo State), equivalent context (Foo City), and narrower contexts (Foo Street and Foo Lane) are still correct.

    Actions:
        Search for "Foo" on Storage Location
    Expected:
        Ensure the list is complete (Country, State, City, District, Town, Borough, Lane, Street, Community), and then browse to several to ensure they are right.

Hierarchy:

    Foo Country
        Foo State
            Foo City
                Foo Borough
                Foo Community
                Foo Town
            Foo District
                Foo Lane
                Foo Street

    Actions:
        Create a new Storage Location record
        Enter "Foo World" as the display name
        In the Narrower Context field enter "Foo House".
        Save
        Change the Narrower Context field to "Foo Town".
    Expected:
        A dialog should appear saying something like "Foo Town currently has broader term Foo City. Change broader term?"

    Actions:
        Click "No".
    Expected:
        Dialog should be dismissed
        No changes should occur

    Actions:
        Change the Narrower context field to "Foo Town" again
        In the appearing dialog, click the close symbol
    Expected:
        Dialog should be dismissed
        No changes should occur

    Actions:
        Change the Narrower context field to "Foo Town" again
        In the appearing dialog, click Confirm
        Save the record
    Expected:
        After the successful save message appear, the new term should be displayed as entered. The previously entered term should no longer be displayed in the field or the sidebar.
        Click the Go To button next to Foo Town
    Expected:
        The broader context for Foo Town should be the record you created in the previous test, not Foo City

    Actions:
        Search for "Foo Town" and open the record
    Expected:
        "Foo World" should now appear as the Broader Context for "Foo Town"

    Actions:
        Delete the record
    Expected:
        You should not be able to delete the record. Instead you should receive the message "This Storage Location record can not be removed. It has a Broader Context."

    *# Remove the Broader context
        Add a narrower context
        Delete the record
    Expected:
        You should not be able to delete the record. Instead you should receive the message ""This Storage Location record can not be removed. It has a narrower Context."

    *# Add a broader context
        Delete the record
    Expected:
        You should not be able to delete the record. Instead you should receive the message ""This Storage Location record can not be removed. It has a Broader Context."

    *# Remove both the narrower and the broader contexts
        Delete the record
    Expected:
        You should be able to successfully delete the record
    Actions:
        Search for the record
    Expected:
        The record should not appear in the search results