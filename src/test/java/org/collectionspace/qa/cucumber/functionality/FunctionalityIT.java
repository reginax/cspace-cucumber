package org.collectionspace.qa.cucumber.functionality;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        features = { "org.collectionspace.qa.cucumber.functionality" },
        format = { "json:target/report.json" }
)
public class FunctionalityIT {
}
