//package com.systechblog.beans.category;
//
//import com.systechblog.model.Category;
//import com.systechblog.model.CategoryEnum;
//
//import javax.annotation.PostConstruct;
//import javax.ejb.EJB;
//import javax.ejb.Singleton;
//import javax.ejb.Startup;
//
//@Singleton
//@Startup
//public class CategoryInserter {
//    @EJB
//    CategoryBeanI categoryBeanI;
//    @PostConstruct
//    public void initialize() {
//        for (CategoryEnum categoryEnum : CategoryEnum.values()) {
//            Category category = categoryBeanI.findByCategory(categoryEnum);
//            if (category == null) {
//                category = new Category();
//                category.setCategoryEnum(categoryEnum);
//                categoryBeanI.add(category);
//
//            }
//        }
//    }
//}
