package com.systechblog.beans.category;

import com.systechblog.beans.BeanI;
import com.systechblog.model.Category;
import com.systechblog.model.CategoryEnum;

import javax.ejb.Local;

@Local
public interface CategoryBeanI extends BeanI<Category> {
    Category findByCategory(CategoryEnum categoryEnum);
    Category findCategory(String category);
}
