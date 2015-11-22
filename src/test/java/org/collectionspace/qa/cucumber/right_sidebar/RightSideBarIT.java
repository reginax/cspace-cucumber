package org.collectionspace.qa.cucumber.right_sidebar;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "rightsidebar"},
		format = { "json:target/report.json" }
)
public class RightSideBarIT {
}
