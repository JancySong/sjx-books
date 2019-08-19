package org.songjianxi.books.util.common;

import java.util.List;


/**
 * 空 校验
 * 
 * @author Jancy(宋建熙)
 * 
 */
public class EmptyUtil {

    public static boolean isNotEmpty(String param) {
        if (null != param && !"".equals(param.trim())) {
            return true;
        }
        return false;
    }

    public static boolean isEmpty(String param) {
        return !EmptyUtil.isNotEmpty(param);
    }

    // public static boolean isNotEmpty(Timestamp param) {
    // if (null != param) {
    // return true;
    // }
    // return false;
    // }
    //
    // public static boolean isEmpty(Timestamp param) {
    // return !EmptyUtil.isNotEmpty(param);
    // }
    //
    // public static boolean isNotEmpty(Serializable param) {
    // if (null != param) {
    // return true;
    // }
    // return false;
    // }
    //
    // public static boolean isEmpty(Serializable param) {
    // return !EmptyUtil.isNotEmpty(param);
    // }
    //
    @SuppressWarnings("rawtypes")
    public static boolean isNotEmpty(List list) {
        if (null != list && list.size() > 0) {
            return true;
        }
        return false;
    }

    @SuppressWarnings("rawtypes")
    public static boolean isEmpty(List list) {
        return !EmptyUtil.isNotEmpty(list);
    }

}
