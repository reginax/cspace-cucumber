package org.collectionspace.qa.records;


public class Person extends Record{

    public Person() {
        fieldMap.put("repeat::.csc-personAuthority-termDisplayName", "FiORE MIDDabLE abSURd");
        fieldMap.put("repeat::.csc-personAuthority-termName", "A term");
        fieldMap.put("repeat::.csc-personAuthority-termQualifier", "A qualifier");
        fieldMap.put("repeat::.csc-personAuthority-termSourceDetail","A source detail");
        fieldMap.put("repeat::.csc-personAuthority-termSourceID","A source ID");
        fieldMap.put("repeat::.csc-personAuthority-termSourceNote","A source Note");
        fieldMap.put("repeat::.csc-personAuthority-foreName", "Fiore");
        fieldMap.put("repeat::.csc-personAuthority-middleName", "Middable");
        fieldMap.put("repeat::.csc-personAuthority-surName", "abSurdName");
        fieldMap.put("repeat::.csc-personAuthority-nameAdditions", "Esquire");
        fieldMap.put("repeat::.csc-personAuthority-initials", "FaMouSE");
        fieldMap.put("repeat::.csc-personAuthority-occupation", "Factotum");
        fieldMap.put("repeat::.csc-personAuthority-schoolOrStyle", "Big Dada");
        fieldMap.put("repeat::.csc-personAuthority-group", "London Crew");
        fieldMap.put("repeat::.csc-personAuthority-nationality", "Slovakian");
        fieldMap.put(".csc-personAuthority-nameNote", "A note to reflect the name's nature");
        fieldMap.put(".csc-personAuthority-birthPlace", "USA USA");
        fieldMap.put(".csc-personAuthority-deathPlace", "Grenoble, France");
        fieldMap.put(".csc-personAuthority-bioNote", "Cooler than the sum of this data");
        fieldMap.put("repeat::.csc-contact-email","niceperson@example.club");
        fieldMap.put("repeat::.csc-contact-telephoneNumber", "800-588-2300");
        fieldMap.put("repeat::.csc-contact-faxNumber", "jus-tth-efax");
        fieldMap.put("repeat::.csc-contact-webAddress", "art.example.club");
        fieldMap.put("repeat::.csc-contact-addressPlace1", "1234 Street Road");
        fieldMap.put("repeat::.csc-contact-addressPlace2", "Downey House");
        fieldMap.put("repeat::.csc-contact-addressMunicipality", "Cleveland");
        fieldMap.put("repeat::.csc-contact-addressPostCode", "12345");
        fieldMap.put("repeat::.csc-contact-addressStateOrProvince", "Ohio");

        selectMap.put("termList", "Artist"); //Term Type
        selectMap.put("repeat::.csc-personAuthority-termStatus-selection", "Accepted");
        selectMap.put("termList-1","Arabic"); // Language select
        selectMap.put("repeat::.csc-personAuthority-salutation-selection", "To");
        selectMap.put("repeat::.csc-personAuthority-title-selection", "Baroness");
        selectMap.put(".csc-personAuthority-gender-selection", "Female");
        selectMap.put("repeat::.csc-contact-emailType-selection", "other");
        selectMap.put("repeat::.csc-contact-telephoneNumberType-selection", "other");
        selectMap.put("repeat::.csc-contact-faxNumberType-selection", "other");
        selectMap.put("repeat::.csc-contact-webAddressType-selection", "other");
        selectMap.put("repeat::.csc-contact-addressType-selection","other");
        selectMap.put("repeat::.csc-contact-addressCountry-selection","LIBYA");

        vocabMap.put("repeat::.csc-personAuthority-termSource", "A source");

        tickBoxMap.put("repeat::.csc-personAuthority-termPrefForLang", "");

    }



}
