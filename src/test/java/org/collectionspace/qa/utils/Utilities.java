package org.collectionspace.qa.utils;

import java.util.Date;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertTrue;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import org.collectionspace.qa.records.*;

import static org.openqa.selenium.support.ui.ExpectedConditions.*;

public class Utilities {

    public static void log(String str) {
        System.out.print(str);
    }

    /**
     * Builds the xpath to select the div of Record or Vocab type
     * on the Create New page. Useful for scoping searches for elements
     * contained in that div.
     *
     * @param type the type of record being tested.
     * @return a xpath string
     */
    public static String buildCreateNewRecordTypeXpath(String type){
        String xpath = "//span[@class='csc-createNew-recordLabel cs-createNew-recordLabel']";
        xpath = xpath.concat("[text()='" + type + "']/ancestor::div[1]");
        return xpath;
    }

    /**
     *
     * @param driver webdriver object to access the browser
     * @param term the search term expected in the results
     * @return is it true or not
     */
    public static Boolean isInSearchResults(WebDriver driver, String term) {
        Boolean result = Boolean.FALSE;
        String xpath = "//tr[@class='csc-row']/td/a[text()='" + term +"']";
        if (!driver.findElements(By.xpath(xpath)).isEmpty()) {
            result = Boolean.TRUE;
        } else {
            try {
                driver.findElement(By.className("flc-pager-next")).click();
                result = isInSearchResults(driver, term);
            } catch (Exception e) { log(e.getMessage());}
        }
        return result;
    }

    /**
     * Generate unique test data for a field of a given type
     */
    public static String generateTestFieldDataFor(String recordType) {
        long timestamp = (new Date().getTime());
        return "required-" + recordType + "-" + timestamp;
    }

    /**
     * Fill in ann fields for a given record type.
     * Creates a new Record of the recordType, where fields are defined.
     */
    public static void fillInAllFieldsFor(String recordType, WebDriver driver) {
        try {
            Record record = loadRecordOfType(recordType);
            fillInFields(driver, record.getFieldMap());
            updateSelectFields(driver, record.getSelectMap());
            fillInVocabFields(driver, record.getVocabMap());

        } catch (Exception e) { log(e.getMessage()); }
    }

    /**
     * Iterate over a Map to fill in field identified by field selector with value
     * @param fieldMap HashMap of fields for given Record type, providing
     *                 selectors and values.
     */
    public static void fillInFields(WebDriver driver, Map<String,String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            fillFieldLocatedById(field.getKey(), field.getValue(), driver);
        }
    }

    /**
     * Iterate over a Map to select an option from a '<select>' field by value
     * @param selectMap HashMap of '<select>' fields for given Record type, providing
     *                 selectors and values.
     */
    private static void updateSelectFields(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> field : selectMap.entrySet()) {
            updateSelectFieldLocatedById(field.getKey(), field.getValue(), driver);
        }
    }

    public static void fillInVocabFields(WebDriver driver, Map<String, String> vocabMap) {
        WebDriverWait wait = new WebDriverWait(driver, 10);
        for (Map.Entry<String, String> field : vocabMap.entrySet()) {
            fillVocabFieldLocatedByID(field.getKey(), field.getValue(), driver);

            WebElement autocomplete = wait.until(visibilityOfElementLocated(By.className("cs-autocomplete-popup")));
            String xpath = "//li[contains(@class, 'cs-autocomplete-matchItem')]/span[text()='" + field.getValue() + "']";
            List<WebElement> options = driver.findElements(By.xpath(xpath));
            if (!options.isEmpty()){
                options.get(0).click();
            } else {
                autocomplete.findElement(By.id("authorityItem:")).click();
            }
        }
    }

    /**
     * Fill any field whose id contains the id with a value
     * @param id id of the field to be filled
     * @param value the value with which to fill in the field
     */
    public static void fillFieldLocatedById(String id, String value, WebDriver driver) {
        String xpath = "(//input|//textarea)[contains(@id, '"  + id + "')]";

        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            field.sendKeys(value);
            new WebDriverWait(driver, 10)
                    .until(textToBePresentInElementValue(field, value));
        }
    }

    /**
     * Select an '<option>' in a all '<select>' containing @param selector in their id by its text
     * @param selector id of the field to be updated
     * @param visibleText the text of the option to select
     */
    private static void updateSelectFieldLocatedById(String selector, String visibleText, WebDriver driver) {
        String xpath = "(//select)[contains(@id, '"  + selector + "')]";
        for (WebElement element : driver.findElements(By.xpath(xpath))) {
            Select select = new Select(element);
            select.selectByVisibleText(visibleText);
            WebElement option = element.findElement(By.xpath("//option[text()='" + visibleText + "']"));
            new WebDriverWait(driver, 10)
                    .until(elementToBeSelected(option));
        }
    }

    public static void fillVocabFieldLocatedByID(String selector, String value, WebDriver driver) {
        WebDriverWait wait = new WebDriverWait(driver, 10);
        String xpath= "//li[input[contains(@id,'" + selector +"')]]/input[@class='cs-autocomplete-input']";

        wait.until(visibilityOfElementLocated(By.xpath(xpath)));

        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            field.sendKeys(value);
            wait.until(textToBePresentInElement(field, value));
        }
    }

    /**
     * Verify that fields for a given Record have been filled in.
     * @param recordType the type of Record to check
     */
    public static void verifyAllFieldsFilledIn(String recordType,WebDriver driver){
        try {
            Record record = loadRecordOfType(recordType);
            verifyFieldsAreFilledIn(driver, record.getFieldMap());
            verifySelectFieldsUpdated(driver, record.getSelectMap());

        } catch (Exception e) { log(e.getMessage()); }
    }

    private static void verifySelectFieldsUpdated(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> select : selectMap.entrySet() ) {
            verifySelectFieldOptionSelected(select.getKey(), select.getValue(), driver);
        }
    }

    private static void verifySelectFieldOptionSelected(String selector, String expectedValue, WebDriver driver) {
        String xpath = "//select[contains(@id, '"  + selector + "')]";
        List<WebElement> selects = driver.findElements(By.xpath(xpath));
        for (WebElement element : selects) {
            Select select = new Select(element);
            WebElement option = select.getFirstSelectedOption();
            log(option.getText());
            assertTrue(
                    select.getFirstSelectedOption().getText().contains(expectedValue)
            );
        }
    }

    /**
     * Iterate over a Map to verify each field from a record
     * @param fieldMap HashMap of fields for given Record type, providing
     *                 selectors and expected values.
     */
    public static void verifyFieldsAreFilledIn(WebDriver driver, Map<String, String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            verifyFieldLocatedByIDIsFilledIn(field.getKey(), field.getValue(), driver);
        }
    }

    /**
     * Verify that a all fields with id containing selector have been filled with the correct value
     * @param selector id of the field that should be filled in
     */
    public static void verifyFieldLocatedByIDIsFilledIn(String selector, String expectedValue, WebDriver driver) {
        String xpath = "(//input|//textarea)[contains(@id, '"  + selector + "')]";
        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            assertTrue(field.getAttribute("value").contains(expectedValue));
        }
    }

    /**
     * Given a string name of a Record type, instantiate a new Object of that type and return it.
     * @param recordType the type of Record object to be created
     * @return an object of the type requested by recordType
     * @throws Exception if the record type is not known
     */
    private static Record loadRecordOfType(String recordType) throws Exception{
        Record record;
        switch (recordType) {
            case "Person":
                record = new Person();
                break;
            default:
                throw new Exception(recordType + ": No classes of that Type known");
        }
        return record;
    }
}