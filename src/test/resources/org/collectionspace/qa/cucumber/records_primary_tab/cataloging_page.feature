# Created by Regina Xu on 11/17/2015

@recordsprimarytab
Feature: Cataloging Page Test Plan

Scenario: Identification number
    Given user creates a new Cataloging record
    And clicks on the "save" button
    Then the message "Please specify an Identification Number" should be displayed in the bottom message bar
    When user clicks "Select number pattern" and select one of the patterns from the drop down
    Then the number pattern should be displayed in the identification number field, with the proper values
    When user clicks "Select number pattern" again, and select the number pattern again
    Then the number pattern should be displayed in the identification number field, but with the last number incremented by one

Scenario: Correct Display of header on new
    When user enters "test" in the "Object Identification Information, Object Name, Object Name" field
    And clicks on the "save" button
    Then the identification number should now be displayed above the tabs
    Then the object name should be displayed following the identification number
    When user enters something in the "Object Identification Information, Title, Title" field
    And clicks on the "save" button
    Then the identification number should be displayed above the tabs
    Then the title should be displayed following the identification number

Scenario: All fields saved on new cataloging record and edited record
