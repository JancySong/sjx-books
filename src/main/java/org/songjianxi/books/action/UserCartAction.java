package org.songjianxi.books.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.songjianxi.books.domain.BookBaseInfo;
import org.songjianxi.books.domain.User;
import org.songjianxi.books.domain.UserCart;
import org.songjianxi.books.driven.UserCartDTO;
import org.songjianxi.books.service.UserCartServiceI;
import org.songjianxi.books.util.common.IDUtil;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;


@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "userCartAction", interceptorRefs = {@InterceptorRef("encode"), @InterceptorRef("author")})
@Results({@Result(name = "userCarts", location = "/user/userCart.jsp"), @Result(name = "total", location = "/order/order.jsp")})
public class UserCartAction implements ModelDriven<UserCartDTO>, ServletResponseAware, SessionAware {

    private static final String USER_CART = "userCarts";

    private UserCartServiceI userCartService;

    public UserCartServiceI getUserCartService() {
        return userCartService;
    }

    @Autowired
    public void setUserCartService(UserCartServiceI userCartService) {
        this.userCartService = userCartService;
    }

    private UserCartDTO userCartDTO = new UserCartDTO();

    @Override
    public UserCartDTO getModel() {
        return userCartDTO;

    }

    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    private Map<String, Object> session;

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    private List<UserCartDTO> list;

    public List<UserCartDTO> getList() {
        return list;
    }

    public void setList(List<UserCartDTO> list) {
        this.list = list;
    }

    public String query() {
        list = userCartService.getUserCart(userCartDTO);
        return USER_CART;
    }

    public String total() {
        list = userCartService.getUserCartByCartIds(userCartDTO);
        System.out.println(list.size() + "+++++pppp");
        return "total";
    }

    public void remove() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        Integer integer = userCartService.deleteByCartId(userCartDTO);
        if (integer != null && integer > 0) {
            userCartDTO.setUserId(session.get("userId").toString());
            Integer count = userCartService.countUserCarts(userCartDTO);
            session.put("countCarts", count);
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

    public void addOSubQuantity() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        Integer integer = userCartService.updateUserCartById(userCartDTO);
        if (integer != null && integer > 0) {

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

    public void addBookToUserCart() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        userCartDTO.setUserId(session.get("userId").toString());
        UserCart userCart = userCartService.getUserCartByUserIdAndBookId(userCartDTO);
        if (userCart != null) {
            userCart.setQuantity(userCart.getQuantity() + userCartDTO.getQuantity());
            userCartService.saveUserCart(userCart);
        } else {
            BookBaseInfo book = new BookBaseInfo();
            book.setBid(userCartDTO.getBookId());
            User user = new User();
            user.setUserId(session.get("userId").toString());

            userCart = new UserCart();
            userCart.setCartId(IDUtil.generateID());
            userCart.setUser(user);
            userCart.setBookBaseInfo(book);
            userCart.setQuantity(userCartDTO.getQuantity());

            userCartService.saveUserCart(userCart);

            userCartDTO.setUserId(session.get("userId").toString());
            Integer count = userCartService.countUserCarts(userCartDTO);
            session.put("countCarts", count);
        }
        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
