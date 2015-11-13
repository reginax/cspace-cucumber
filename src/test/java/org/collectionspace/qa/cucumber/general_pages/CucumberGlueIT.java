package org.collectionspace.qa.cucumber.general_pages;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
      glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
      format = { "json:target/report.json" }
)
public class CucumberGlueIT {

}
