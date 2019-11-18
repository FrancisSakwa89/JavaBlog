package com.systechblog.beans.category;

import com.systechblog.beans.Bean;
import com.systechblog.model.Category;
import com.systechblog.model.CategoryEnum;
import org.jboss.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Local;
import javax.ejb.Startup;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.util.List;

@Stateless
@Local
@Startup
public class CategoryBean extends Bean<Category> implements  CategoryBeanI {
    @Inject
    private transient Logger logger;

    @PostConstruct
    public void init() {
        this.entityClass = Category.class;
    }



    @Override
    public Category findByCategory(CategoryEnum categoryEnum) {
        List<Category> categoryList =  this
                .entityManager
                .createNamedQuery("NQ_SELECT_CATEGORY")
                .setParameter("categoryEnum", categoryEnum)
                .getResultList();
        return categoryList.size()>0?categoryList.get(0):null;
    }

    @Override
    public Category findCategory(String category) {
        List<Category> categoryList =  this
                .entityManager
                .createNamedQuery("NQ_SELECT_CATEGORY")
                .setParameter("categoryEnum", category)
                .getResultList();
        return categoryList.size()>0?categoryList.get(0):null;
    }
}
