package org.songjianxi.books.util.mail;


import java.util.ArrayList;
import java.util.List;

public class Mail {
    public static String ENCODING = "UTF-8";

    private String from;

    private StringBuilder toAddress;

    private StringBuilder ccAddress;

    private StringBuilder bccAddress;

    private String subject;

    private String content;

    private List<AttachBean> attachList;

    public Mail() {
        this.toAddress = new StringBuilder();
        this.ccAddress = new StringBuilder();
        this.bccAddress = new StringBuilder();

        this.attachList = new ArrayList<AttachBean>();
    }

    public Mail(String from, String to) {
        this(from, to, null, null);
    }

    public Mail(String from, String to, String subject, String content) {
        this.toAddress = new StringBuilder();
        this.ccAddress = new StringBuilder();
        this.bccAddress = new StringBuilder();

        this.attachList = new ArrayList<AttachBean>();

        this.from = from;
        this.toAddress.append(to);
        this.subject = subject;
        this.content = content;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getFrom() {
        return this.from;
    }

    public String getSubject() {
        return this.subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getToAddress() {
        return this.toAddress.toString();
    }

    public String getCcAddress() {
        return this.ccAddress.toString();
    }

    public String getBccAddress() {
        return this.bccAddress.toString();
    }

    public void addToAddress(String to) {
        if (this.toAddress.length() > 0) {
            this.toAddress.append(",");
        }
        this.toAddress.append(to);
    }

    public void addCcAddress(String cc) {
        if (this.ccAddress.length() > 0) {
            this.ccAddress.append(",");
        }
        this.ccAddress.append(cc);
    }

    public void addBccAddress(String bcc) {
        if (this.bccAddress.length() > 0) {
            this.bccAddress.append(",");
        }
        this.bccAddress.append(bcc);
    }

    public void addAttach(AttachBean attachBean) {
        this.attachList.add(attachBean);
    }

    public List<AttachBean> getAttachs() {
        return this.attachList;
    }

    @Override
    public String toString() {
        return "Mail [from=" + from + ", toAddress=" + toAddress + ", ccAddress=" + ccAddress + ", bccAddress=" + bccAddress + ", subject="
                + subject + ", content=" + content + ", attachList=" + attachList + "]";
    }


}
