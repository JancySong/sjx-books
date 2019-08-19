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
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.songjianxi.books.domain.Admin;
import org.songjianxi.books.driven.AdminDTO;
import org.songjianxi.books.service.AdminServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.common.EncryptUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "adminAction")
@Results(value = {@Result(type = "redirect", name = "logout", location = "/admin/index.jsp")})
public class AdminAction implements ModelDriven<AdminDTO>, SessionAware, ServletResponseAware {

    private AdminDTO adminDTO = new AdminDTO();

    @Override
    public AdminDTO getModel() {
        return adminDTO;
    }

    private AdminServiceI adminService;

    public AdminServiceI getAdminService() {
        return adminService;
    }

    @Autowired
    public void setAdminService(AdminServiceI adminService) {
        this.adminService = adminService;
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

    public void login() {
        Admin admin = adminService.findAdminByNameAndPassWord(adminDTO);
        JSONTips jsonTips = new JSONTips();
        if (admin != null) {
            session.put("aid", admin.getAid());
            session.put("adminName", admin.getUsername());
            // 登陆成功
            // jsonTips.setMessage("登陆成功");
            jsonTips.setObject(admin.getUsername());
            jsonTips.setMessage("\u767B\u9646\u6210\u529F.");
        } else {
            jsonTips.setSuccess(false);
            // 用户名或密码错误
            // jsonTips.setMessage("用户名或密码错误");
            jsonTips.setMessage("\u7528\u6237\u540D\u6216\u5BC6\u7801\u9519\u8BEF");
        }
        Gson gson = new GsonBuilder().create();
        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public String logout() {
        session.clear();
        return "logout";
    }

    public void saveAdmin() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        Admin admin = new Admin();
        Timestamp time = new Timestamp(Calendar.getInstance().getTimeInMillis());
        BeanUtils.copyNotNullProperties(adminDTO, admin);
        admin.setCreateTime(time);
        admin.setModifyTime(time);
        admin.setPassword(EncryptUtil.MD5(adminDTO.getPassword()));

        Serializable id = adminService.saveAdmin(admin);
        if (id != null) {

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

    public void getAdmins() {
        DataGridTip<AdminDTO> dataGridTip = adminService.findAdminsByCondition(adminDTO);
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
