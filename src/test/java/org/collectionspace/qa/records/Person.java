package org.collectionspace.qa.records;


public class Person extends Record{

    public Person() {
        fieldMap.put(".csc-personAuthority-termDisplayName", "FiORE MIDDabLE abSURd");
        fieldMap.put(".csc-personAuthority-termName", "A term");
        fieldMap.put(".csc-personAuthority-termQualifier", "A qualifier");
        fieldMap.put(".csc-personAuthority-termSourceDetail","A source detail");
        fieldMap.put(".csc-personAuthority-termSourceID","A source ID");
        fieldMap.put(".csc-personAuthority-termSourceNote","A source Note");
        fieldMap.put(".csc-personAuthority-foreName", "Fiore");
        fieldMap.put(".csc-personAuthority-middleName", "Middable");
        fieldMap.put(".csc-personAuthority-surName", "abSurdName");
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

        selectMap.put("termList", "Artist"); //Term Type
        selectMap.put(".csc-personAuthority-termStatus-selection", "Accepted");
        selectMap.put("termList-1","Arabic"); // Language select
        selectMap.put(".csc-personAuthority-salutation-selection", "To");
        selectMap.put(".csc-personAuthority-title-selection", "Baroness");
        selectMap.put(".csc-personAuthority-gender-selection", "Female");
        selectMap.put(".csc-contact-emailType-selection", "other");
        selectMap.put(".csc-contact-telephoneNumberType-selection", "other");
        selectMap.put(".csc-contact-faxNumberType-selection", "other");
        selectMap.put(".csc-contact-webAddressType-selection", "other");
        selectMap.put(".csc-contact-addressType-selection","other");
        selectMap.put(".csc-contact-addressCountry-selection","LIBYA");

        vocabMap.put("repeat::.csc-personAuthority-termSource", "A source");

        tickBoxMap.put("repeat::.csc-personAuthority-termPrefForLang", "");

    }



}
