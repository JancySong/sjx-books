package org.songjianxi.books.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.songjianxi.books.driven.BookOrderDTO;
import org.songjianxi.books.driven.BookOrderItemDTO;
import org.songjianxi.books.service.BookOrderItemServiceI;
import org.songjianxi.books.service.BookOrderServiceI;
import org.songjianxi.books.util.tips.DataGridTip;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "bookOrderItemAction")
@Results({@Result(name = "details", location = "/order/myOrderDeatils.jsp")})
public class BookOrderItemAction implements ModelDriven<BookOrderItemDTO>, ServletResponseAware {

    private BookOrderItemDTO bookOrderItemDTO = new BookOrderItemDTO();

    @Override
    public BookOrderItemDTO getModel() {
        return bookOrderItemDTO;
    }

    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    private BookOrderItemServiceI bookOrderItemService;

    public BookOrderItemServiceI getBookOrderItemService() {
        return bookOrderItemService;
    }

    @Autowired
    public void setBookOrderItemService(BookOrderItemServiceI bookOrderItemService) {
        this.bookOrderItemService = bookOrderItemService;
    }

    private BookOrderServiceI bookOrderService;

    public BookOrderServiceI getBookOrderService() {
        return bookOrderService;
    }

    @Autowired
    public void setBookOrderService(BookOrderServiceI bookOrderService) {
        this.bookOrderService = bookOrderService;
    }

    public void getBookOrderItemByOrderId() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        DataGridTip<BookOrderItemDTO> dataGridTip = bookOrderItemService.getBookOrderItemByOrderId(bookOrderItemDTO);
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private List<BookOrderItemDTO> list;

    public List<BookOrderItemDTO> getList() {
        return list;
    }

    public void setList(List<BookOrderItemDTO> list) {
        this.list = list;
    }

    private BookOrderDTO bookOrderDTO;

    public BookOrderDTO getBookOrderDTO() {
        return bookOrderDTO;
    }

    public void setBookOrderDTO(BookOrderDTO bookOrderDTO) {
        this.bookOrderDTO = bookOrderDTO;
    }

    public String showBookDetails() {
        BookOrderDTO model = new BookOrderDTO();
        model.setOrderId(bookOrderItemDTO.getOrderId());
        bookOrderDTO = bookOrderService.getBookOrderToPay(model);
        list = bookOrderItemService.getBookOrderItemsById(bookOrderItemDTO);
        return "details";
    }

}
