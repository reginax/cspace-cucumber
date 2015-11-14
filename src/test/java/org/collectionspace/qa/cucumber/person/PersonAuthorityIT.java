package org.collectionspace.qa.cucumber.person;


import org.junit.runner.RunWith;
import cucumber.api.junit.Cucumber;
import cucumber.api.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        format = { "json:target/report.json" },
        tags = { "person" }
)
public class PersonAuthorityIT {

}
