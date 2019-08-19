package org.songjianxi.books.action;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
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
import org.songjianxi.books.domain.BookBaseInfo;
import org.songjianxi.books.domain.BookOrder;
import org.songjianxi.books.domain.BookOrderItem;
import org.songjianxi.books.domain.User;
import org.songjianxi.books.driven.BookOrderDTO;
import org.songjianxi.books.driven.BookStockDTO;
import org.songjianxi.books.driven.UserCartDTO;
import org.songjianxi.books.service.BookOrderItemServiceI;
import org.songjianxi.books.service.BookOrderServiceI;
import org.songjianxi.books.service.BookStockServiceI;
import org.songjianxi.books.service.UserCartServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.Constants;
import org.songjianxi.books.util.ConvertUtil;
import org.songjianxi.books.util.PaymentUtil;
import org.songjianxi.books.util.common.EmptyUtil;
import org.songjianxi.books.util.common.IDUtil;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "bookOrderAction")
@Results({@Result(name = "myOrder", location = "/order/myOrder.jsp"), @Result(name = "payOrder", location = "/order/pay.jsp")})
@InterceptorRefs(value = {@InterceptorRef(value = "auth")})
public class BookOrderAction implements ModelDriven<BookOrderDTO>, ServletResponseAware, SessionAware {

    private BookOrderDTO bookOrderDTO = new BookOrderDTO();

    @Override
    public BookOrderDTO getModel() {
        return bookOrderDTO;
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

    private BookOrderServiceI bookOrderService;

    public BookOrderServiceI getBookOrderService() {
        return bookOrderService;
    }

    @Autowired
    public void setBookOrderService(BookOrderServiceI bookOrderService) {
        this.bookOrderService = bookOrderService;
    }

    private UserCartServiceI userCartService;

    public UserCartServiceI getUserCartService() {
        return userCartService;
    }

    @Autowired
    public void setUserCartService(UserCartServiceI userCartService) {
        this.userCartService = userCartService;
    }

    private BookOrderItemServiceI bookOrderItemService;


    public BookOrderItemServiceI getBookOrderItemService() {
        return bookOrderItemService;
    }

    @Autowired
    public void setBookOrderItemService(BookOrderItemServiceI bookOrderItemService) {
        this.bookOrderItemService = bookOrderItemService;
    }

    private BookStockServiceI bookStockService;


    public BookStockServiceI getBookStockService() {
        return bookStockService;
    }

    @Autowired
    public void setBookStockService(BookStockServiceI bookStockService) {
        this.bookStockService = bookStockService;
    }

    private List<BookOrderDTO> list;

    public List<BookOrderDTO> getList() {
        return list;
    }

    public void setList(List<BookOrderDTO> list) {
        this.list = list;
    }

    public void findBookOrdersByCondition() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        DataGridTip<BookOrderDTO> dataGridTip = bookOrderService.getBookOrderByCondition(bookOrderDTO);
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    public String getBookOrdersByUserId() {
        List<BookOrder> listModels = bookOrderService.getBookOrdersByUserId(bookOrderDTO);
        list = (List<BookOrderDTO>) ConvertUtil.convertModel(listModels, BookOrderDTO.class);
        return "myOrder";
    }

    public void updateStatus() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        Integer integer = bookOrderService.batchUpdateOrderStatus(bookOrderDTO);
        JSONTips jsonTips = new JSONTips();
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


    public void generateNewOrder() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();

        String orderId = IDUtil.generateOrderNo();
        String userId = (String) session.get("userId");
        Timestamp orderTime = new Timestamp(Calendar.getInstance().getTimeInMillis());
        Integer status = Constants.ORDER_UNCONFIRMED;
        String address = bookOrderDTO.getAddress();

        User user = new User();
        user.setUserId(userId);
        BookOrder bookOrder = new BookOrder(orderId, user, orderTime, 0.0, status, address);
        Serializable result = bookOrderService.generateOrder(bookOrder);

        System.out.println(result);

        UserCartDTO userCartDTO = new UserCartDTO();
        userCartDTO.setCartIds(bookOrderDTO.getCartIds());
        List<UserCartDTO> userCartModels = userCartService.getUserCartByCartIds(userCartDTO);
        if (EmptyUtil.isNotEmpty(userCartModels)) {
            BookOrderItem bookOrderItem = null;
            BookBaseInfo book = null;
            Double total = 0.0;
            for (UserCartDTO userCartModel : userCartModels) {
                bookOrderItem = new BookOrderItem();
                book = new BookBaseInfo();
                book.setBid(userCartModel.getBookId());
                BeanUtils.copyNotNullProperties(userCartModel, bookOrderItem);
                bookOrderItem.setBookBaseInfo(book);
                bookOrderItem.setBookOrder(bookOrder);
                bookOrderItem.setOrderItemId(IDUtil.generateCODE());
                bookOrderItemService.saveOrderItems(bookOrderItem);
                total = total + userCartModel.getQuantity() * userCartModel.getBookPrice();

                BookStockDTO bookStock = new BookStockDTO();
                bookStock.setBid(userCartModel.getBookId());
                bookStock.setBookStock(userCartModel.getQuantity());
                bookStockService.updateBookStockForOrder(bookStock);
            }
            BookOrderDTO bookOrderM = new BookOrderDTO();
            bookOrderM.setOrderId(orderId);
            bookOrderM.setTotal(total);
            bookOrderService.updateTotal(bookOrderM);
            userCartService.deleteByCartIds(userCartDTO);
        }
        try {
            userCartDTO.setUserId(userId);
            Integer count = userCartService.countUserCarts(userCartDTO);
            session.put("countCarts", count);
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    public String payBookOrder() {
        BookOrderDTO bookOrderDTO2 = bookOrderService.getBookOrderToPay(bookOrderDTO);
        bookOrderDTO.setTotal(bookOrderDTO2.getTotal());
        return "payOrder";
    }

    private String keyValue;
    private String p1_MerId;
    private String p8_Url;

    public String getKeyValue() {
        return keyValue;
    }

    @Value("${keyValue}")
    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }

    public String getP1_MerId() {
        return p1_MerId;
    }

    @Value("${p1_MerId}")
    public void setP1_MerId(String p1_MerId) {
        this.p1_MerId = p1_MerId;
    }

    public String getP8_Url() {
        return p8_Url;
    }

    @Value("${p8_Url}")
    public void setP8_Url(String p8_Url) {
        this.p8_Url = p8_Url;
    }

    public void payIt() {
        /*
         * 1. 准备13个参数
         */
        String p0_Cmd = "Buy";// 业务类型，固定值Buy
        // String p1_MerId = props.getProperty("p1_MerId");// 商号编码，在易宝的唯一标识
        String p2_Order = bookOrderDTO.getOrderId();// 订单编码
        String p3_Amt = "0.01";// 支付金额
        String p4_Cur = "CNY";// 交易币种，固定值CNY
        String p5_Pid = "";// 商品名称
        String p6_Pcat = "";// 商品种类
        String p7_Pdesc = "";// 商品描述
        // String p8_Url = props.getProperty("p8_Url");// 在支付成功后，易宝会访问这个地址。
        String p9_SAF = "";// 送货地址
        String pa_MP = "";// 扩展信息
        String pd_FrpId = bookOrderDTO.getBankNo();// 支付通道
        String pr_NeedResponse = "1";// 应答机制，固定值1

        /*
         * 2. 计算hmac 需要13个参数 需要keyValue 需要加密算法
         */
        // String keyValue = props.getProperty("keyValue");
        String hmac =
                PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                        pd_FrpId, pr_NeedResponse, keyValue);

        /*
         * 3. 重定向到易宝的支付网关
         */
        StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
        sb.append("?").append("p0_Cmd=").append(p0_Cmd);
        sb.append("&").append("p1_MerId=").append(p1_MerId);
        sb.append("&").append("p2_Order=").append(p2_Order);
        sb.append("&").append("p3_Amt=").append(p3_Amt);
        sb.append("&").append("p4_Cur=").append(p4_Cur);
        sb.append("&").append("p5_Pid=").append(p5_Pid);
        sb.append("&").append("p6_Pcat=").append(p6_Pcat);
        sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
        sb.append("&").append("p8_Url=").append(p8_Url);
        sb.append("&").append("p9_SAF=").append(p9_SAF);
        sb.append("&").append("pa_MP=").append(pa_MP);
        sb.append("&").append("pd_FrpId=").append(pd_FrpId);
        sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
        sb.append("&").append("hmac=").append(hmac);

        bookOrderDTO.setOrderIds(bookOrderDTO.getOrderId());
        bookOrderDTO.setStatus(Constants.ORDER_CONFIRMED);
        bookOrderService.batchUpdateOrderStatus(bookOrderDTO);

        try {
            response.sendRedirect(sb.toString());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
