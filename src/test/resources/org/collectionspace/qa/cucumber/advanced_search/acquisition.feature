# Created by Cesar Villalobos on 01/07/2016

@advancedsearch
Feature: Advanced Search ­ Acquisition
 	# Enter feature description here

	Scenario: Advanced Search Fields and wildcard
		Given the user is in the "Create New" page
        # And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA-71.1" in the "Acquisition Reference Number" field 
        And user enters "2016-01-01" in the "Accession date" field
        And user enters "2016-02-02" in the "Acquisition date" field 
        And user selects "Gift" from the "Acquisition Method" drop down box  
        And user enters "CQA-71 Acquisition Source" in the "Acquisition Source" field 
        And user selects "CQA-71 Acquisition Source" from autocomplete options
        And user enters "CQA-71 Funding source" in the "Funding source" field 
        And user selects "CQA-71 Funding source" from autocomplete options
        And user enters "CQA-71 Test" in the "Field collection event name" field 
        And user enters "textbook" in the "Credit Line" field 
        And the user saves the record

        And clicks the "Advanced Search Button"
        # Select Acquisition from the record type drop down
        # Enter what you previously entered in Acquisition Ref Num field in the advanced search record
        And clicks the "search" button
        # The Acquisition record you just created should appear in the search results

        # Do the same for these:
			# Acquisition Reference Number 
			# Accession date (be sure to enter values for Earliest/Single Date, for each of Year, Month and Day)
			# Acquisition date (be sure to enter values for Earliest/Single Date, for each of Year, Month and Day) 
			# Acquisition Method
			# Acquisition source
			# Acquisition funding ­> Funding source
			# Field collection event name
	    # The Acquisition record you created should appear int he search results

	    # Search Earliest Modified Date field for today's date
	    # The Acquisition record you created should appear in the search results

	    # Search edit username field for the username you logged in with
	    # Acquisition record you just created should appear in the search results
	    
		And clicks the "Advanced Search" Button
		#Select Acquisition from record type drop down
		# Enter "textb*" in the Credit Line search field
	    # The Acquisition record you created should appear in the search results		
	    Then close the browser


	Scenario: Boolean field­-based search
        Given the user is in the "Create New" page
        # And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA-71.2" in the "Acquisition Reference Number" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        And user enters "testtest" in the "Acquisition Reason" field
        And user enters "thank you" in the "Credit Line" field        
        And the user saves the record

        # And user goes to the "Create New" page # Stepdef
        # And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA-71.3" in the "Acquisition Reference Number" field
        And user selects "Purchase" from the "Acquisition Method" drop down box  
        And user enters "testtest" in the "Acquisition Note" field
        And user enters "thank you" in the "Credit Line" field
        And the user saves the record

        # And user goes to the "Create New" page # Stepdef
        # And user selects the "Acquisition" radio button on the Create New page
        And user enters "CQA-71.4" in the "Acquisition Reference Number" field
        And user selects "Gift" from the "Acquisition Method" drop down box  
        And user enters "testtest" in the "Acquisition Provisos" field
        And user enters "thank you" in the "Credit Line" field
        And the user saves the record

		And clicks the "Advanced Search Button"
        # Select Acquisition from the record type drop down
        # Select OR/Any from the boolean drop down menu
        # Select "thaank you" from the credit line dropdown
        # select purchase from acq method dropdown
        And clicks the "search" button
        # All three (71.2,.3,.4) should appear in search results

		And clicks the "Advanced Search Button"
 		# Select Acquisition from the record type drop down
        # Select AND/all from the boolean drop down menu
        # Select "thaank you" from the credit line dropdown
        # select purchase from acq method dropdown
        And clicks the "search" button        
        # Then only 71.2 and .3 should be there
        Then close the browser	

	Scenario: Boolean and Keyword Search
        Given the user is in the "My CollectionSpace" page
		And clicks the "Advanced Search Button"
		# In the keyword search field enter "Testtest"
		# Select Acquisition from the record type drop down 
        # Select OR/Any from the boolean drop down menu				
        # Select "thaank you" from the credit line dropdown
        # select purchase from acq method dropdown
        And clicks the "search" button
		# All three records should show up

		And clicks the "Advanced Search Button"
		# In the keyword search field enter "Testtest"		
		# Select Acquisition from the record type drop down 
		# Select all/AND from boolean drop down menu
        # Select "thaank you" from the credit line dropdown
        # select purchase from acq method dropdown
        And clicks the "search" button
        # Then only 71.2/.3 will show up
        Then close the browser

# Delete 71.1-.4!!!!!!
	
