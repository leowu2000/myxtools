package com.mmstart.core;

import java.util.List;

import javax.jdo.PersistenceManager;

public class CommonJDODAO {
	public void save(Object entity) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		pm.makePersistent(entity);
		pm.close();
	}

	public void delete(Object entity) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		pm.deletePersistent(entity);
		pm.close();
	}

	public Object findById(Class<?> entityClass, Long id) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Object o = pm.detachCopy(pm.getObjectById(entityClass, id));
		pm.close();
		return o;
	}

	public List<?> findAll(final Class<?> entityClass) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<?> list =  (List<?>) pm.detachCopyAll((List<?>)pm.newQuery(entityClass).execute());
		pm.close();
		return list;
	}

	public List<?> findByJDOQL(final String jdoql) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<?> list = (List<?>) pm.detachCopyAll((List<?>) pm.newQuery(jdoql).execute());
		pm.close();
		return list;
	}

	public PageList findAll(final Class<?> entityClass, final int page) {
		// return (PageList) getHibernateTemplate().execute(new
		// HibernateCallback() {
		// public Object doInHibernate(Session session) throws
		// HibernateException, SQLException {
		// Criteria c = session.createCriteria(entityClass);
		// PageInfo pi = new PageInfo(page, c.list().size());
		// c.setFirstResult(PageInfo.PAGESIZE * (page -
		// 1)).setMaxResults(PageInfo.PAGESIZE);
		// return new PageList(pi, c.list());
		// }
		// });
		return null;
	}

	public PageList findAll(final Class<?> entityClass, final int page, final List<Param> params, final List<Ord> ords) {
		// return (PageList) getHibernateTemplate().execute(new
		// HibernateCallback() {
		// public Object doInHibernate(Session session) throws
		// HibernateException, SQLException {
		// Criteria c = session.createCriteria(entityClass);
		// for (Param param : params) {
		// c.add(Restrictions.like(param.getCol(), param.getValue()));
		// }
		// PageInfo pi = new PageInfo(page,
		// (Integer)c.setProjection(Projections.rowCount()).uniqueResult());
		// c.setProjection(null);
		// for (Ord ord : ords) {
		// if (ord.getAscending())
		// c.addOrder(Order.asc(ord.getCol()));
		// else
		// c.addOrder(Order.desc(ord.getCol()));
		// }
		// c.setFirstResult(PageInfo.PAGESIZE * (page -
		// 1)).setMaxResults(PageInfo.PAGESIZE);
		// return new PageList(pi, c.list());
		// }
		// });
		return null;
	}

	public PageList findByHQL(final String hql, final int page) {
		// PageInfo pi = new PageInfo(page,
		// getHibernateTemplate().find(hql).size());
		// List<?> list = getHibernateTemplate().executeFind(new
		// HibernateCallback() {
		// public Object doInHibernate(Session session) throws
		// HibernateException, SQLException {
		// Query query = session.createQuery(hql);
		// return query.setFirstResult(PageInfo.PAGESIZE * (page -
		// 1)).setMaxResults(PageInfo.PAGESIZE).list();
		// }
		// });
		// return new PageList(pi, list);
		return null;
	}
}