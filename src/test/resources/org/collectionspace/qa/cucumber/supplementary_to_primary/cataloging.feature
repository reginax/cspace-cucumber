# Created by Jennifer Be on 12/23/2015
# needs to be tested

@supplementaryprimary
Feature: Supplementary Manual QA - Cataloging

  Scenario: New Record Behavior
    Given user is on the "Create New" page
      And clicks on the Create button
    Then the "cancel" button should not be clickable
    Then the "delete" button should not be clickable
    When user clicks the "add" button on the "Cataloging" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it." should be displayed
    When user clicks the "add" button on the "Procedures" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it." should be displayed
    Then close the browser

  Scenario: Number Chooser
    Given user is on the "Create New" page
      And clicks on the Create button
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Identification Number" row
    Then enables top and bottom "cancel" buttons
      And user clicks Select number pattern
      And user selects "Intake" from dropdown in "Identification Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Cataloging" "Identification Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And clicks on the Create button
      And user enters "1234" in the "Cataloging" "Identification Number" field
      And user enters "testing" in the "Cataloging" "Object Name" field
    Then the titlebar should contain "1234"
    Then the titlebar should contain "testing"
      And user enters "sample" in the "Cataloging" "Title" field
    Then the titlebar should contain "1234"
    Then the titlebar should contain "sample"
      And user clicks the plus to repeat the "Title" form
      # not sure if following line works
      And user adds "sample2" in the "Title" field of the second "Title" form
      And user selects the additional "Title" as primary
    Then the titlebar should contain "1234"
    Then the titlebar should contain "sample2"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And clicks on the Create button
      And user enters "1234" in the "Cataloging" "Identification Number" field
      And the user saves the record
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And clicks on the Create button
      And user enters "1234" in the "Cataloging" "Identification Number" field
      # cannot enable a scroll to bottom of page
      And user clicks on the "Production Date" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Cataloging"
    Then close the browser

  Scenario: Structured Date
    # not sure how to address pop-up dialogue features/checks
    Given user is on the "Create New" page
      And clicks on the Create button
      And user enters "1234" in the "Cataloging" "Identification Number" field
      # following line does not exist
      And user clicks on the "Production Date" field
      And user enters "1500" in the "Cataloging" "Display Date" field
      And the user saves the record
    Then "1500" should be in the "Cataloging" "Production Date" field

  Scenario: Folding and Unfolding Boxes
  # folding steps do not exist
    Given user is on the "Create New" page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Object Identification Information"
    Then the "Object Collection Information" section should fold
    Then the "Fold" symbol next to "Object Collection Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Identification Information"
    Then the "Object Collection Information" section should unfold
    Then the "Fold" symbol next to "Object Collection Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Description Information"
    Then the "Object Description Information" section should fold
    Then the "Fold" symbol next to "Object Description Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Description Information"
    Then the "Object Description Information" section should unfold
    Then the "Fold" symbol next to "Object Description Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Production Information"
    Then the "Object Production Information" section should fold
    Then the "Fold" symbol next to "Object Production Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Production Information"
    Then the "" section should unfold
    Then the "Fold" symbol next to "Object Production Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object History and Association Information"
    Then the "Object History and Association Information" section should fold
    Then the "Fold" symbol next to "Object History and Association Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object History and Association Information"
    Then the "" section should unfold
    Then the "Fold" symbol next to "Object History and Association Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Owner's Contribution Information"
    Then the "" section should fold
    Then the "Fold" symbol next to "Object Owner's Contribution Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Owner's Contribution Information"
    Then the "" section should unfold
    Then the "Fold" symbol next to "Object Owner's Contribution Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Viewer's Contribution Information"
    Then the "Object Viewer's Contribution Information" section should fold
    Then the "Fold" symbol next to "Object Viewer's Contribution Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Viewer's Contribution Information"
    Then the "" section should unfold
    Then the "Fold" symbol next to "Object Viewer's Contribution Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Reference Information"
    Then the "Reference Information" section should fold
    Then the "Fold" symbol next to "Reference Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Reference Information"
    Then the "Reference Information" section should unfold
    Then the "Fold" symbol next to "Reference Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should fold
    Then the "Fold" symbol next to "Object Collection Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should unfold
    Then the "Fold" symbol next to "Object Collection Information" should be an unfolded symbol
    Given user clicks on the "Fold" symbol next to "Object Hierarchy"
    Then the "Object Hierarchy" section should fold
    Then the "Fold" symbol next to "Object Hierarchy" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Hierarchy"
    Then the "Object Hierarchy" section should unfold
    Then the "Fold" symbol next to "Object Hierarchy" should be an unfolded symbol
    Then close the browser

  Scenario: Alternating Shading for Repeated Groups
    Given user is on the "Create New" page
      And clicks on the Create button
      And user clicks the plus to repeat the "Title" form
      And user clicks the plus to repeat the "Title" form
     # cannot detect alternating colors
    Then the "Title" group should alternate shading
      And user clicks the plus to repeat the "Dimensions" form
      And user clicks the plus to repeat the "Dimensions" form
    Then the "Dimensions" group should alternate shading
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And clicks on the Create button
      And user enters "1.2.3.4.5" in the "Cataloging" "Identification Number" field
      And user adds "Object" to the "Cataloging" "Concept" vocab field
      And the user saves the record
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "Object" should appear in the Terms Used sidebar
    Then "concept" should appear in the Terms Used sidebar
    Then "contentConcept" should appear in the Terms Used sidebar
      And user clicks on "Object" in the Terms Used sidebar
    Then the titlebar should contain "Object"
    # Used By steps do not exist
    Then "1.2.3.4.5" should appear in the Used By sidebar
      And user clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And user clicks on the delete button
      And user clicks the confirmation delete button
      And user clicks delete confirmation OK button
    Then close the browser

  Scenario: Keyboard Accessibility
    # doesn't work, need to do later
    When user uses tab through the entire formula
    Then each of the fields should be reachable
    Then the two save buttons and Cancel button should be reachable
    Then the folding functionality should be usable # tab to it and hit space
    Then the focus is visible at all times
    Then the terms used in the right frame should be reachable
