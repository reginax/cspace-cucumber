package org.collectionspace.qa.cucumber.life_sci_tenant;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "lstenant" },
        format = { "json:target/report.json" }
		)
public class LifeSciTenantIT {
}
