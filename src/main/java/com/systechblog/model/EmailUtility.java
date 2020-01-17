package com.systechInterns.library;



import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class EmailUtility {
    public static void sendEmail(String host, String port, String username, String password, String message1, String to, String subject, String from) {

        try {


            Properties props = new Properties();

            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.fallback", "true");

            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            props.put("mail.smtp.ssl.socketFactory", sf);//this is for Xi
            //props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");//this is for gmail

            Session mailSession = Session.getDefaultInstance(props);
            mailSession.setProtocolForAddress("rfc822", "smtps");
            // mailSession.setDebug(true);
            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject(subject);
            message.setContent(message1, "text/html");

            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            Transport transport = mailSession.getTransport();

            try {

                message.setFrom(new InternetAddress(from));
                transport.connect(host, Integer.valueOf(port), username,
                        password);

                transport.sendMessage(message,
                        message.getRecipients(Message.RecipientType.TO));
                transport.close();
            } catch (MessagingException e) {
                e.printStackTrace();
            }

        } catch (GeneralSecurityException ex) {
            // Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            // Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}