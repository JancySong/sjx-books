package org.songjianxi.books.util;

import java.util.Collection;
import java.util.Iterator;


public class ConvertUtil {

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Collection convertModel(Collection sourceList, Class clazz) {
        if (sourceList == null) {
            return null;
        }
        Collection destList = (Collection) getInstance(sourceList.getClass());

        for (Iterator iter = sourceList.iterator(); iter.hasNext();) {
            Object orig = iter.next();
            Object dest = getInstance(clazz);
            BeanUtils.copyProperties(orig, dest);
            destList.add(dest);
        }
        return destList;
    }

    @SuppressWarnings("rawtypes")
    private static Object getInstance(Class clazz) {
        try {
            return clazz.newInstance();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
