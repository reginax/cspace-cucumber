package org.collectionspace.qa.cucumber.vocabulary_terms;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "vocabterms"},
		format = { "json:target/report.json" }
)
public class VocabularyTermsIT {
}
