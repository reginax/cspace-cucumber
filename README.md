# CollectionSpace Cucumber 
Integration tests for CollectionSpace using cucumber-jvm, selenium, and jUnit

## Requirements
* Java 7
* Maven
* A running CollectionSpace instance. These tests are set to run against an external CollectionSpace instance. By default this is located at http://localhost:8180, however you could easily run it against the [CollectionSpace Demo](http://demo.collections.org:8080)

## Usage
`git clone https://github.com/bibliotechy/cspace-cucumber.git`

`cd cspace-cucumber`

`mvn clean verify`

Then watch all the tests pass.

## Contributing

### Adding a new test feature
If adding a feature for a record or authority, you'll need to:

* create new [cucumber files](#new-cucumber-files)
 * [cucumber feature](#example-cucumber-feature)
 * [integration test class](#example-integration-test-class)
* create a [new class that extends](#extend-the-record-class) `Record`
* Update the [utils method for dynamically instantiating your new class](#update-utils-method) 

Below we'll step through the example of creating a Place authority record.

#### New Cucumber Files
First we'll need to create the cucumber test class for the Place Authority, which runs the test, and the cucumber feature file which defines the steps to be followed in the testing, using the [gherkin syntax](https://github.com/cucumber/cucumber/wiki/Gherkin). Cucumber uses file name conventions to relate these files, so the packagers and base file names need to be the same,  with classes in  `src/test/java` and feature files in `src/test/resources`. So for our Place test, we'll the full paths where we need to add files are:

* Cucumber Feature - `src/test/resources/org/collectionspace.qa.cucumber/place/PlaceAuthority.feature`
* Integration Test Class - `src/test/java/org/collectionspace.qa.cucumber/place/PlaceAuthorityIT.java` 

#### Example Cucumber Feature
A simple cucumber feature for Place Authority at `src/test/resources/org/collectionspace.qa.cucumber/place/PlaceAuthority.feature` would look like:

```gherkin
@place
Feature: Place Authority Data Entry
   As a logged in admin user 
   I want to be able to enter data in the Place authority form 
   
  Scenario: User Creates a minimal Basic Place record
    Given user is on the "Create New" page
     And selects the "Place" radio button on the Create New page
     And clicks on the Create button
    Then the titlebar should contain "Local Places"
     And user enters "New York" in the "Place" "Display Name" field
     And the user saves the record
    Then the record is successfully saved
    Then "New York" should be in the "Place" "Display Name" field
```
Each file has a single feature that can contain many Scenarios.

Each line that starts with `Given`, `And`, or `Then` needs to have a corresponding Step Definition with a regular 
expression that matches the line, with words in quotes being passed as variables. All the lines we wrote in our 
feature are all already defined in the shared step definitions, so this is all we need to do for our feature. 
More information is in the [Step Definitions](#step-definition) section.


#### Example Integration Test Class
The integration test class for Place Authority at `src/test/java/org/collectionspace.qa.cucumber/place/PlaceAuthorityIT.java` is all boilerplate, but required. It should look something like:

```java
package org.collectionspace.qa.cucumber.place;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        # "glue" tells Cucumber where to look for step definitions
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" }, 
        format = { "json:target/report.json" }
)
public class PlaceAuthorityIT {
}
```

More `@CucumberOptions` [are documented on the cucumber project site](https://cucumber.io/docs/reference/jvm#configuration).

#### Extend the record class
Next we'll create a Place class that extends the [Record class](#record-class), which will be used to store information about fields in that class, such as selectors to use to operate on fields, labels, and values to add when filling in fields.
By convention, these files go into `src/test/java/org/collectionspace/qa/records`. So if we create `src/test/java/org/collectionspace/qa/records/Place.java` it would look like:

```java
package org.collectionspace.qa.records;

public class Place extends Record {

    public Place(){
        
        fieldSelectorByLabel.put("Display Name", "csc-placeAuthority-termDisplayName");
        requiredMap.put("csc-placeAuthority-termDisplayName","No place like Home");
    }
}
```

#### Update Utils method
Finally, we need to update the `loadRecordOfType(String recordType)` method, to include a "Place" case in the switch statement.
```java
 public static Record loadRecordOfType(String recordType) throws Exception{
     Record record;
     switch (recordType) {
         case "Person":
             record = new Person();
             break;
         case "Cataloging":
             record = new Cataloging();
             break;
         case "Place":
             record = new Place();
             break;
         default:
             throw new Exception(recordType + ": No classes of that Type known");
     }
     return record;
 }
```

#### Run your empty 
With that in place, we can now run our new test feature. Since we annotated the place feature with the `@place` tag, we can just run our new test:

`mvn clean verify -Dcucumber.options="--tags @place"`



### Step Definitions

Each line that starts with `Given`, `And`, or `Then` needs to have a corresponding Step Definition with a regular 
expression that matches the line, with words in quotes being passed as variables.

For example

```gherkin
Given user is on the "Create New" page
```
corresponds to the Step Definition:
```java
@Given("^user is on the \"([^\"]*)\" page$")
public void user_is_on_page(String pageName) throws Throwable {
   driver.get(BASE_URL + pages.getPageUrls(pageName));
   wait.until(elementToBeClickable(
      By.className(pages.getPageLoadedSelector(pageName))));
    }
```
The step definitions can re used by any Feature because they are defined in a separate package at 
`src/test/java/org/collectionspace/qa/cucumber/stepDefinitions/StepDefs.java`
 

### Record Class
The Record class which other record classes extend, instantiates several HashMaps to contain information needed to interact 
with record forms. They are broken out to accommodate different ways field types need to be handled. They are:

* requiredMap - contains id selector and test data for fields that are required for that record type.
* fieldMap - contains id selector and test data for text fields for that record type.
* selectMap - contains id selector and test data for `<select>` fields.
* vocabMap - contains id selector and test data for vocabulary fields.
* dateMap - contains id selector and test date for calendar date fields.
* tickBoxMap - contains id selector and test date for tick box fields.
* fieldSelectorByLabel - contains label name and id selector for fields. Allows fields to be interacted with by their label, which is only required for a small subset. 

The class also exposes getter classes for each HashMap.

### Run a single feature test

Cucumber allows you to pass in a "tags" option that will limit testing to only those features or scenarios that have that tag. For example, to only run the Place authority tests, you can run:

`mvn clean verify -Dcucumber.options="--tags @place"`

By convention, each Feature is started with an tag annotation, such as  `@place`, `@person`, etc., to simplify running single tests. Similarly, 
if you only want to run a single Scenario, perhaps during the development process, just add a `@test` tag at the start of the scenario and pass the `@test` tag to maven on the cli. 
