package org.songjianxi.books.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.songjianxi.books.driven.UserDTO;
import org.songjianxi.books.service.UserServiceI;
import org.songjianxi.books.util.Constants;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class LoginListener implements HttpSessionAttributeListener, HttpSessionListener {


    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // TODO Auto-generated method stub

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        // HttpSession session = event.getSession();
        // String name = session.getAttribute("username").toString();
        // String userId = session.getAttribute("userId").toString();
        // UserServiceI userService = (UserServiceI) getObjectFromApplication(session.getServletContext(), "userService");
        // if (name != null) {
        // // \u7528\u6237 用户
        // // \u4E0B\u7EBF\u4E86 下线了
        // System.out.println("\u7528\u6237:11[ " + event.getSession().getAttribute("username") + " ] \u4E0B\u7EBF\u4E86");
        // UserDTO userDTO = new UserDTO();
        // userDTO.setUserId(userId);
        // userDTO.setStatus(Constants.USER_OUTLINE);
        // userService.userOnlineOrOutline(userDTO);
        // }
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        HttpSession session = event.getSession();
        if (event.getName().equals("username")) {
            // \u4E0A\u7EBF\u4E86 上线
            System.out.println("\u7528\u6237:2[ " + event.getSession().getAttribute("username") + " ] \u4E0A\u7EBF\u4E86");
            System.out.println("id:" + event.getSession().getAttribute("userId"));
            UserDTO userDTO = new UserDTO();
            userDTO.setUserId(event.getSession().getAttribute("userId").toString());
            userDTO.setStatus(Constants.USER_ONLINE);
            UserServiceI userService = (UserServiceI) getObjectFromApplication(session.getServletContext(), "userService");
            userService.userOnlineOrOutline(userDTO);
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        HttpSession session = event.getSession();
        if (event.getName().equals("username")) {
            // \u4E0A\u7EBF\u4E86 上线
            System.out.println("\u7528\u6237:3[ " + event.getSession().getAttribute("username") + " ] \u4E0B\u7EBF\u4E86");
            System.out.println("id:" + event.getSession().getAttribute("userId"));
            UserDTO userDTO = new UserDTO();
            userDTO.setUserId(event.getSession().getAttribute("userId").toString());
            userDTO.setStatus(Constants.USER_OUTLINE);
            UserServiceI userService = (UserServiceI) getObjectFromApplication(session.getServletContext(), "userService");
            userService.userOnlineOrOutline(userDTO);
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent se) {
        // TODO Auto-generated method stub

    }

    private Object getObjectFromApplication(ServletContext servletContext, String beanName) {
        ApplicationContext application = WebApplicationContextUtils.getWebApplicationContext(servletContext);
        return application.getBean(beanName);
    }

}
