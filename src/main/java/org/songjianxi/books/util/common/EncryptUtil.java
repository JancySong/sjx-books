package org.songjianxi.books.util.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

/**
 * 定义一个加密的实体类 该实体类中包含了 MD5和SHA两种加密的方式 这两种方法是静态final的方法
 * 
 * @author 宋建熙
 * 
 */
public class EncryptUtil {
    /**
     * 这是用于加密的"盐"
     * 
     */
    private final static String Salt = "AfogKDF*&SJX$%@!";

    /**
     * 这是MD5的信息摘要加密方式
     * 
     * @param word 是需要加密的字符串
     * @return 返回加密后的字符串
     */
    public final static String MD5(String word) {
        word = word + Salt;
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        try {
            byte[] btInput = word.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str) + "-JANCY";
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 这是SHA的信息摘要加密方式
     * 
     * @param word是需要加密的字符串
     * @return 返回加密后的字符串
     */
    public final static String SHA(String word) {
        word = word + Salt;
        MessageDigest sha = null;
        try {
            sha = MessageDigest.getInstance("SHA");
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }

        StringBuffer hexValue = new StringBuffer();
        byte[] byteArray;
        try {
            byteArray = word.getBytes("UTF-8");
            byte[] md5Bytes = sha.digest(byteArray);
            for (int i = 0; i < md5Bytes.length; i++) {
                int val = ((int) md5Bytes[i]) & 0xff;
                if (val < 16) {
                    hexValue.append("0");
                }
                hexValue.append(Integer.toHexString(val));
            }
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "";
        }
        return hexValue.toString().toUpperCase() + "-JANCY";
    }
}
