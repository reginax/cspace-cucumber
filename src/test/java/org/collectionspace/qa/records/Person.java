package org.collectionspace.qa.records;


public class Person extends Record{

    public Person() {

        requiredMap.put(".csc-personAuthority-termDisplayName", "SUCH NAME");

        fieldMap.put(".csc-personAuthority-termName", "A term");
        fieldMap.put(".csc-personAuthority-termQualifier", "A qualifier");
        fieldMap.put(".csc-personAuthority-termSourceDetail","A source detail");
        fieldMap.put(".csc-personAuthority-termSourceID","A source ID");
        fieldMap.put(".csc-personAuthority-termSourceNote","A source Note");
        fieldMap.put(".csc-personAuthority-foreName", "MUCH");
        fieldMap.put(".csc-personAuthority-middleName", "WOW");
        fieldMap.put(".csc-personAuthority-surName", "VERY");
        fieldMap.put(".csc-personAuthority-nameAdditions", "Esquire");
        fieldMap.put(".csc-personAuthority-initials", "FaMouSE");
        fieldMap.put(".csc-personAuthority-occupation", "Factotum");
        fieldMap.put(".csc-personAuthority-schoolOrStyle", "Big Dada");
        fieldMap.put(".csc-personAuthority-group", "London Crew");
        fieldMap.put(".csc-personAuthority-nationality", "Slovakian");
        fieldMap.put(".csc-personAuthority-nameNote", "A note to reflect\n the name's nature");
        fieldMap.put(".csc-personAuthority-birthPlace", "USA USA");
        fieldMap.put(".csc-personAuthority-deathPlace", "Grenoble, France");
        fieldMap.put(".csc-personAuthority-bioNote", "Cooler than the sum\n of this data");
        fieldMap.put(".csc-contact-email","niceperson@example.club");
        fieldMap.put(".csc-contact-telephoneNumber", "800-588-2300");
        fieldMap.put(".csc-contact-faxNumber", "jus-tth-efax");
        fieldMap.put(".csc-contact-webAddress", "art.example.club");
        fieldMap.put(".csc-contact-addressPlace1", "1234 Street Road");
        fieldMap.put(".csc-contact-addressPlace2", "Downey House");
        fieldMap.put(".csc-contact-addressMunicipality", "Cleveland");
        fieldMap.put(".csc-contact-addressPostCode", "12345");
        fieldMap.put(".csc-contact-addressStateOrProvince", "Ohio");

        selectMap.put(" csc-personAuthority-termType ","Artist");
        selectMap.put(".csc-personAuthority-termStatus", "Accepted");
        selectMap.put("csc-personAuthority-termLanguage ","Arabic");
        selectMap.put(".csc-personAuthority-salutation", "To");
        selectMap.put(".csc-personAuthority-title", "Baroness");
        selectMap.put(".csc-personAuthority-gender", "Female");
        selectMap.put("csc-contact-emailType", "other");
        selectMap.put("csc-contact-telephoneNumberType", "other");
        selectMap.put("csc-contact-faxNumberType", "other");
        selectMap.put("csc-contact-webAddressType", "other");
        selectMap.put("csc-contact-addressType","other");
        selectMap.put("csc-contact-addressCountry","LIBYA");

        vocabMap.put("repeat::.csc-personAuthority-termSource", "A source");

        tickBoxMap.put("repeat::.csc-personAuthority-termPrefForLang", "");


        fieldSelectorByLabel.put("Display Name", ".csc-personAuthority-termDisplayName");
        fieldSelectorByLabel.put("Forename", ".csc-personAuthority-foreName");
        // Selector for the Person Vocab field in the cataloging record
        fieldSelectorByLabel.put("Cataloging->Content->Person", ".csc-object-description-content-person");
    }



}
