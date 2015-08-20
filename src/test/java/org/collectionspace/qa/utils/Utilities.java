package org.collectionspace.qa.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static org.junit.Assert.assertTrue;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
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
            } catch (Exception e) {}
        }
        return result;
    }

    public static String generateTestFieldDataFor(String recordType) {
        long timestamp = (new Date().getTime());
        String data = "required-" + recordType + "-" + timestamp;
        return data;
    }


    public static void fillInAllFieldsFor(String recordType, WebDriver driver) {
        try {
            Record record = loadRecordOfType(recordType);
            fillInFields(driver, record.getFieldMap());
            updateSelectFieldsToNonDefault(driver, record.getSelectMap());

        } catch (Exception e) { log(e.getMessage()); }
    }

    public static void fillInFields(WebDriver driver, Map<String,String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            fillFieldLocatedByIdWith(field.getKey(), field.getValue(), driver);
        }
    }

    private static void updateSelectFieldsToNonDefault(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> field : selectMap.entrySet()) {
            updateSelectFieldLocatedByIdToNonDefault(field.getKey(), field.getValue(), driver);
        }
    }

    private static void updateSelectFieldLocatedByIdToNonDefault(String selector, String value, WebDriver driver) {
        WebElement element = driver.findElement(By.id(selector));
        Select select = new Select(element);
        select.selectByVisibleText(value);
        WebElement option = element.findElement(By.xpath("//option[text()='" + value + "']"));
        new WebDriverWait(driver, 10)
                .until(elementToBeSelected(option));

    }


    public static void fillFieldLocatedByIdWith(String selector, String value, WebDriver driver) {
        WebElement field =  driver.findElement(By.id(selector));
        field.sendKeys(value);
        new WebDriverWait(driver, 10)
            .until(textToBePresentInElementValue(field, value));
    }


    public static void verifyAllFieldsFilledIn(String recordType,WebDriver driver){
        try {
            Record record = loadRecordOfType(recordType);
            verifyFieldsAreFilledIn(driver, record.getFieldMap());

        } catch (Exception e) { log(e.getMessage()); }
    }


    public static void verifyFieldLocatedByIDIsFilledIn(String selector, String value, WebDriver driver) {
        assertTrue(
                driver.findElement(By.id(selector)).getAttribute("value").contains(value));
    }




    public static void verifyFieldsAreFilledIn(WebDriver driver, Map<String, String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            verifyFieldLocatedByIDIsFilledIn(field.getKey(), field.getValue(), driver);
        }
    }
    private static Record loadRecordOfType(String recordType) throws Exception{
        Record record;
        switch (recordType) {
            case "Person":
                record = new Person();
                break;
            default:
                throw new Exception();
        }
        return record;
    }
}