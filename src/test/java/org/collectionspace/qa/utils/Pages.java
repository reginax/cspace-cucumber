package org.collectionspace.qa.utils;

import java.util.HashMap;

public class Pages {
    private HashMap<String, String> pageUrls = new HashMap<>();
    private HashMap<String, String> pageLoadedSelector = new HashMap<>();

    public Pages() {
        pageUrls.put("Person", "person.html?vocab=person");
        pageUrls.put("ULAN Person", "person.html?vocab=ulan_person");
        pageUrls.put("Find and Edit", "findedit.html");

        pageUrls.put("Create New", "createnew.html");
        pageLoadedSelector.put("Create New", "csc-createNew-createButton");

        pageUrls.put("My CollectionSpace","myCollectionSpace.html");
        pageLoadedSelector.put("My CollectionSpace","csc-myCollectionSpace-categoryHeader");

    }


    public String getPageUrls(String pageName) {
        return pageUrls.get(pageName);
    }
    public String getPageLoadedSelector(String pageName) {return pageLoadedSelector.get(pageName);}
}
