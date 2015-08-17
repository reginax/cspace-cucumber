package org.collectionspace.qa.cucumber.person;


import org.junit.runner.RunWith;
import cucumber.api.junit.Cucumber;
import cucumber.api.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(format = { "json:target/report.json" })
public class PersonVocabularyIT {

}
