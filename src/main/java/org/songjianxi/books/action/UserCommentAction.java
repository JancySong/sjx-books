package org.songjianxi.books.action;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.songjianxi.books.domain.BookBaseInfo;
import org.songjianxi.books.domain.User;
import org.songjianxi.books.domain.UserComment;
import org.songjianxi.books.driven.UserCommentDTO;
import org.songjianxi.books.service.UserCommentServiceI;
import org.songjianxi.books.util.common.IDUtil;
import org.songjianxi.books.util.page.PageData;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "userCommentAction")
public class UserCommentAction implements ModelDriven<UserCommentDTO>, ServletResponseAware, SessionAware {

    private UserCommentDTO userCommentDTO = new UserCommentDTO();

    @Override
    public UserCommentDTO getModel() {
        return userCommentDTO;
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

    private UserCommentServiceI userCommentService;

    public UserCommentServiceI getUserCommentService() {
        return userCommentService;
    }

    @Autowired
    public void setUserCommentService(UserCommentServiceI userCommentService) {
        this.userCommentService = userCommentService;
    }

    public void findUserCommentsByCondition() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        DataGridTip<UserCommentDTO> dataGridTip = userCommentService.getUserCommentsByCondition(userCommentDTO);
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    public void findUserCommentsByBookId() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        PageData<UserCommentDTO> pageData = userCommentService.getUserCommentsByBookId(userCommentDTO);
        try {
            response.getWriter().write(gson.toJson(pageData));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void comment() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        UserComment userComment = new UserComment();
        User user = new User();
        user.setUserId(session.get("userId").toString());
        BookBaseInfo book = new BookBaseInfo();
        book.setBid(userCommentDTO.getBookId());

        userComment.setCommId(IDUtil.generateID());
        userComment.setUser(user);
        userComment.setBookBaseInfo(book);
        userComment.setContent(userCommentDTO.getContent());
        userComment.setCommTime(new Timestamp(Calendar.getInstance().getTimeInMillis()));

        Serializable id = userCommentService.saveUserComment(userComment);
        if (id != null && !"".equals(id)) {

        } else {
            jsonTips.setSuccess(false);
        }
        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
