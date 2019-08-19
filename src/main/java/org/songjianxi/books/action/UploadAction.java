package org.songjianxi.books.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.songjianxi.books.domain.BookBaseInfo;
import org.songjianxi.books.domain.BookImg;
import org.songjianxi.books.service.BookImgServiceI;
import org.songjianxi.books.util.Constants;
import org.songjianxi.books.util.FileUrlGenerator;
import org.songjianxi.books.util.common.IDUtil;
import org.songjianxi.books.util.tips.JSONTips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport implements ServletResponseAware {

    /**
     * 
     */
    private static final long serialVersionUID = 7751160562987724411L;

    private List<File> file; // 上传的文件
    private List<String> fileFileName; // 文件名称
    private List<String> fileContentType; // 文件类型
    @Value("${upload.savePath}")
    private String savePath;
    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    private String bookId;


    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    private BookImgServiceI bookImgService;

    public BookImgServiceI getBookImgService() {
        return bookImgService;
    }

    @Autowired
    public void setBookImgService(BookImgServiceI bookImgService) {
        this.bookImgService = bookImgService;
    }

    public void uploadFile() {
        Integer orderBy = bookImgService.countImgsByBookId(bookId);
        System.out.println(">>>>>>>>>>>>>>>>");
        System.out.println(savePath);
        System.out.println(bookId);
        System.out.println(file.size());
        System.out.println("<<<<<<<<<<<<<<");
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        JSONTips jsonTips = new JSONTips();
        try {
            ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 取得需要上传的文件数组
        List<File> files = getFile();
        if (files != null && files.size() > 0) {
            BookImg bookImg = null;
            for (int i = 0; i < files.size(); i++) {
                FileOutputStream fos;
                Map<String, String> map = FileUrlGenerator.createUrl(getFileFileName().get(i));
                String url = map.get("url");
                String path = getSavePath() + File.separator + url;
                String finalFileName = map.get("finalFileName");
                bookImg = new BookImg();
                bookImg.setImgId(IDUtil.generateID());
                bookImg.setImgUrl(url + Constants.SEPARATOR + finalFileName);
                bookImg.setOrderBy(++orderBy);
                BookBaseInfo bookBaseInfo = new BookBaseInfo();
                bookBaseInfo.setBid(bookId);
                bookImg.setBookBaseInfo(bookBaseInfo);
                bookImgService.save(bookImg);
                try {
                    File file = new File(path);
                    if (!file.exists()) {// 目录不存在则直接创建
                        file.mkdirs();
                    }
                    fos = new FileOutputStream(path + File.separator + finalFileName);
                    FileInputStream fis = new FileInputStream(files.get(i));
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
        }

        try {
            response.getWriter().write(gson.toJson(jsonTips));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public List<File> getFile() {
        return file;
    }

    public void setFile(List<File> file) {
        this.file = file;
    }

    public List<String> getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(List<String> fileFileName) {
        this.fileFileName = fileFileName;
    }

    public List<String> getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(List<String> fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

}
