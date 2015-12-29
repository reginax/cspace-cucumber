# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Valuation Tab
  # Enter feature description here

  Scenario: Working Valuation Control Secondary Tab #1
		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA116_NE"
	    And user selects the "Valuation Control" tab
	    # Then the Object Exit records should be listed in a table
	    And user goes to the record with identification number "CQA116_E" #empty
	    # If no related records exist, a "No related records yet" message should appear
	    Then close the browser

  Scenario: Dismissing the dialog #3
  		Given the user is in the "My CollectionSpace" page
		And user goes to the record with identification number "CQA116_NE"

		#Variation A
		And the user clicks on the "Add record" button #needs step def
	    # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And the user clicks the "close" button 
	    Then no changes to the record will occur #StepDefs

	    #Variation B
	    And the user clicks on the "Add record" button
	  	# Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And the user presses the "ESC" key # Needs StepDef
	    Then No changes to the record will occur #Needs stepDef

  Scenario: Searching and adding multiple Valuation Control records #5

  Scenario: Warning when navigating away from new Valuation Control record #7

  Scenario: Cancel changes button #9

  Scenario: Check Valuation Control Reference Number and successful save #11

  Scenario: All fields saved on edited Valuation Control record #13

  Scenario: Listing displays correct fields #21

  Scenario: Testing links and "Go To Record" works #23

  Scenario: Deleting relation via list #25

  Scenario: Deleting relation via record editor #27

  Scenario: Testing Functional Accessibility #31





















