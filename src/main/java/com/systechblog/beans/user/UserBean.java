package com.systechblog.beans.user;

import com.systechblog.beans.Bean;
import com.systechblog.model.Post;
import com.systechblog.model.User;
import org.jboss.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Local
@Stateless
public class UserBean extends Bean<User> implements UserBeanI {

    Map DB = new HashMap();
    public static final String SALT = "my-salt-text";

    @Inject
    private transient Logger logger;

    @PostConstruct
    public void init() {
        this.entityClass = User.class;
    }


    @Override
    public User selectUserByName(String uName) {
        List<User> users = this
                .entityManager
                .createNamedQuery("NQ_SELECT_USERNAME")
                .setParameter("userName", uName)
                .getResultList();
        logger.info("Successfully queried the user's details..");
        return users.size() > 0 ? users.get(0) : null;
    }

    @Override
    public User getUserById(long userId) {
        List<User> users = this
                .entityManager
                .createNamedQuery("NQ_SELECT_BY_ID")
                .setParameter("userId", userId)
                .getResultList();
        logger.info("Successfully queried the user's details..");
        return users.size() > 0 ? users.get(0) : null;
    }


    @Override
    public void signup(String username, String password) {
        String saltedPassword = SALT;
        String hashedPassword = generateHash(saltedPassword);
        DB.put(username, hashedPassword);
    }

    public Boolean login(String username, String password) {
        Boolean isAuthenticated = false;

        // remember to use the same SALT value use used while storing password
        // for the first time.
        String saltedPassword = SALT;
        String hashedPassword = generateHash(saltedPassword);

        String storedPasswordHash = String.valueOf(DB.get(username));
        if (hashedPassword.equals(storedPasswordHash)) {
            isAuthenticated = true;
        } else {
            isAuthenticated = false;
        }
        return isAuthenticated;
    }

    public static String generateHash(String input) {
        StringBuilder hash = new StringBuilder();

        try {
            MessageDigest sha = MessageDigest.getInstance("SHA-1");
            byte[] hashedBytes = sha.digest(input.getBytes());
            char[] digits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                    'a', 'b', 'c', 'd', 'e', 'f'};
            for (int idx = 0; idx < hashedBytes.length; idx++) {
                byte b = hashedBytes[idx];
                hash.append(digits[(b & 0xf0) >> 4]);
                hash.append(digits[b & 0x0f]);
            }
        } catch (NoSuchAlgorithmException e) {
            // handle error here.
            System.out.println("Error...");
        }

        return hash.toString();
    }


}
