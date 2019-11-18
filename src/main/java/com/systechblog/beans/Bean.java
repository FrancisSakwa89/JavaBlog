package com.systechblog.beans;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

public class Bean<T> implements BeanI<T> {
    @PersistenceContext(unitName = "Blog")
    protected EntityManager entityManager;
    protected Class<T> entityClass;


    @Override
    public T add(T t)
    {
        try {
            entityManager.persist(t);
            return t;
        } catch (PersistenceException e) {
            return null;
        }
    }

    @Override
    public T findBy(long id) {
        return entityManager.find(entityClass, id);

    }

    @Override
    public T update(T t) {
        try {
            entityManager.merge(t);
            return t;
        } catch (PersistenceException e) {

            return null;

        }
    }

    @Override
    public T find(T t) {
        return null;
    }

    @Override
    public T read(long id) {
        return entityManager.find(entityClass, id);
    }

    @Override
    public boolean delete(T t) {
        try {
            entityManager.remove(t);
            return true;
        }catch (PersistenceException e){
            return false;
        }
    }
}
