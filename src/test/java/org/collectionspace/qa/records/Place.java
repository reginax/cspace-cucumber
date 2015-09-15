package org.collectionspace.qa.records;

public class Place extends Record {

    public Place(){

        requiredMap.put("csc-placeAuthority-termDisplayName","No place like Home");


        fieldSelectorByLabel.put("Display Name", "csc-placeAuthority-termDisplayName");
    }
}
