package org.collectionspace.qa.records;

import java.util.HashMap;
import java.util.Map;

import static org.collectionspace.qa.utils.Utilities.*;
import org.openqa.selenium.WebDriver;

public abstract class Record {

    protected Map<String, String> requiredMap = new HashMap<>();
    protected Map<String, String> fieldMap    = new HashMap<>();
    protected Map<String, String> selectMap   = new HashMap<>();
    protected Map<String, String> vocabMap    = new HashMap<>();
    protected Map<String, String> dateMap     = new HashMap<>();
    protected Map<String, String> tickBoxMap  = new HashMap<>();

    public Map<String, String> getRequiredMap() {return requiredMap; }

    public Map<String, String> getFieldMap() {
        return fieldMap;
    }

    public Map<String, String> getSelectMap() {
        return selectMap;
    }

    public Map<String, String> getVocabMap() {
        return vocabMap;
    }

    public Map<String, String> getDateMap() {
        return dateMap;
    }

    public Map<String, String> getTickBoxMap() {
        return tickBoxMap;
    }



}
