package org.songjianxi.books.util;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.songjianxi.books.util.common.IDUtil;

public class FileUrlGenerator {

    public static Map<String, String> createUrl(String fileName) {
        Map<String, String> map = new HashMap<String, String>();
        Calendar date = Calendar.getInstance();
        int year = date.get(Calendar.YEAR);
        int month = (date.get(Calendar.MONTH) + 1);
        int day = date.get(Calendar.DAY_OF_MONTH);
        int hour = date.get(Calendar.HOUR_OF_DAY);
        int min = date.get(Calendar.MINUTE);
        String fileURL =
                (year) + Constants.SEPARATOR + (month < 10 ? ("0" + Integer.toString(month)) : month) + Constants.SEPARATOR
                        + (day < 10 ? ("0" + Integer.toString(day)) : day) + Constants.SEPARATOR
                        + (hour < 10 ? ("0" + Integer.toString(hour)) : hour) + Constants.SEPARATOR
                        + (min < 10 ? ("0" + Integer.toString(min)) : min);

        String smt = date.getTimeInMillis() + "";
        String fileNameSuffix = "_" + (smt).substring(smt.length() - 5);
        // String finalFileName = FileUrlGenerator.getFileName(fileName) + fileNameSuffix + FileUrlGenerator.getExtension(fileName);

        String finalFileName = IDUtil.generateCODE() + fileNameSuffix + FileUrlGenerator.getExtension(fileName);
        map.put("url", fileURL);
        map.put("finalFileName", finalFileName);
        return map;
    }

    public static String getFileName(String fileName) {
        int i = fileName.lastIndexOf(".");
        return fileName.substring(0, i);
    }

    public static String getExtension(String fileName) {
        int i = fileName.lastIndexOf(".");
        return fileName.substring(i);
    }
}
