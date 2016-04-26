package com.flash_editor.util;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateParser;
import org.apache.commons.lang3.time.DateUtils;

import java.text.ParseException;
import java.util.Date;

/**
 * Created by Administrator on 2016/2/28.
 */
public class DateUtil {
    private static String simpleDate = "yyyy-MM-dd";
    public static Date format(Date date) {
        if (date==null){
            return null;
        }
        try {
            return DateUtils.parseDate(DateFormatUtils.format(date,simpleDate),simpleDate);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String formatShort(Date date) {
        if (date==null){
            return null;
        }
        try {
            return DateFormatUtils.format(date,simpleDate);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
