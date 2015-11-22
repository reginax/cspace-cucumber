package org.collectionspace.qa.cucumber.records_secondary_tab;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "recordssecondarytab" },		
        format = { "json:target/report.json" }
)
public class RecordsSecondaryIT {
}
