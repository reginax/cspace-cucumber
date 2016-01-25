# Created by fy at ___?
@functionality

Feature: Search Results and Pagination



  Scenario: User creates Cataloging records
      Given user is on the "Create New" page
          And selects the "Cataloging" radio button on the Create New page
          And clicks on the Create button
          And user enters "1234" in the "Cataloging" "Identification Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Cataloging" radio button on the Create New page
          And clicks on the Create button
          And user enters "2345" in the "Cataloging" "Identification Number" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
  #No Stepdef
      Then "1234" should appear in the "Cataloging Records" form
  #No Stepdef
      Then "2345" should appear in the "Cataloging Records" form
      Then close the browser




  Scenario: Search for keyword "sesame"
      Given user is on the "My CollectionSpace" page
  # No Stepdef
          And clicks "1234" to load the record
          And user enters "sesame" in the "Cataloging" "Brief Description" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
  # No Stepdef
          And clicks "2345" to load the record
          And user enters "sesame" in the "Cataloging" "Distinguishing Features" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Cataloging" radio button on the Create New page
          And clicks on the Create button
          And user enters "sesame" in the "Cataloging" "Title" field
          And user enters "3456" in the "Cataloging" "Identification Number" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
          And user enters "sesame" in the top nav search field
          And selects "Cataloging" from the top nav search record type select field
          And clicks on the top nav search submit button

      Then the search results should contain "1234"

      Then the search results should contain "2345"

      Then the search results should contain "3456"
  #Uncertain if necessary for test: the top of the page should say 3 results found
      Given user is on the "Create New" page
          And selects the "Cataloging" radio button on the Create New page
          And clicks on the Create button
          And user enters "sesame" in the "Cataloging" "Title" field
          And user enters "4567" in the "Cataloging" "Identification Number" field
          And the user saves the record
          And user enters "sesame" in the top nav search field
          And selects "Cataloging" from the top nav search record type select field
          And clicks on the top nav search submit button
  # No Stepdef
      Then the search results should contain "4567"
  # Skipping Advanced search section of the test.. No stepdefs at all
  # No Stepdef
          And user clicks the "Identification Number" heading above the list results
  # No Stepdef
      Then results should sort by "Identification Number" in descending order
  # No Stepdef
          And user clicks the "Identification Number" heading above the list results
  # No Stepdef
      Then results should sort by "Identification Number" in ascending order
  # No Stepdef
          And user clicks the "Summary" heading above the list results
  # No Stepdef
      Then results should sort by "Title" in descending order
  # No Stepdef
          And user clicks the "Summary" heading above the list results
  # No Stepdef
      Then results should sort by "Title" in ascending order
  # No Stepdef
          And user clicks the "Record Type" heading above the list results
  # No Stepdef
      Then results should sort by "Record Type" in ascending order
  # No Stepdef
          And user clicks the "Record Type" heading above the list results
  # No Stepdef
      Then results should sort by "Record Type" in descending order
  # No Stepdef
          And user clicks the "Updated At" heading above the list results
  # No Stepdef
      Then results should sort by "Updated At" in ascending order
  # No Stepdef
          And user clicks the "Updated At" heading above the list results
  # No Stepdef
      Then results should sort by "Updated At" in descending order
      Then close the browser

  #The test plan contains a ridiculous action in which one each of a loan in, loan out, acquisition,
  #location / movement / inventory, object exit, intake, condition check, group, valuation control,
  #media handling, person, organization, concept, place, storage location, work, and citation is created.
  #This seems a bit gratuitous...

  Scenario: Search for a key phrase
      Given user is on the "My CollectionSpace" page
  # No Stepdef
          And clicks "1234" to load the record
          And user enters "sesame street" in the "Cataloging" "Brief Description" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
  # No Stepdef
          And clicks "2345" to load the record
          And user enters "sesame street" in the "Cataloging" "Distinguishing Features" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Cataloging" radio button on the Create New page
          And clicks on the Create button
          And user enters "sesame street" in the "Cataloging" "Brief Description" field
          And user enters "3456" in the "Cataloging" "Identification Number" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
          And user enters "sesame street" in the top nav search field
          And selects "Cataloging" from the top nav search record type select field
          And clicks on the top nav search submit button
  # No Stepdef
      Then the search results should contain "1234"
  # No Stepdef
      Then the search results should contain "2345"
  # No Stepdef
      Then the search results should contain "3456"
  #Uncertain if necessary for test: the top of the page should say 3 results found
      Given user is on the "Create New" page
          And selects the "Cataloging" radio button on the Create New page
          And clicks on the Create button
          And user enters "sesame" in the "Cataloging" "Brief Description" field
          And user enters "1029" in the "Cataloging" "Identification Number" field
          And the user saves the record
          And user enters "sesame street" in the top nav search field
          And selects "Cataloging" from the top nav search record type select field
          And clicks on the top nav search submit button
  # No Stepdef
      Then the search results should contain "1029"
      Then close the browser

  Scenario: search for record containing authority term "James Fanboy"
      Given user is on the "Create New" page
          And selects the "Person" radio button on the Create New page
          And clicks on the Create button
          And user enters "James Fanboy" in the "Person" "Display Name" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Cataloging" radio button on the Create New page
          And clicks on the Create button
          And user enters "6677" in the "Cataloging" "Identification Number" field
          And user enters "James Fanboy" in the "Cataloging" "Owner" vocab field
          And user clicks on "James Fanboy" from autocomplete options
      Given user is on the "Find and Edit" page
  # No stepdef
          And user enters "James Fanboy" in the search field
  # No stepdef
      Then the search results should contain "6677"
  # No stepdef
          And clicks "6677" to load the record
      Then the titlebar should contain "6677"
      The close the browser

  Scenario: Perform a wildcard search
      Given user is on the "My CollectionSpace" page
          And user enters "*" in the top nav search field
          And selects "Cataloging" from the top nav search record type select field
          And clicks on the top nav search submit button
  # No Stepdef
      Then all Cataloging records are displayed
      Given user is on the "My CollectionSpace" page
          And user enters "" in the top nav search field
          And selects "Cataloging" from the top nav search record type select field
          And clicks on the top nav search submit button
  # No Stepdef
      Then all Cataloging records are displayed
      Then close the browser

  Scenario: Search for a user
      Given user is on the "Administration" page
  # No Stepdef
          And user clicks the "+ User" button
          And user enters "Mary Poppins" in the "Full Name" field
          And user enters "fakeemail@fakeaddress.com" in the "Email Address" field
          And user enters "12341234" in the "Password" field
          And user enters "12341234" in the "Confirm Password" field
          And user clicks on the Save button
          And user enters "Mary Poppins" in the "find" field
  # No Stepdef
          And user clicks the "Find User" button
  # Find user not exactly a search, so may not be right stepdef
      Then the search results should contain "Mary Poppins"
          And user clicks the "Show All Users" button
  # No Stepdef for all users
      Then the search results should contain all users
      Then close the browser

  Scenario: Boolean Keyword Search
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And user enters "King size bed q" in the "Loan Out" "Loan Out Conditions" field
          And user enters "11262015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And user enters "King size bed qa" in the "Loan Out" "Loan Out Conditions" field
          And user enters "11272015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And user enters "King size bed qwa" in the "Loan Out" "Loan Out Conditions" field
          And user enters "11282015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And user enters "Queen size bed q" in the "Loan Out" "Loan Out Conditions" field
          And user enters "11292015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And user enters "Queen size bed qa" in the "Loan Out" "Loan Out Conditions" field
          And user enters "11302015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And user enters "Queen size bed qwa" in the "Loan Out" "Loan Out Conditions" field
          And user enters "11312015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
          And user enters "queen and bed" in the top nav search field
          And selects "Loan Out" from the top nav search record type select field
          And clicks on the top nav search submit button
      Then the search results should contain "11292015"
      Then the search results should contain "11302015"
      Then the search results should contain "11312015"
      Given user is on the "My CollectionSpace" page
          And user enters "king and bed not queen" in the top nav search field
          And selects "Loan Out" from the top nav search record type select field
          And clicks on the top nav search submit button
      Then the search results should contain "11262015"
      Then the search results should contain "11272015"
      Then the search results should contain "11282015"
      Given user is on the "My CollectionSpace" page
          And user enters "king or queen" in the top nav search field
          And selects "Loan Out" from the top nav search record type select field
          And clicks on the top nav search submit button
      Then the search results should contain "11292015"
      Then the search results should contain "11302015"
      Then the search results should contain "11312015"
      Then the search results should contain "11262015"
      Then the search results should contain "11272015"
      Then the search results should contain "11282015"
      Then close the browser

  
  Scenario: Test 13: Traverse through search results pages
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12341" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12342" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12343" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12344" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12345" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12346" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12347" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12348" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12349" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12350" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12351" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "Create New" page
        And selects the "Acquisition" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Acquisition"
        And user enters "12352" in the "Acquisition" "Acquisition Reference Number" field
  # text field?
        And user enters "known item" in the "Acquisition" "Acquisition Reason" field
        And user enters "Made up name" in the "Acquisition" "Acquisition Source" vocab field
  # Don't know if this is a stepdef
        And user adds "Made up name" to "Local Persons" from vocabulary autocomplete
        And the user saves the record
      Then the record is successfully saved
      Given user is on the "My CollectionSpace" page
        And user enters "known item" in the top nav search field
        And selects "Acquisition" from the top nav search record type select field
        And clicks on the top nav search submit button
      Then the search results should contain "12341"
      Then the search results should contain "12342"
      Then the search results should contain "12343"
      Then the search results should contain "12344"
      Then the search results should contain "12345"
      Then the search results should contain "12346"
      Then the search results should contain "12347"
      Then the search results should contain "12348"
      Then the search results should contain "12349"
      Then the search results should contain "12350"
  # Probably not a stepdef
        And the user clicks "next"
      Then the search results should contain "12351"
      Then the search results should contain "12352"
      Then close the browser
  
  #Crucial stepdefs do not exist
  Scenario: Traverse through search results from within records
      Given user is on the "My CollectionSpace" page
        And user enters "known item" in the top nav search field
        And selects "Acquisition" from the top nav search record type select field
        And clicks on the top nav search submit button
      Then the search results should contain "12345"
  # not a stepdef!
        And clicks "12345" to load the record
  # not a stepdef!
      Then the top left should indicate this is result "5 of 12"
  # not a stepdef!
        And clicks back arrow next to indicator
      Then the titlebar should contain "12344"
  # not a stepdef!
        And clicks forward arrow next to indicator
      Then the titlebar should contain "12345"
  # not a stepdef!
        And clicks "Return to search results"
      Then the search results should contain "12341"
      Then the search results should contain "12342"
      Then the search results should contain "12343"
      Then the search results should contain "12344"
      Then the search results should contain "12345"
      Then the search results should contain "12346"
      Then the search results should contain "12347"
      Then the search results should contain "12348"
      Then the search results should contain "12349"
      Then the search results should contain "12350"
      Then close the browser

  #Crucial stepdefs do not exist
  Scenario: Pagination & Sorting in secondary tabs, related records, used and used by lists
      Given user is on the "Create New" page
        And selects the "Cataloging" radio button on the Create New page
        And clicks on the create button
      Then the titlebar should contain "Cataloging"
        And user enters "Remember Me" in the "Cataloging" "Identification Number" field
        And the user saves the record
      Then the record is successfully saved
  # i think this is (not) stepdef
        And selects the "Acquisition" tab
  # not a step def
        And clicks "add record"
  # not a step def
        And in the resulting dialogue, user searches for "known item" 
      Then the search results should contain "12341"
      Then the search results should contain "12342"
      Then the search results should contain "12343"
      Then the search results should contain "12344"
      Then the search results should contain "12345"
  # not a step def
        And user adds all search results to record
  # none of these are stepdefs
      Then the list of related records should contain "12341"
      Then the list of related records should contain "12342"
      Then the list of related records should contain "12343"
      Then the list of related records should contain "12344"
      Then the list of related records should contain "12345"
      Then the list of related procedures should contain "12341"
      Then the list of related procedures should contain "12342"
      Then the list of related procedures should contain "12343"
      Then the list of related procedures should contain "12344"
      Then the list of related procedures should contain "12345"
      Given user is on the "My CollectionSpace" page
        And user enters "Made up name" in the top nav search field
        And selects "Person" from the top nav search record type select field
        And clicks "Made up name" to load the record
  # none of these are stepdefs
      Then the used by list should contain "12341"
      Then the used by list should contain "12342"
      Then the used by list should contain "12343"
      Then the used by list should contain "12344"
      Then the used by list should contain "12345"
      Then close the browser
