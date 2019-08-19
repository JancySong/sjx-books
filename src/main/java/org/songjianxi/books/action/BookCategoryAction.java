package org.songjianxi.books.action;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.songjianxi.books.domain.BookCategory;
import org.songjianxi.books.driven.BookCategoryDTO;
import org.songjianxi.books.service.BookCategoryServiceI;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.songjianxi.books.util.tips.RespChartData;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "bookCategoryAction")
public class BookCategoryAction implements ModelDriven<BookCategoryDTO>, ServletResponseAware {

    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    private BookCategoryDTO bookCategoryDTO = new BookCategoryDTO();

    @Override
    public BookCategoryDTO getModel() {
        return this.bookCategoryDTO;
    }

    private BookCategoryServiceI bookCategoryService;

    public BookCategoryServiceI getBookCategoryService() {
        return bookCategoryService;
    }

    @Autowired
    public void setBookCategoryService(BookCategoryServiceI bookCategoryService) {
        this.bookCategoryService = bookCategoryService;
    }


    public void getBookCategory() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        List<BookCategory> list = bookCategoryService.getBookCategory(bookCategoryDTO.getPid());
        List<RespChartData> resList = new ArrayList<RespChartData>();
        RespChartData resCategory = null;
        if (EmptyUtil.isNotEmpty(list)) {
            for (int i = 0; i < list.size(); i++) {
                resCategory = new RespChartData();
                resCategory.setName(list.get(i).getCname());
                resCategory.setValue(list.get(i).getCid().toString());
                resList.add(resCategory);
            }
        }
        try {
            response.getWriter().write(gson.toJson(resList));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void getCategoryByLevel() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        DataGridTip<BookCategoryDTO> dataGridTip = bookCategoryService.getCategoryByLevel(bookCategoryDTO);
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void saveLevel() {
        Serializable id = bookCategoryService.saveBookCategory(bookCategoryDTO);
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        if (id == null) {
            jsonTips.setSuccess(false);
        }
        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void getBookCategoryById() {
        System.err.println("--------111111qqqqqqq----");
        System.out.println(bookCategoryDTO.getCid());
        System.out.println(bookCategoryDTO.getCid2());
        System.out.println("rrrrrrrttttttttttttt-----");
    }

}
