package org.songjianxi.books.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.songjianxi.books.driven.BookStockDTO;
import org.songjianxi.books.service.BookStockServiceI;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "bookStockAction")
public class BookStockAction implements ModelDriven<BookStockDTO>, ServletResponseAware {

    private BookStockDTO bookStockDTO = new BookStockDTO();

    @Override
    public BookStockDTO getModel() {
        return bookStockDTO;
    }

    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    private BookStockServiceI bookStockService;

    public BookStockServiceI getBookStockService() {
        return bookStockService;
    }

    @Autowired
    public void setBookStockService(BookStockServiceI bookStockService) {
        this.bookStockService = bookStockService;
    }


    public void getBookStock() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        DataGridTip<BookStockDTO> dataGridTip = bookStockService.getBooKStockByCondition(bookStockDTO);
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void updateBookStock() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        Integer result = bookStockService.updateBookStock(bookStockDTO);
        JSONTips jsonTips = new JSONTips();
        if (result != null && result > 0) {
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
