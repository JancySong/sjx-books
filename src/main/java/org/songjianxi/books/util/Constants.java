package org.songjianxi.books.util;

public class Constants {

    public static final Integer LEVEL_ONE = 1;
    public static final Integer LEVEL_TWO = 2;

    // 订单状态
    // 未确认
    public static final Integer ORDER_UNCONFIRMED = 1;
    // 已确认
    public static final Integer ORDER_CONFIRMED = 2;
    // 已配货
    public static final Integer ORDER_DISTRIBUTOIN = 4;
    // 已发货
    public static final Integer ORDER_SHIPPED = 8;
    // 已收货
    public static final Integer ORDER_RECEIVE = 16;
    // 已完成
    public static final Integer ORDER_END = 32;
    // 分割符号 "/"
    public static final String SEPARATOR = "/";
    // 用户在线
    public static final Integer USER_ONLINE = 1;
    // 用户离线
    public static final Integer USER_OUTLINE = 0;
}
