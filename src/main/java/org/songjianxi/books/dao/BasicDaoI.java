package org.songjianxi.books.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;

public interface BasicDaoI<T> {


    public Serializable save(T t);

    public void delete(T t);

    public void update(T t);

    public Integer update(String hql, Map<String, Object> params);

    public void saveOrUpdate(T t);

    public T get(Class<T> classType, Serializable id);

    public T get(String hql, Map<String, Object> params);

    public List<T> find(String hql, Map<String, Object> params);

    public List<T> find(String hql, int page, int rows);

    public List<T> find(String hql, Map<String, Object> params, int page, int rows);

    public Long count(String hql, Map<String, Object> params);

    public int executeHql(String hql);

    public SQLQuery executeNativeSQL(String sql);

    public Query executeSqlName(String sqlName);
}
