package org.songjianxi.books.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.songjianxi.books.util.common.VerifyCodeUtils;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "verifyCodeAction")
public class VerifyCodeAction implements SessionAware, ServletResponseAware {

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

    public void newVerifyCode() {
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        // 存入会话session
        session.put("vcode", verifyCode.toLowerCase());
        System.out.println(session.get("vcode"));
        // 生成图片
        int w = 200, h = 66;
        try {
            VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
