package org.songjianxi.books.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.songjianxi.books.driven.BookImgDTO;
import org.songjianxi.books.service.BookImgServiceI;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "bookImgAction")
public class BookImgAction implements ModelDriven<BookImgDTO>, ServletResponseAware {


    private BookImgDTO bookImgDTO = new BookImgDTO();

    @Override
    public BookImgDTO getModel() {
        return bookImgDTO;
    }

    private BookImgServiceI bookImgService;

    public BookImgServiceI getBookImgService() {
        return bookImgService;
    }

    @Autowired
    public void setBookImgService(BookImgServiceI bookImgService) {
        this.bookImgService = bookImgService;
    }

    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public void getBookImgsById() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        DataGridTip<BookImgDTO> dataGridTip = bookImgService.getBookImgsByConditon(bookImgDTO);
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void orderByImgs() {
        int result = bookImgService.updateImgs(bookImgDTO);
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        if (result == 0) {
            jsonTips.setSuccess(false);
        }
        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void deleteImgsByIds() {
        JSONTips jsonTips = new JSONTips();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        Integer integer = bookImgService.deleteImgsByIds(bookImgDTO.getImgIds());
        if (integer != null && integer != 0) {

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

}
