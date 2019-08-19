package org.songjianxi.books.interceptor;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class EncodingInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 7309203033522198525L;

	private String charset = "UTF-8";
	public void setCharset(String charset) {
		this.charset = charset;
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		ActionContext actionContext = actionInvocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) actionContext.get(StrutsStatics.HTTP_RESPONSE);
		
		if (request.getMethod().equalsIgnoreCase("post")) {
			request.setCharacterEncoding(charset);
		}else {
			@SuppressWarnings("rawtypes")
			Iterator iterator = request.getParameterMap().values().iterator();
			
			while(iterator.hasNext()){
				String[] params = (String[]) iterator.next();
				params[0]=new String(params[0].getBytes("iso8859-1"),charset);
//				for (int i = 0; i < params.length; i++) {
//					params[i]=new String(params[i].getBytes("iso8859-1"),charset);
//				}
			}

		}
		response.setCharacterEncoding(charset);
		return actionInvocation.invoke();
	}

}
