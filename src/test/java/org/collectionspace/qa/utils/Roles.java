package org.collectionspace.qa.utils;

import java.util.HashMap;
import java.util.List;

public class Roles {

    private static String[] allRecords = new String[] {
                    "loanin", "loanout", "acquisition", "cataloging", "movement", "exhibition",
                    "objectexit", "intake", "conditioncheck", "valuationcontrol", "media" };

    private static String[] allVocabs = new String[]
            {"concept", "person", "location", "organization", "place", "work",  "citation"};

    private static List<String> exceptRecords;
    private static List<String> exceptVocabs;

    public static String recordA = "loanin";
    public static String recordB = "loanout";
    public static String recordC = "acquisition";
    public static String recordD = "intake";
    public static String vocabA  = "person";
    public static String vocabB  = "place";

    public static HashMap<String, String> role1;
    public static HashMap<String, String> role2;
    public static HashMap<String, String> role3;
    public static HashMap<String, String> role4; 
    public static HashMap<String, String> role5;
    public static HashMap<String, String> role6;
    public static HashMap<String, String> role7;
    public static HashMap<String, String> role8;

    static {

        role1 = new HashMap<>();
        role1.put(recordA, "none");
        role1.put(recordB, "read");
        role1.put(recordC, "write");
        role1.put(recordD, "write");
        role1.put(vocabA, "none");
        role1.put(vocabB, "none");
        role1.put("users", "none");
        role1.put("role", "none");
        role1.put("termlist", "read");

        role2 = new HashMap<>();
        role2.put(vocabA, "write");
        role2.put(vocabB, "write");
        exceptRecords.clear(); //We want all records to have perm "none"
        addAllRecordsWithPermToRoleExcept("none", role2, exceptRecords);
        role2.put("users", "none");
        role2.put("role", "none");


        role3 = new HashMap<>();
        exceptRecords.clear(); //We want all records to have perm "none"
        addAllRecordsWithPermToRoleExcept("none", role2, exceptRecords);
        role3.put("users", "write");
        role3.put("role", "write");
        role3.put("termlist", "write");

        role4 = new HashMap<>();
        role4.put(vocabA, "none");
        role4.put(vocabB, "write");
        role4.put(recordA, "write");

        exceptRecords.add(recordA);

        role5 = new HashMap<>();
        role6 = new HashMap<>();
        role7 = new HashMap<>();
        role8 = new HashMap<>();

    }


    public Roles(){

    }

    private Object getPermsForAttribute(String role) throws Exception{
        return Roles.class.getField(role).get(new Roles());

    }

    public HashMap<String,String> getPermsFor(String role) throws Exception{
        return (HashMap) getPermsForAttribute(role);
    }

    private static void addAllRecordsWithPermToRoleExcept(String perm, HashMap role, List<String> exceptRecords){
        for (String record: allRecords ){
            if (exceptRecords.contains(record))
            role.put(record, perm);
        }
    }
}
