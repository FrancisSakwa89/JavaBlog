package com.systechInterns.library;

import javax.ejb.Local;
import javax.ejb.Stateless;

@Stateless
@Local
public class EmailFormat {
    private String host;
    private String port;
    private String email;
    private String name;
    private String pass;

    private void init() {

        host = ("smtp.gmail.com");
        port = ("587");
        email = ("bursting.reports@gmail.com");
        name = ("bursting.reports@gmail.com");
        pass = ("Bursting123");
    }
    public void sendEmail(String subject, String content, String recipient) {
        if (recipient != null) {

            try {
                init();
                com.systechInterns.library.EmailUtility.sendEmail(host, port, email, pass, content,
                        recipient, subject, "sakwafrancis89@gmail.com");
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }else {
            System.out.println("user not found");
        }
    }


}
