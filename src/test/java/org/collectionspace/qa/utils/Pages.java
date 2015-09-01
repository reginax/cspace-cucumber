package org.collectionspace.qa.utils;

import java.util.HashMap;

public class Pages {
    private HashMap<String, String> pageUrls = new HashMap<>();

    void Pages() {
        pageUrls.put("Person", "person.html?vocab=person");
        pageUrls.put("ULAN Person", "person.html?vocab=ulan_person");
    }

    public String getPageUrls(String pageName) {
        return pageUrls.get(pageName);
    }
}
