package org.songjianxi.books.interceptor;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class CleanVCodeInterceptor extends MethodFilterInterceptor implements SessionAware {

    /**
	 * 
	 */
    private static final long serialVersionUID = 6331941868223046532L;

    private Map<String, Object> session;

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    protected String doIntercept(ActionInvocation invocation) throws Exception {
        System.out.println("vcode interceptor-----");
        String result = invocation.invoke();
        if (session != null) {
            if (session.containsKey("vcode")) {
                session.remove("vcode");
            }
        }
        return result;
    }
}
