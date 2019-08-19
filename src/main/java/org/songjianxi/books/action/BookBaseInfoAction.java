package org.songjianxi.books.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.songjianxi.books.domain.BookBaseInfo;
import org.songjianxi.books.domain.BookImg;
import org.songjianxi.books.driven.BookBaseInfoDTO;
import org.songjianxi.books.service.BookBaseInfoServiceI;
import org.songjianxi.books.util.BeanUtils;
import org.songjianxi.books.util.Constants;
import org.songjianxi.books.util.FileUrlGenerator;
import org.songjianxi.books.util.page.PageData;
import org.songjianxi.books.util.tips.DataGridTip;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

@ParentPackage("sjxPackage")
@Namespace("/")
@Action(value = "bookBaseInfoAction")
@Results({@Result(name = "bookDetails", location = "/showBookDetails.jsp"), @Result(name = "comment", location = "/comment/newComment.jsp")})
public class BookBaseInfoAction implements ModelDriven<BookBaseInfoDTO>, ServletResponseAware {

    private BookBaseInfoDTO bookBaseInfoDTO = new BookBaseInfoDTO();

    @Override
    public BookBaseInfoDTO getModel() {
        return bookBaseInfoDTO;
    }

    private BookBaseInfoServiceI bookBaseInfoService;

    public BookBaseInfoServiceI getBookBaseInfoService() {
        return bookBaseInfoService;
    }

    @Autowired
    public void setBookBaseInfoService(BookBaseInfoServiceI bookBaseInfoService) {
        this.bookBaseInfoService = bookBaseInfoService;
    }

    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public void show() {
        PageData<BookBaseInfoDTO> pageData = bookBaseInfoService.queryBooksLikeWhere(bookBaseInfoDTO);

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        try {
            response.getWriter().write(gson.toJson(pageData));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String showBook() {
        BookBaseInfo bookBaseInfo = bookBaseInfoService.getBookById(bookBaseInfoDTO.getBid());
        List<String> list = new ArrayList<String>(0);
        List<BookImg> imgs = bookBaseInfo.getBookImgList();
        Collections.sort(imgs, new Comparator<BookImg>() {
            public int compare(BookImg b1, BookImg b2) {
                if (b1.getOrderBy() > b2.getOrderBy()) {
                    return 1;
                }
                if (b1.getOrderBy() == b2.getOrderBy()) {
                    return 0;
                }
                return -1;
            }
        });
        if (imgs != null && imgs.size() > 0) {
            for (int i = 0; i < imgs.size(); i++) {
                list.add(imgs.get(i).getImgUrl());
            }
        }
        BeanUtils.copyNotNullProperties(bookBaseInfo, bookBaseInfoDTO);
        bookBaseInfoDTO.setImgUrls(list);
        return "bookDetails";
    }

    public void findBooksByCondition() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        DataGridTip<BookBaseInfoDTO> dataGridTip = bookBaseInfoService.findBooksByCondition(bookBaseInfoDTO);
        try {
            response.getWriter().write(gson.toJson(dataGridTip));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public String getBookInfo() {
        BookBaseInfo bookBaseInfo = bookBaseInfoService.getBookById(bookBaseInfoDTO.getBid());
        BeanUtils.copyNotNullProperties(bookBaseInfo, bookBaseInfoDTO);
        return "comment";
    }

    public void saveBook() {
        System.out.println("--------0000-------");
        System.out.println(bookBaseInfoDTO);
        System.out.println("ppppppppppppppppppppp");
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = bookBaseInfoService.savdeBookBaseInfo(bookBaseInfoDTO);
        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void uploadCoverImg() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        try {
            ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 取得需要上传的文件数组
        File files = getFile();
        if (files != null) {
            FileOutputStream fos;
            Map<String, String> map = FileUrlGenerator.createUrl(getFileFileName());
            String url = map.get("url");
            String path = getSavePath() + File.separator + url;
            String finalFileName = map.get("finalFileName");
            bookBaseInfoDTO.setCoverImage(url + Constants.SEPARATOR + finalFileName);
            bookBaseInfoService.updateBook(bookBaseInfoDTO);
            try {
                File file = new File(path);
                if (!file.exists()) {// 目录不存在则直接创建
                    file.mkdirs();
                }
                fos = new FileOutputStream(path + File.separator + finalFileName);
                FileInputStream fis = new FileInputStream(files);
                byte[] buffer = new byte[1024];
                int len = 0;
                while ((len = fis.read(buffer)) > 0) {
                    fos.write(buffer, 0, len);
                }
                fis.close();
                fos.close();
            } catch (FileNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                jsonTips.setSuccess(false);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                jsonTips.setSuccess(false);
            }
        }

        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public BookBaseInfoAction() {
        // TODO Auto-generated constructor stub
    }

    private File file; // 上传的文件
    private String fileFileName; // 文件名称
    private String fileContentType; // 文件类型
    @Value("${upload.savePath}")
    private String savePath;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }


}
