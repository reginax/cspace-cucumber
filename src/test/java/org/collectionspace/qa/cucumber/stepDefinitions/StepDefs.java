package org.collectionspace.qa.cucumber.stepDefinitions;


import java.util.*;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import org.collectionspace.qa.utils.Pages;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.openqa.selenium.support.ui.ExpectedConditions.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.collectionspace.qa.records.*;
import static org.collectionspace.qa.utils.Utilities.*;


public class StepDefs {

    private final WebDriver driver;
    private final WebDriverWait wait;
    private Record record;
    private Pages pages = new Pages();

    public static String
            BASE_URL = "http://qa.collectionspace.org:8180/collectionspace/ui/core/html/";


    public StepDefs() {
        driver = new FirefoxDriver();
        wait = new WebDriverWait(driver, 10);
        login(driver, BASE_URL);
    }


    @Given("^user is on the \"([^\"]*)\" page$")
    public void user_is_on_page(String pageName) throws Throwable {
        driver.get(BASE_URL + pages.getPageUrls(pageName));
        wait.until(elementToBeClickable(
                By.className(pages.getPageLoadedSelector(pageName))));
    }

    @And("^selects the \"([^\"]*)\" radio button on the Create New page$")
    public void user_selects_the_radio_button_in_the_vocabularies_section(String vocab) throws Throwable {
        WebElement radio = driver.findElement(
                By.xpath("//input[@value='" + vocab.toLowerCase() + "']"));
        radio.click();
    }

    @Then("^a drop down list should appear in the \"([^\"]*)\" row$")
    public void a_drop_down_list_should_appear_in_the_create_new_row(String recordType) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        assertFalse(row.findElements(By.tagName("select")).isEmpty());
    }

    @Then("^the list in the \"([^\"]*)\" row should contain \"([^\"]*)\"$")
    public void the_list_on_create_new_page_should_contain(String recordType, String optionsString) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = driver.findElement(By.xpath(xpath));

        String[] options = optionsString.split(", ");
        for (String option : options){
            String optionXpath = "//select/option[contains(text(), '" + option +"')]";
           assertFalse(row.findElements(By.xpath(optionXpath)).isEmpty());
        }
    }

    @Then("^the titlebar should contain \"([^\"]*)\"$")
    public void the_titlebar_should_contain(String expectedText) throws Throwable {
        assertTrue(wait.until(textToBePresentInElementLocated(By.id("title-bar"), expectedText)));
    }

    @And("^clicks on the Create button$")
    public void clicks_on_the_Create_button() throws Throwable {
        driver.findElement(By.id("createButton")).click();
    }


    @Given("^user is on a blank \"([^\"]*)\" record$")
    public void user_is_on_a_blank_record_type_page(String pageName) throws Throwable {
        driver.get(BASE_URL + pages.getPageUrls(pageName));
        wait.until(visibilityOfElementLocated(By.className("saveButton")));
    }

    @And("^user enters \"([^\"]*)\" in the \"([^\"]*)\" \"([^\"]*)\" field$")
    public void user_enters_in_the_field(String value, String recordType , String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        fillFieldLocatedById(selector, value, driver);
    }

    @And("^user enters \"([^\"]*)\" in the \"([^\"]*)\" \"([^\"]*)\" vocab field$")
    public void user_enters_in_the_vocab_field(String value, String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        fillVocabFieldLocatedByID(selector, value, driver);
    }
    
    @And("^the user saves the record$")
    public void the_user_saves_the_record() throws Throwable {
        driver.findElement(By.id("save")).click();
    }

    @Then("^the record is successfully saved")
    public void the_record_is_successfully_saved() throws Throwable {
        wait.until(textToBePresentInElementLocated(
                By.className("cs-messageBar-message"), "successfully saved"));
    }

    @Then("^\"([^\"]*)\" should be in the \"([^\"]*)\" \"([^\"]*)\" field$")
    public void should_be_in_the_field(String value, String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        verifyFieldLocatedByIDIsFilledIn(selector, value, driver);
    }

    @Then("^\"([^\"]*)\" should be in the \"([^\"]*)\" \"([^\"]*)\" vocab field$")
    public void should_be_in_the_vocab_field(String value, String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        String xpath = "//*[input[contains(@name,'" + selector +"')]]/input[@class='cs-autocomplete-input']";
        WebElement field = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        assertEquals(field.getAttribute("value"), value);
    }

    @And("^user selects \"([^\"]*)\" from dropdown in \"([^\"]*)\" row$")
    public void user_selects_Person_from_dropdown_in_row(String templateType, String recordType) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        Select select = new Select(row.findElement(By.tagName("select")));
        select.selectByVisibleText(templateType);
    }

    @Then(("^close the browser$"))
    public void close_the_browser() {
        driver.close();
    }

    @And("^user enters \"([^\"]*)\" in the top nav search field$")
    public void user_enters_in_the_top_nav_search_field(String searchTerm) throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/input[@type='text']";
        driver.findElement(By.xpath(xpath)).sendKeys(searchTerm);
    }

    @And("^selects \"([^\"]*)\" from the top nav search record type select field$")
    public void selects_from_the_top_nav_record_type_select_field(String searchType) throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/select[@name='recordTypeSelect-selection']";
        Select select = new Select(driver.findElement(By.xpath(xpath)));
        select.selectByVisibleText(searchType);
    }

    @And("^selects \"([^\"]*)\" from the top nav search vocabulary select field$")
    public void selects_from_the_top_nav_vocab_type_select_field(String searchType) throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/select[@name='selectVocab-selection']";
        WebElement vocab = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        Select vocabSelect = new Select(vocab);
        vocabSelect.selectByVisibleText(searchType);
    }

    @And("^clicks on the top nav search submit button$")
    public void clicks_on_the_top_nav_search_submit_button() throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/input[@type='button']";
        driver.findElement(By.xpath(xpath)).click();
    }

    @Then("^the search results should contain \"([^\"]*)\"$")
    public void the_search_results_should_contain_results(String results) throws Throwable {
        wait.until(visibilityOfElementLocated(
                By.xpath("(//tr[@class='csc-row']/td/a)[1]")));
        String[] options = results.split("; ");
        for (String option : options){
            assertTrue(isInSearchResults(driver, option));
        }
    }

    @Then("^the search results should not contain \"([^\"]*)\"$")
    public void the_search_results_should_not_contain_results(String results) throws Throwable {
        try {
            wait.until(visibilityOfElementLocated(
                    By.xpath("(//tr[@class='csc-row']/td/a)[1]")));
        } catch(Exception e) {
            return;
        }

        String[] options = results.split("; ");
        for (String option : options){
            assertFalse(isInSearchResults(driver, option));
        }
    }

    @And("^the user clicks on result with text \"([^\"]*)\"$")
    public void the_user_clicks_on(String term) throws Throwable {
        String xpath = "(//tr[@class='csc-row']/td/a[text()='" + term +"'])[1]";
        driver.findElement(By.xpath(xpath)).click();
    }

    @Then("^the vocabulary autocomplete should contain \"([^\"]*)\"$")
    public void the_vocabulary_autocomplete_should_contain(String expected) throws Throwable {
        WebElement autocomplete = wait.until(visibilityOfElementLocated(By.className("cs-autocomplete-popup")));
        String[] options = expected.split("; ");
        for (String option : options){
            String xpath = "//li[@class='cs-autocomplete-matchItem csc-autocomplete-matchItem']/span[text()='" + option + "']";
            assertFalse(autocomplete.findElements(By.xpath(xpath)).isEmpty());
        }
    }

    @When("^user clicks the \"([^\"]*)\" button on the \"([^\"]*)\" area to the right$")
    public void user_clicks_on_button_on_right(String button, String category) throws Throwable {
        String xpath = "//div[@class='csc-right-sidebar']//td/a[contains(text(), '" + button +"')]";
        if (category == "procedures")
            xpath = "//div[@class='csc-right-sidebar']//td/a[contains(text(), '" + button + "-2')]";
        driver.findElement(By.xpath(xpath)).click();
    } 

    @And("^user fills in required fields for \"([^\"]*)\" record$")
    public void user_fills_in_required_fields_for_record(String recordType) throws Throwable {
        fillRequiredFieldsFor(recordType, driver);
    }

    @And("^user clicks on \"([^\"]*)\" from autocomplete options$")
    public void user_clicks_on_from_autocomplete_options(String option) throws Throwable {
        String xpath = "//li[@class='cs-autocomplete-matchItem csc-autocomplete-matchItem']/span[text()='" + option + "']";
        driver.findElement(By.xpath(xpath)).click();
    }

    @Then("^\"([^\"]*)\" should appear in the Terms Used sidebar$")
    public void should_appear_in_the_Terms_Used_sidebar(String term) throws Throwable {
        WebElement termsUsed = driver.findElement(By.className("csc-related-vocabularies"));
        // Check that at least one row is present in the Terms used section
        wait.until(visibilityOf(termsUsed.findElement(
                By.className("csc-listView-row"))));

        assertFalse(termsUsed.findElements(By.linkText(term)).isEmpty());

    }

    @And("^user clicks on \"([^\"]*)\" in Terms Used sidebar$")
    public void user_clicks_on_in_Terms_Used_sidebar(String term) throws Throwable {
       String xpath = "//div[@class='csc-related-record csc-related-vocabularies']//td/a[contains(text(), '" + term +"')]";
       driver.findElement(By.xpath(xpath)).click();
        wait.until(textToBePresentInElementLocated(
                By.className("csc-titleBar-value"), term));
    }

    @Then("^the error message bar should appear with \"([^\"]*)\"$")
    public void the_error_message_bar_should_appear_with(String errorMessage) throws Throwable {
        wait.until(visibilityOfElementLocated(By.className("cs-message-error")));
        assertTrue(driver.findElement(By.className("csc-messageBar-message"))
                .getText().equals(errorMessage));
    }

    @And("^user clicks OK to cancel error message$")
    public void user_clicks_OK_to_cancel_error_message() throws Throwable {
        driver.findElement(By.className("csc-messageBar-cancel")).click();
    }

    @And("^user removes focus from \"([^\"]*)\" \"([^\"]*)\" field$")
    public void user_removes_focus_from_field(String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        String xpath = "//input[contains(@id, '" + selector + "')]";
        driver.findElement(By.xpath(xpath)).sendKeys("\t");
    }

    @And("^user clicks the plus to repeat the \"([^\"]*)\" form$")
    public void user_adds_additional_Person_Term_Group_record(String repeatedElement) throws Throwable {
        String xpath =
                "//input[@name='primary-fields.personTermGroup']/ancestor::div[1]/input[@type='button']";
        driver.findElement(By.xpath(xpath)).click();

    }

    @Then("^an additional \"([^\"]*)\" record should be present$")
    public void an_additional_record_should_be_present(String repeatedElement) throws Throwable {
        List<WebElement> group = driver.findElements(By.name("primary-fields.personTermGroup"));
        assertTrue(group.size() > 1);
    }

    @And("^user adds \"([^\"]*)\" in the \"([^\"]*)\" field of the second \"([^\"]*)\" form$")
    public void user_adds_in_the_field_of_the_second_repeated_form(String term, String field,  String repeatedElement) throws Throwable {
        String xpath =
                "(//input[@name='primary-fields.personTermGroup'])[2]/ancestor::li//input[@class='csc-personAuthority-termDisplayName']";
        driver.findElement(By.xpath(xpath)).sendKeys(term);
    }

    @And("^user selects the additional \"([^\"]*)\" as primary$")
    public void user_selects_the_additional_as_primary(String repeatedElement) throws Throwable {
        String xpath =
                "(//input[@name='primary-fields.personTermGroup'])[2]/ancestor::li/input[contains(@class,'cs-repeatable-primary')]";
        driver.findElement(By.xpath(xpath)).click();
    }

    @And("^user fills in all the fields of the \"([^\"]*)\" record$")
    public void user_fills_in_all_fields(String recordType) throws Throwable {
        fillInAllFieldsFor(recordType, driver);
    }

    @Then("^all fields in \"([^\"]*)\" record should be filled in$")
    public void all_fields_in_record_should_be_filled_in(String recordType) throws Throwable {
        // Express the Regexp above with the code you wish you had
        verifyAllFieldsFilledIn(recordType, driver);
    }

    @And("^user repeats all repeatable fields$")
    public void user_repeats_all_repeatable_fields() throws Throwable {
        String xpath = "//input[@type='button'][@value='+']";
        for (WebElement plus : driver.findElements(By.xpath(xpath))) {
            plus.click();
        }
    }

    @And("^user clears all fields of the \"([^\"]*)\" record$")
    public void user_clears_all_fields_of_the_record(String recordType) throws Throwable {
        clearAllFieldsFor(recordType, driver);
    }

    @Then("^all fields of the \"([^\"]*)\" record should be empty$")
    public void all_fields_should_be_empty(String recordType) throws Throwable {
        verifyAllFieldsCleared(recordType, driver);
    }

    @Then("^the \"([^\"]*)\" button should not be clickable$") 
    public void the_button_should_not_be_clickable(String button) throws Throwable {
        WebElement element = driver.findElement(By.className(button + "Button"));
        wait.until(not(elementToBeClickable(element)));
    }

    @Then("^disables top and bottom \"([^\"]*)\" buttons$") 
    public void top_bottom_buttons_should_not_be_clickable(String button) throws Throwable {
        String xpath = "//input[@type='button'][@id='" + button + "']";
        WebElement element = driver.findElement(By.xpath(xpath));
        wait.until(not(elementToBeClickable(element)));
        element = driver.findElement(By.xpath("//input[@type='button'][@id='" + button + "-1']"));
        wait.until(not(elementToBeClickable(element)));
    }

    @Then("^enables top and bottom \"([^\"]*)\" buttons$") 
    public void top_bottom_buttons_should_be_clickable(String button) throws Throwable {
        String xpath = "//input[@type='button'][@id='" + button + "']";
        WebElement element = driver.findElement(By.xpath(xpath));
        wait.until(elementToBeClickable(element));
        element = driver.findElement(By.xpath("//input[@type='button'][@id='" + button + "-1']"));
        wait.until(elementToBeClickable(element));
    }

    @And("^user clicks on the delete button$")
    public void user_clicks_on_the_delete_button() throws Throwable {
        driver.findElement(By.className("deleteButton")).click();
    }

    @Then("^delete confirmation dialogue should appear$")
    public void delete_confirmation_dialogue_should_appear() throws Throwable {
        wait.until(visibilityOfElementLocated(By.className("csc-confirmationDialog")));
    }

    @And("^user clicks cancel button$")
    public void user_clicks_cancel_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialogButton-cancel")).click();
    }

    @And("^user clicks close button$")
    public void user_clicks_close_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialog-closeBtn")).click();
    }

    @And("^user clicks the confirmation delete button$")
    public void user_clicks_the_confirmation_delete_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialogButton-act")).click();
    }

    @Then("^deletion should be confirmed in a dialogue$")
    public void deletion_should_be_confirmed_in_a_dialogue() throws Throwable {
        WebElement element = wait.until(presenceOfElementLocated(By.className("csc-confirmationDialog-text")));
        assertTrue(element.getText().equals("Person successfully deleted"));
    }

    @And("^user clicks delete confirmation OK button$")
    public void user_clicks_delete_confirmation_OK_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialogButton-act")).click();
        wait.until(textToBePresentInElementLocated(By.className("header-name"), "Find and Edit"));
    }

    @Then("^the message \"([^\"]*)\" should be displayed$")
    public void message_should_be_displayed(String message) throws Throwable {
        WebElement element = wait.until(presenceOfElementLocated(By.className("content")));
        assertTrue(element.getText().equals(message));
    }

    @And("^user clicks Select number pattern$")
    public void user_clicks_given_button() throws Throwable {
        driver.findElement(By.className("csc-numberPatternChooser-button")).click();
    }

    @And("^user selects the \"([^\"]*)\" tab$")
    public void user_selects_tab(String tab) throws Throwable {
        String xpath = "//li[@class='csc-tabs-tab-link cs-tabs-tab-link']/span[text()='" + tab + "']";
        driver.findElement(By.xpath(xpath)).click();
    } 

    @Then("^\"([^\"]*)\" should be displayed in the message bar$")
    public void content_should_be_displayed_in_message_bar(String message) throws Throwable {
        WebElement element = wait.until(presenceOfElementLocated(By.className("csc-messageBar cs-messageBar")));
        assertTrue(element.getText().equals(message));
    }

}
