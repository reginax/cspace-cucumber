package org.collectionspace.qa.records;

/**
 * Created by cbn on 9/15/15.
 */
public class Cataloging extends Record {

    public Cataloging(){
        requiredMap.put(".csc-object-identification-object-number",generateRequiredData());
    }
}
