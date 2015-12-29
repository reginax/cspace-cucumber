@functionality
#Created by Forest Yang on 12/28/2015

Feature: Navigating between Primary and Secondary Tabs

  #Test1
  Scenario: Navigating between Secondary and Primary Tabs
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging"
      And user enters "0923102" in the "Cataloging" "Identification Number" field
      And the user saves the record
    Then the record is successfully saved
      And user enters "15" in the "Cataloging" "Number of Objects" field
      And user selects the "Acquisition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Acquisition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "15" in the "Cataloging" "Number of Objects" field
      And user selects the "Acquisition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "15" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  #Test2: Repeating test1 for all secondary tabs
  Scenario: Cataloging secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "16" in the "Cataloging" "Number of Objects" field
      And user selects the "Cataloging" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Cataloging" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "16" in the "Cataloging" "Number of Objects" field
      And user selects the "Cataloging" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "16" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Condition secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "17" in the "Cataloging" "Number of Objects" field
      And user selects the "Condition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Condition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "17" in the "Cataloging" "Number of Objects" field
      And user selects the "Condition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "17" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Exhibition secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "18" in the "Cataloging" "Number of Objects" field
      And user selects the "Exhibition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Exhibition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "18" in the "Cataloging" "Number of Objects" field
      And user selects the "Exhibition" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "18" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Intake secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "19" in the "Cataloging" "Number of Objects" field
      And user selects the "Intake" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Intake" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "19" in the "Cataloging" "Number of Objects" field
      And user selects the "Intake" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "19" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Group secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "20" in the "Cataloging" "Number of Objects" field
      And user selects the "Group" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Group" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "20" in the "Cataloging" "Number of Objects" field
      And user selects the "Group" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "20" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Loan In secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "21" in the "Cataloging" "Number of Objects" field
      And user selects the "Loan In" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Loan In" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "21" in the "Cataloging" "Number of Objects" field
      And user selects the "Loan In" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "21" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Loan Out secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "22" in the "Cataloging" "Number of Objects" field
      And user selects the "Loan Out" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Loan Out" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "22" in the "Cataloging" "Number of Objects" field
      And user selects the "Loan Out" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "22" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Media Handling secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "23" in the "Cataloging" "Number of Objects" field
      And user selects the "Media Handling" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Media Handling" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "23" in the "Cataloging" "Number of Objects" field
      And user selects the "Media Handling" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "23" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Loc/Mov/Inv secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "24" in the "Cataloging" "Number of Objects" field
      And user selects the "Loc/Mov/Inv" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Loc/Mov/Inv" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "24" in the "Cataloging" "Number of Objects" field
      And user selects the "Loc/Mov/Inv" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "24" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Object Exit secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "25" in the "Cataloging" "Number of Objects" field
      And user selects the "Object Exit" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Object Exit" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "25" in the "Cataloging" "Number of Objects" field
      And user selects the "Object Exit" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "25" should be in the "Cataloging" "Number of Objects" field
    Then close the record

  Scenario: Valuation secondary tab
    Given user is on the "My Collectionspace" page
      And user enters "0923102" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on the top nav search submit button
      And the user clicks on result with text "0923102"
    Then the titlebar should contain "Cataloging"
      And user enters "26" in the "Cataloging" "Number of Objects" field
      And user selects the "Valuation" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Cancel" button
    Then the dialog should be dismissed
      And user selects the "Valuation" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Don't Save" button
      And user selects the "Current Record" tab
    Then "" should be in the "Cataloging" "Number of Objects" field
      And user enters "26" in the "Cataloging" "Number of Objects" field
      And user selects the "Valuation" tab
    Then a dialog asking to save changes should appear
      And user clicks the "Save" button
      And user selects the "Current Record" tab
    Then "26" should be in the "Cataloging" "Number of Objects" field
    Then close the record

    