package com.systechblog.beans;

public interface BeanI<T> {
    T add(T t);
    T findBy(long id);
    T update(T t);
    T find(T t);
    T read(long id) ;
    boolean delete(T t);
}
