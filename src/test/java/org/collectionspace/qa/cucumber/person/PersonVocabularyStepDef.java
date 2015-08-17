package org.collectionspace.qa.cucumber.person;




import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;



import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;


import java.util.HashMap;

import static org.collectionspace.qa.utils.Utilities.isInSearchResults;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.collectionspace.qa.utils.Utilities.buildCreateNewRecordTypeXpath;
import static org.openqa.selenium.support.ui.ExpectedConditions.*;


public class PersonVocabularyStepDef {

    WebDriver driver;
    private final WebDriverWait wait;

    public static String
            BASE_URL = "http://localhost:8180/collectionspace/ui/core/html/",
            LOGIN_PATH = "index.html",
            USERNAME = "admin@core.collectionspace.org",
            PASSWORD = "Administrator";

    private HashMap<String,String> fields =
            new HashMap<>();

    public PersonVocabularyStepDef(){
        this.driver = new FirefoxDriver();
        wait = new WebDriverWait(driver, 10);
        driver.get(BASE_URL + LOGIN_PATH);
        driver.findElement(By.className("csc-login-userId")).sendKeys(USERNAME);
        driver.findElement(By.className("csc-login-password")).sendKeys(PASSWORD);
        driver.findElement(By.className("csc-login-button")).click();

        fields.put("Display Name", "repeat::.csc-personAuthority-termDisplayName");
    }


    @Given("^user is on the Create New page$")
    public void user_is_on_create_new() throws Throwable {
        driver.get(BASE_URL + "createnew.html");
        wait.until(elementToBeClickable(By.className("csc-createNew-createButton")));
    }

    @Given("^user is on the My CollectionSpace page$")
    public void user_is_on_my_collectionspace() throws Throwable {
        driver.get(BASE_URL + "myCollectionSpace.html");
        wait.until(elementToBeClickable(By.className("csc-myCollectionSpace-categoryHeader")));
    }

    @And("^selects the \"([^\"]*)\" radio button on the Create New page$")
    public void user_selects_the_radio_button_in_the_vocabularies_section(String vocab) throws Throwable {
        WebElement radio = driver.findElement(By.xpath("//input[@value='" + vocab.toLowerCase() + "']"));
        radio.click();
    }

    @Then("^a drop down list should appear in the \"([^\"]*)\" row$")
    public void a_drop_down_list_should_appear_in_the_row(String recordType) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        assertTrue(!row.findElements(By.tagName("select")).isEmpty());

    }

    @Then("^the list in the \"([^\"]*)\" row should contain \"([^\"]*)\"$")
    public void the_list_should_contain(String recordType, String optionsString) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = driver.findElement(By.xpath(xpath));

        String[] options = optionsString.split(", ");
        for (String option : options){
            String optionXpath = "//select/option[contains(text(), '" + option +"')]";
           assertTrue(!row.findElements(By.xpath(optionXpath)).isEmpty());
        }
    }

    @Then("^the resulting page titlebar should contain \"([^\"]*)\"$")
    public void Message_displayed(String expectedText) throws Throwable {
        WebElement titlebar = wait.until(visibilityOfElementLocated(By.id("title-bar")));
        assertTrue(titlebar.getText().contains(expectedText));
    }

    @And("^clicks on the Create button$")
    public void clicks_on_the_Create_button() throws Throwable {
        driver.findElement(By.id("createButton")).click();
    }


    @Given("^user is on a blank Local Person record$")
    public void user_is_on_a_blank_Local_Person_page() throws Throwable {
        // Express the Regexp above with the code you wish you had
        driver.get(BASE_URL + "person.html?vocab=person");
    }

    @And("^user enters \"([^\"]*)\" in the \"([^\"]*)\" field$")
    public void user_enters_in_the_field(String value, String fieldName) throws Throwable {
        String selector = fields.get(fieldName);
        WebElement field = wait.until(visibilityOfElementLocated(By.id(selector)));
        field.sendKeys(value);
    }

    @And("^the user saves the record$")
    public void the_user_saves_the_record() throws Throwable {
        driver.findElement(By.id("save")).click();
        wait.until(textToBePresentInElementLocated(By.className("cs-messageBar-message"), "successfully saved"));
    }

    @Then("^\"([^\"]*)\" should be in the \"([^\"]*)\" field$")
    public void should_be_in_the_field(String value, String fieldName) throws Throwable {
        String selector = fields.get(fieldName);
        WebElement field = wait.until(visibilityOfElementLocated(By.id(selector)));
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
        wait.until(visibilityOfElementLocated(By.xpath("(//tr[@class='csc-row']/td/a)[1]")));
        String[] options = results.split("; ");
        for (String option : options){
            assertTrue(isInSearchResults(driver, option));
        }
    }
}

