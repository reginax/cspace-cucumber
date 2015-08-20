package org.collectionspace.qa.utils;

import java.util.Date;
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
            updateSelectFieldsToNonDefault(driver, record.getSelectMap());

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
    private static void updateSelectFieldsToNonDefault(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> field : selectMap.entrySet()) {
            updateSelectFieldLocatedById(field.getKey(), field.getValue(), driver);
        }
    }

    /**
     * Select an '<option>' in a '<select>' by its text
     * @param selector id of the field to be updated
     * @param visibleText the text of the option to select
     */
    private static void updateSelectFieldLocatedById(String selector, String visibleText, WebDriver driver) {
        WebElement element = driver.findElement(By.id(selector));
        Select select = new Select(element);
        select.selectByVisibleText(visibleText);
        WebElement option = element.findElement(By.xpath("//option[text()='" + visibleText + "']"));
        new WebDriverWait(driver, 10)
                .until(elementToBeSelected(option));
    }

    /**
     * Fill a field with a value
     * @param selector id of the field to be filled
     * @param value the value with which to fill in the field
     */
    public static void fillFieldLocatedById(String selector, String value, WebDriver driver) {
        WebElement field =  driver.findElement(By.id(selector));
        field.sendKeys(value);
        new WebDriverWait(driver, 10)
            .until(textToBePresentInElementValue(field, value));
    }

    /**
     * Verify that fields for a given Record have been filled in.
     * @param recordType the type of Record to check
     */
    public static void verifyAllFieldsFilledIn(String recordType,WebDriver driver){
        try {
            Record record = loadRecordOfType(recordType);
            verifyFieldsAreFilledIn(driver, record.getFieldMap());

        } catch (Exception e) { log(e.getMessage()); }
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
     * Verify that a single field has been filled with the correct value
     * @param selector id of the field that should be filled in
     */
    public static void verifyFieldLocatedByIDIsFilledIn(String selector, String expectedValue, WebDriver driver) {
        assertTrue(
                driver.findElement(By.id(selector)).getAttribute("value").contains(expectedValue));
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