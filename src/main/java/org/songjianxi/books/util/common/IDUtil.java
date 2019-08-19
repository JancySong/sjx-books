package org.songjianxi.books.util.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class IDUtil {

    public static String generateID() {
        return UUID.randomUUID().toString().replace("-", "").toUpperCase() + "-SJXID";
    }

    public static String generateCODE() {
        return UUID.randomUUID().toString().replace("-", "").toUpperCase() + "-CODE";
    }

    public static String generateOrderNo() {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");

        String dateString = format.format(date);
        String random = (Math.random() + "");
        return "SONO" + dateString + "R" + random.substring(2, 7);
    }
}
