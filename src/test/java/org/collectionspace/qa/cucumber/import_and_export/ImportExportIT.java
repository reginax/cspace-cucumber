package org.collectionspace.qa.cucumber.import_and_export;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "importandexport" },
		format = { "json:target/report.json" }
)
public class ImportExportIT {
}
