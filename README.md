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
First we'll need to create the cucmumber test class for Place, which runs the test, and the cucmber feature file which defines the steps to be followed in the testing, using the [gherkin syntax](https://github.com/cucumber/cucumber/wiki/Gherkin). Cucumber uses file name conventions to relate these files, so the packagers and base file names need to be the same,  with classes in  `src/test/java` and feature files in `src/test/resources`. So for our Place test, we'll the full paths where we need to add files are:

Integration Test Class - `src/test/java/org/collectionspace.qa.cucumber/place/PlaceAuthorityIT.java` 
Cucumber Feature - `src/test/resources/org/collectionspace.qa.cucumber/place/PlaceAuthority.feature`

Next we'll create a Place class that extends the Record class, which will be used to store information about fields in that class, such as selectors to use to find a field, labels, and values to add when filling in fields.
BY convention, these files go into `src/test/java/org/collectionspace/qa/records`.