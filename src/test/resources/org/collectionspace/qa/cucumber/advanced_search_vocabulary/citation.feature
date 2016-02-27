# Created by Regina Xu on 2/26/16

@advancedsearchvocab
Feature: Advanced Search - Citation 

Scenario 1: Advanced Search Fields

    Actions:
        Create a new Citation record
        Fill in the following fields:
        Display Name (remember what you entered)
        Full Citation
        Language
        Status
        Term Type
        Title
        Save the record
        Print out the record to remember what you entered in each field
        Navigate to advanced search via the link next to the search field in the upper right hand corner
        Select Citation in the record type drop down
        Enter what you previously entered into the Display Name field in the record, into the Display Name field in Advanced Search
        Click search

    Expected:
        The Citation record you just created should appear in the search results

    Actions:
        Do this for each of the fields listed above, field by field, by erasing / un-selecting the value you entered into the previous field, and entering the value in the next field.
    Expected:
        The Citation record you just created should appear in the search results

    Actions:
        Search the Record Last Modified By field for your username (e.g. admin@core.collectionspace.org)
    Expected:
        The Citation record you just created should appear in the search results

    Actions:
        Search the Modified Date field for today's date
    Expected:
        The Citation record you just created should appear in the search results
        (Note, 2/2016: Be aware of the way that Collectionspace handles the time difference between your location and UTC. I last modified a record on 2016-02-04T20:17:36:927 PST, but CSpace recorded the modification at 2016-02-05T00:17:36:927Z, i.e., just after midnight the next day. An advanced search on modified date - latest date February 4, 2016 does not detect the record. This is expected CSpace behavior, though confusing to users, perhaps. - Rick)
