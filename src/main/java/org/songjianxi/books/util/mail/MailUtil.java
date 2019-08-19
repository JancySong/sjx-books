package org.songjianxi.books.util.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

    public static Session createSession(String host, String username, String password) {
        final Properties prop = new Properties();
        prop.setProperty("mail.host", host);
        prop.setProperty("mail.user", username);
        prop.setProperty("mail.password", password);
        prop.setProperty("mail.smtp.auth", "true");
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String userName = prop.getProperty("mail.user");
                String passWord = prop.getProperty("mail.password");
                return new PasswordAuthentication(userName, passWord);
            }
        };
        return Session.getInstance(prop, authenticator);
    }

    public static void send(Session session, Mail mail) {
        MimeMessage message = new MimeMessage(session);
        try {
            message.setHeader("Content-Type", "text/plain; charset= " + Mail.ENCODING);
            message.setFrom(new InternetAddress(mail.getFrom()));
            message.setRecipient(RecipientType.TO, new InternetAddress(mail.getToAddress()));
            // message.setRecipient(RecipientType.CC, new InternetAddress(mail.getCcAddress()));
            // message.setRecipient(RecipientType.BCC, new InternetAddress(mail.getBccAddress()));
            message.setSubject(mail.getSubject());
            message.setContent(mail.getContent(), "text/html;charset=UTF-8");

            Transport.send(message);

        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

}
