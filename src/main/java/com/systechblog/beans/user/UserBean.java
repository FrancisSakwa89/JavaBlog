package com.systechblog.beans.user;

import com.systechblog.beans.Bean;
import com.systechblog.model.Post;
import com.systechblog.model.User;
import org.jboss.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.util.List;

@Local
@Stateless
public class UserBean extends Bean<User> implements UserBeanI {
    @Inject
    private transient Logger logger;

    @PostConstruct
    public void init() {
        this.entityClass = User.class;
    }



    @Override
    public User selectUserByName(String uName) {
        List<User> users=  this
                .entityManager
                .createNamedQuery("NQ_SELECT_USERNAME")
                .setParameter("userName", uName)
                .getResultList();
        logger.info("Successfully queried the user's details..");
        return users.size()>0?users.get(0):null;
    }

    @Override
    public User getUserById(long userId) {
        List<User> users=  this
                .entityManager
                .createNamedQuery("NQ_SELECT_BY_ID")
                .setParameter("userId", userId)
                .getResultList();
        logger.info("Successfully queried the user's details..");
        return users.size()>0?users.get(0):null;
    }
}
