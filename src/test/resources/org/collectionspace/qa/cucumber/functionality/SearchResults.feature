@functionality

Feature: Search Results and Pagination

#Enter feature name here
  # Enter feature description here

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
          And clicks "1234"
          And user enters "sesame" in the "Cataloging" "Brief Description" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
  # No Stepdef
          And clicks "2345"
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
          And selects "1234"
          And user enters "sesame street" in the "Cataloging" "Brief Description" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
  # No Stepdef
          And selects "2345"
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
          And clicks "6677"
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
          And enters "King size bed q" in the "Loan Out" "Loan Out Conditions" field
          And enters "11262015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And enters "King size bed qa" in the "Loan Out" "Loan Out Conditions" field
          And enters "11272015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And enters "King size bed qwa" in the "Loan Out" "Loan Out Conditions" field
          And enters "11282015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And enters "Queen size bed q" in the "Loan Out" "Loan Out Conditions" field
          And enters "11292015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And enters "Queen size bed qa" in the "Loan Out" "Loan Out Conditions" field
          And enters "11302015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "Create New" page
          And selects the "Loan out" radio button on the Create New page
          And clicks on the create button
          And enters "Queen size bed qwa" in the "Loan Out" "Loan Out Conditions" field
          And enters "11312015" in the "Loan Out" "Loan Out Number" field
          And the user saves the record
      Given user is on the "My CollectionSpace" page
          And user enters "queen and bed" in the top nav search field
          And selects "loan out" from the top nav search record type select field
          And clicks on the top nav search submit button
      Then the search results should contain "11292015"
      Then the search results should contain "11302015"
      Then the search results should contain "11312015"
      Given user is on the "My CollectionSpace" page
          And user enters "king and bed not queen" in the top nav search field
          And selects "loan out" from the top nav search record type select field
          And clicks on the top nav search submit button
      Then the search results should contain "11262015"
      Then the search results should contain "11272015"
      Then the search results should contain "11282015"
      Given user is on the "My CollectionSpace" page
          And user enters "king or queen" in the top nav search field
          And selects "loan out" from the top nav search record type select field
          And clicks on the top nav search submit button
      Then the search results should contain "11292015"
      Then the search results should contain "11302015"
      Then the search results should contain "11312015"
      Then the search results should contain "11262015"
      Then the search results should contain "11272015"
      Then the search results should contain "11282015"
      Then close the browser


















  Scenario:


