package org.songjianxi.books.util;

import java.text.MessageFormat;

import javax.mail.Session;

import org.songjianxi.books.util.mail.Mail;
import org.songjianxi.books.util.mail.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;

public class SendEmail {


    private String from;
    private String subject;
    private String content;
    private String host;
    private String username;
    private String password;

    private Mail mail;

    private Session session;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Mail getMail() {
        return mail;
    }

    @Autowired
    public void setMail(Mail mail) {
        this.mail = mail;
    }


    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public SendEmail() {}

    public void sendEmailTo(String toEmail, String activationCode) {
        String content = MessageFormat.format(this.getContent(), activationCode);
        mail.setFrom(this.getFrom());
        mail.setSubject(this.getSubject());
        mail.setContent(content);
        mail.addToAddress(toEmail);
        System.out.println(mail);
        session = MailUtil.createSession(host, username, password);
        MailUtil.send(session, mail);
    }

    public void sendEmailTo(String toEmail, String userName, String activationCode) {
        String content = MessageFormat.format(this.getContent(), userName, activationCode);
        mail.setFrom(this.getFrom());
        mail.setSubject(this.getSubject());
        mail.setContent(content);
        mail.addToAddress(toEmail);
        System.out.println(mail);
        session = MailUtil.createSession(host, username, password);
        MailUtil.send(session, mail);
    }


}
