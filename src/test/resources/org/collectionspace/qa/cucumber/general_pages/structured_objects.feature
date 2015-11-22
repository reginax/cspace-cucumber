# Created by Cesar Villalobos on 11/21/2015

@generalpages
Feature: Structured Objects- QA Test Plan


  Scenario: User creates a new Cataloging Record and its hierarchy 
	Given user is on the "Create New" page
	And selects the "Cataloging" radio button on the Create New page
	And clicks on the "Create" button
	And enters "2012.12.1a" in the "Identification Number" field
	And enters "2012.12.1" in the "Broader object" field
	And clicks on the "Create new" button # might not be specific enough
    And user selects "Word (verso)" from dropdown in "Broader object type" row # I am 90% sure this isn't going to work here
    And enters "2012.12.1a.1" in the "Object component" field
	And clicks on the "Create new" button # might not be specific enough
	And user selects "Separable part" in the "Object component type"  row # might not work 

	And user clicks the plus to repeat the "Object component" form
	And enters "2012.12.1a.2" in the "Object component" field
	And clicks on the "Create new" button # might not be specific enough	
	And user selects "Separable part" in the "Object component type"  row # might not work 
	And the user saves the record

	# For the following "Thens", they might not be specific enough
	# In the Webpage, there are different rows and I'm not entirely sure how to discriminate amongst them
	# So for Object component stuff, it might not be specific enough, though it should work
	Then the "Broader Object" field should contain "2012.12.1"
	Then the "Object component" field should contain "2012.12.1a.2"
	Then the "Object component" field should contain "2012.12.1a.1"
	Then the "Broader object type" field should contain "Work (verso)" # this might not work
	Then the "Object component type" field should contain "separable part" # this might not work

	###################
	##### BEGIN 1B#####
	###################
	And clicks on the "Go To" button next to the "Broader Object" field #needs Stepdef
	Then the "Object component" field should contain "2012.12.1a" # this might not work
	Then the "Object component type" field should contain "Verso" # this might not work
	Then the "Broader Object" field should be empty #neds step def
	Then close the browser
	###################
	##### BEGIN 1C#####
	###################

	Given the user is on the "My CollectionSpace" page
	And user enters "2012.12.1a.2" in the top nav search field
	And clicks on the top nav search submit button
	And the user clicks on result with text "2012.12.1a.2"
	Then the "Equivalent component" field should not be editable #needs stepdef
	Then the "Equivalent component" field should contain "2012.12.1a.1"





Actions:
# Search for "2012.12.1a.2" and navigate to that record
# Try to type something in the equivalent component field
# Expected:
# Equivalent component field should be read-only and nothing should happen when you type. That field should continue to contain "2012.12.1a.1".
Actions:
Set an object component to "2012.12.1a.2a" (add new when prompted)
Add a repeatable object component to "2012.12.1a.2b" (add new when prompted)
Save.
Expected:
Check that the object component list (2012.12.1a.2a and 2012.12.1a.2b), broader object (2012.12.1a), and equivalent component (2012.12.1a.1) are correct.
Actions:
Add another object component to "2012.12.1a.2c" (add if necessary when prompted)
Save.
Expected:
Check that the object component list (2012.12.1a.2a, 2012.12.1a.2b, 2012.12.1a.2c), broader object (2012.12.1a), and equivalent component (2012.12.1a.1) are correct.
Actions:
Click the "Go to" button next to the object component field for "2012.12.1a.2b"
Expected:
The record "2012.12.1a.2b" should load
Check that broader object (2012.12.1a.2) and equivalent components (2012.12.1a.2a, 2012.12.1a.2c) are correct.

	###################
	##### BEGIN 1D#####
	###################

	###################
	##### BEGIN 1E#####
	###################

	###################
	##### BEGIN 1F#####
	###################

	###################
	##### BEGIN 1F#####
	###################

	###################
	##### BEGIN 2A#####
	###################

	###################
	##### BEGIN 2B#####
	###################

	###################
	##### BEGIN 2C#####
	###################

	###################
	##### BEGIN 2D#####
	###################

	###################
	##### BEGIN 2E#####
	###################
	
	###################
	##### BEGIN 2F#####
	###################

	###################
	##### BEGIN 2G#####
	###################

	###################
	##### BEGIN 2H#####
	###################

	###################
	##### BEGIN 3 #####
	###################

	###################
	##### BEGIN 4 #####
	###################

	###################
	##### BEGIN 15#####
	###################
