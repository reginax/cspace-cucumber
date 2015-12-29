@functionality
#Created by Forest Yang on 12/24/2015
Feature: Structured Dates Formatting



  #Test 1
  Scenario: Year value is fully displayed
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging" 
      And user enters "1" in the "Cataloging" "Object Description Information" "Content" "Date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Year" field
    Then "9999" in "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Descriptiong Information" "Content" "Date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Descriptiong Information" "Content" "Date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Cataloging" "Object Description Information" "Content" "Date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #"Cataloging" "Object Description Information" "Textual Inscription" "Date" field
   
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging" 
      And user enters "1" in the "Cataloging" "Object Description Information" "Textual Inscription" "Date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Year" field
    Then "9999" in "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Descriptiong Information" "Textual Inscription" "Date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Descriptiong Information" "Textual Inscription" "Date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Cataloging" "Object Description Information" "Textual Inscription" "Date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Non-Textual Inscription -> Date

    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging" 
      And user enters "1" in the "Cataloging" "Non-Textual Inscription" "Date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Year" field
    Then "9999" in "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Cataloging" "Non-Textual Inscription" "Date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Object Production Information -> Production date

    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging" 
      And user enters "1" in the "Cataloging" "Object Production Information" "Production date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Cataloging" "Object Production Information" "Production date" "Earliest/Single Year" field
    Then "9999" in "Cataloging" "Object Production Information" "Production date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Cataloging" "Object Production Information" "Production date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values


  #Object History & Association -> Associated date

    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging" 
      And user enters "1" in the "Cataloging" "Object History & Association" "Associated date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Year" field
    Then "9999" in "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Cataloging" "Object History & Association" "Associated date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Cataloging" "Object History & Assocation" "Associated date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object History & Assocation" "Associated date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Cataloging" "Object History & Assocation" "Associated date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Object History & Association -> Ownership date

    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging" 
      And user enters "1" in the "Cataloging" "Object History & Association" "Ownership date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Year" field
    Then "9999" in "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Cataloging" "Object History & Association" "Ownership date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Cataloging" "Object History & Assocation" "Ownership date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object History & Assocation" "Ownership date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Cataloging" "Object History & Assocation" "Ownership date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values


  #Object Collection Information -> Field collection date

    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging" 
      And user enters "1" in the "Cataloging" "Object Collection Information" "Field collection date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Year" field
    Then "9999" in "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Cataloging" "Object Collection Information" "Field collection date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Media Handling dates

    Given user is on the "Create New" page
      And selects the "Media Handling" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Media Handling" 
      And user enters "1" in the "Media Handling" "Dates" field
    Then the structured date popup should appear
      And user enters "9999" in the "Media Handling" "Dates" "Earliest/Single Year" field
    Then "9999" in "Media Handling" "Dates" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Media Handling" "Dates" "Earliest/Single Date" row
    Then a drop down list should appear in the "Media Handling" "Dates" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Media Handling" "Dates" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Media Handling" "Dates" "Earliest/Single Date" row
    Then a drop down list should appear in the "Media Handling" "Dates" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Media Handling" "Dates" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Media Handling" "Dates" "Earliest/Single Date" row
    Then a drop down list should appear in the "Media Handling" "Dates" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Media Handling" "Dates" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Organization - Foundation date

    Given user is on the "Create New" page
      And selects the "Organization" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Organization" 
      And user enters "1" in the "Organization" "Foundation date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Organization" "Foundation date" "Earliest/Single Year" field
    Then "9999" in "Organization" "Foundation date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Organization" "Foundation date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Organization" "Foundation date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Organization" "Foundation date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Organization" "Foundation date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Organization" "Foundation date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Organization" "Foundation date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Organization" "Foundation date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Organization" "Foundation date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Organization" "Foundation date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Organization - Dissolution date

    Given user is on the "Create New" page
      And selects the "Organization" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Organization" 
      And user enters "1" in the "Organization" "Dissolution date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Organization" "Dissolution date" "Earliest/Single Year" field
    Then "9999" in "Organization" "Dissolution date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Organization" "Dissolution date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Organization" "Dissolution date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Organization" "Dissolution date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Organization" "Dissolution date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Organization" "Dissolution date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Organization" "Dissolution date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Organization" "Dissolution date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Organization" "Dissolution date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Organization" "Dissolution date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Person - Birth date

    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Person" 
      And user enters "1" in the "Person" "Birth date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Person" "Birth date" "Earliest/Single Year" field
    Then "9999" in "Person" "Birth date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Person" "Birth date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Person" "Birth date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Person" "Birth date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Person" "Birth date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Person" "Birth date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Person" "Birth date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Person" "Birth date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Person" "Birth date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Person" "Birth date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Person - Death date

    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Person" 
      And user enters "1" in the "Person" "Death date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Person" "Death date" "Earliest/Single Year" field
    Then "9999" in "Person" "Death date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Person" "Death date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Person" "Death date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Person" "Death date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Person" "Death date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Person" "Death date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Person" "Death date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Person" "Death date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Person" "Death date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Person" "Death date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values

  #Work - Work date

    Given user is on the "Create New" page
      And selects the "Work" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Work" 
      And user enters "1" in the "Work" "Work date" field
    Then the structured date popup should appear
      And user enters "9999" in the "Work" "Work date" "Earliest/Single Year" field
    Then "9999" in "Work" "Work date" "Earliest/Single Year" field is not cut off
      And user clicks in "Era" column in "Work" "Work date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Work" "Work date" "Earliest/Single Date" row
      And user selects "BCE" from dropdown in "Work" "Work date" "Earliest/Single Date" row
    Then "BCE" should be visible
      And user clicks in "Certainty" column in "Work" "Work date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Work" "Work date" "Earliest/Single Date" row
      And user selects "Probably" from dropdown in "Work" "Work date" "Earliest/Single Date" row
    Then "Probably" should be visible
      And user clicks in "Unit" column in "Work" "Work date" "Earliest/Single Date" row
    Then a drop down list should appear in the "Person" "Work date" "Earliest/Single Date" row
      And user selects "Month(s)" from dropdown in "Person" "Work date" "Earliest/Single Date" row
    Then "Month(s)" should be visible
      And user presses the "Esc" key
    Then the structured date popup should contain entered values
    Then close the browser 

      


