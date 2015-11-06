package org.collectionspace.qa.cucumber.primary;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        format = { "json:target/report.json" }
)
public class PrimaryTabIT {
}
