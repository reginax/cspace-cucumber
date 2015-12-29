# Created by Cesar Villalobos on November 20th 2015

@recordssecondarytab
Feature: #Enter feature name here
  # Enter feature description here

  Scenario: Working Acquisition Secondary Tab
  	Given user is on the "My CollectionSpace" page 
    And user enters "04131995" in the top nav search field
    And selects "Cataloging" from the top nav search record type select field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And the user clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field
    And user selects the "Acquisition" tab 

    # Then related acq records should be listed in a table
    # if none, then "no related records yet"

    # Begin test 3:
    

