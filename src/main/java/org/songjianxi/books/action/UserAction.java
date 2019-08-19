package org.songjianxi.books.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.songjianxi.books.domain.User;
import org.songjianxi.books.driven.UserCartDTO;
import org.songjianxi.books.driven.UserDTO;
import org.songjianxi.books.service.UserCartServiceI;
import org.songjianxi.books.service.UserServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.SendEmail;
import org.songjianxi.books.util.common.EncryptUtil;
import org.songjianxi.books.util.common.IDUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "userAction")
@Results(value = {@Result(type = "redirect", name = "success", location = "/index.jsp"), @Result(name = "fail", location = "/login.jsp"),
        @Result(name = "invalid.token", location = "/token.jsp"), @Result(name = "verfyError", location = "/reg.jsp"),
        @Result(name = "regSuccess", location = "/regSuccess.jsp"), @Result(name = "activeSuccess", location = "/activeSuccess.jsp")})
@InterceptorRefs(value = {@InterceptorRef(value = "encodeToken")})
public class UserAction implements ModelDriven<UserDTO>, SessionAware, ServletResponseAware {

    private UserDTO userDTO = new UserDTO();

    @Override
    public UserDTO getModel() {
        return userDTO;
    }

    private Map<String, Object> session;

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    private UserServiceI userService;

    public UserServiceI getUserService() {
        return userService;
    }

    @Autowired
    public void setUserService(UserServiceI userService) {
        this.userService = userService;
    }

    private SendEmail emailTo;


    public SendEmail getEmail() {
        return emailTo;
    }

    @Autowired
    public void setEmail(SendEmail emailTo) {
        this.emailTo = emailTo;
    }

    private UserCartServiceI userCartService;



    public UserCartServiceI getUserCartService() {
        return userCartService;
    }

    @Autowired
    public void setUserCartService(UserCartServiceI userCartService) {
        this.userCartService = userCartService;
    }

    public String login() {
        User user = new User();
        BeanUtils.copyNotNullProperties(userDTO, user);
        user.setPassword(EncryptUtil.MD5(userDTO.getPassword()));
        // System.out.println("vcode: " + ",name:" + userDTO.getUsername() + ",password:" + userDTO.getPassword());
        if (session.get("vcode").equals(userDTO.getVerifyCode())) {
            User loginUser = userService.checkUser(user);
            if (loginUser != null) {
                UserCartDTO userCartDTO = new UserCartDTO();
                userCartDTO.setUserId(loginUser.getUserId());
                Integer count = userCartService.countUserCarts(userCartDTO);
                session.put("userId", loginUser.getUserId());
                session.put("countCarts", count);
                session.put("username", loginUser.getUsername());
                return "success";
            } else {
                userDTO.setMsg("\u7528\u6237\u540D\u6216\u5BC6\u7801\u9519\u8BEF");
                // userDTO.setMsg("用户名或密码错误");
                return "fail";
            }
        } else {
            System.out.println("Login failed...");
            session.remove("vcode");
            userDTO.setMsg("\u9A8C\u8BC1\u7801\u9519\u8BEF");
            // userDTO.setMsg("验证码错误");
            return "fail";
        }
    }

    public void isExistUserName() {
        // emailTo.sendEmailTo("---0000009999000----", "");
        User user = userService.isExistUserName(userDTO.getUsername());
        JSONTips jsonTips = new JSONTips();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        if (user != null) {
            jsonTips.setSuccess(true);
        } else {
            jsonTips.setSuccess(false);
        }
        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public String regist() {
        if (session.get("vcode").equals(userDTO.getVerifyCode())) {
            User user = new User();
            BeanUtils.copyNotNullProperties(userDTO, user);
            user.setUserId(IDUtil.generateID());
            String activationCode = IDUtil.generateCODE();
            user.setStatus(0);
            user.setIsActivate(0);
            user.setCreateTime(new Timestamp(new Date().getTime()));
            user.setActivationCode(activationCode);
            user.setPassword(EncryptUtil.MD5(userDTO.getPassword()));
            User user2 = userService.addUser(user);
            if (user2 != null) {
                emailTo.sendEmailTo(userDTO.getEmail(), user2.getUsername(), activationCode);
                session.put("regName", user2.getUsername());
                System.out.println("55===++");
                return "regSuccess";
            } else {
                userDTO.setMsg("\u6CE8\u518C\u5931\u8D25");
                // userDTO.setMsg("注册失败");
                return "verfyError";
            }
        } else {
            userDTO.setMsg("\u9A8C\u8BC1\u7801\u9519\u8BEF");
            // userDTO.setMsg("验证码错误");
            return "verfyError";
        }
    }

    public String activeUser() {
        System.out.println(userDTO.getUsername() + userDTO.getActivationCode());
        Integer result = userService.activeUser(userDTO);
        if (result != null && result > 0) {
            return "activeSuccess";
        }
        return null;
    }

    public void getUsers() {
        DataGridTip<UserDTO> dataGridTip = userService.getUserByCondition(userDTO);
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public String logout() {
        session.clear();
        return "success";
    }

}
