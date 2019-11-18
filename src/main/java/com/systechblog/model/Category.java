package com.systechblog.model;

import javax.persistence.*;

@Entity
@Table(name = "tbl_category")
@NamedQueries({
        @NamedQuery(name = "NQ_SELECT_CAT", query = "select c from Category c"),
        @NamedQuery(name = "NQ_SELECT_CATEGORY", query = "select c from Category c where c.categoryEnum=:categoryEnum"),


})
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Enumerated(EnumType.STRING)
    private CategoryEnum categoryEnum;

    public Category() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    public CategoryEnum getCategoryEnum() {
        return categoryEnum;
    }

    public void setCategoryEnum(CategoryEnum categoryEnum) {
        this.categoryEnum = categoryEnum;
    }
}
