package com.systechblog.beans.user;

import com.systechblog.beans.BeanI;
import com.systechblog.model.User;

import javax.ejb.Local;

@Local
public interface UserBeanI extends BeanI<User> {
    User selectUserByName(String uName);
    User getUserById(long userId);
    void signup(String username, String password);
}
