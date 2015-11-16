package org.collectionspace.qa.cucumber.supplementary_to_primary;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "supplementaryprimary" },
        format = { "json:target/report.json" }
)
public class SupplementaryPrimaryIT {
}
