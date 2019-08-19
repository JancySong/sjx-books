package org.songjianxi.books.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthenticationInterceptor extends AbstractInterceptor {

    /**
     * 
     */
    private static final long serialVersionUID = 8549316815010258576L;

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map<String, Object> map = invocation.getInvocationContext().getSession();
        if (map.get("username") == null) {
            return "noLogin";
        } else {
            return invocation.invoke();
        }
    }

}
