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
If adding a feature for a record or authority, you'll need create a few new files and update a few existing files. Below we'll step through the example of creating a Place authority record.

#### New Files
First we'll need to create the cucumber test class for the Place Authority, which runs the test, and the cucumber feature file which defines the steps to be followed in the testing, using the [gherkin syntax](https://github.com/cucumber/cucumber/wiki/Gherkin). Cucumber uses file name conventions to relate these files, so the packagers and base file names need to be the same,  with classes in  `src/test/java` and feature files in `src/test/resources`. So for our Place test, we'll the full paths where we need to add files are:

* Cucumber Feature - `src/test/resources/org/collectionspace.qa.cucumber/place/PlaceAuthority.feature`
* Integration Test Class - `src/test/java/org/collectionspace.qa.cucumber/place/PlaceAuthorityIT.java` 

A very simple cucumber feature for Place Authority would look like:

```gherkin
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
Each file has a single feature that can contain many `Scenario`s.

Each line that starts with `Given`, `And`, or `Then` needs to have a corresponding Step Definition with a regular expression that matches the line, with words in quotes being passed as variables. For example

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
The step definitions are defined in a separate package so thta cna be made available to multiple features.


The integration test class is all boilerplate, but required. It should look something like:

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

More `@CucmumberOptions` [are available](https://cucumber.io/docs/reference/jvm#configuration).

Next we'll create a Place class that extends the Record class, which will be used to store information about fields in that class, such as selectors to use to operate on fields, labels, and values to add when filling in fields.
By convention, these files go into `src/test/java/org/collectionspace/qa/records`.

