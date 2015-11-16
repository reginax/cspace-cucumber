package org.collectionspace.qa.cucumber.advanced_search_vocabulary;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "advancedsearchvocab" },
        format = { "json:target/report.json" }
)
public class AdvancedSearchVocabularyIT {
}
