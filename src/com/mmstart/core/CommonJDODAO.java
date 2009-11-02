package com.mmstart.core;

import java.util.List;

import javax.jdo.PersistenceManager;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;

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
		List<?> list = (List<?>) pm.detachCopyAll((List<?>) pm.newQuery(entityClass).execute());
		pm.close();
		return list;
	}

	public List<?> findByJDOQL(final String jdoql) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<?> list = (List<?>) pm.detachCopyAll((List<?>) pm.newQuery(jdoql).execute());
		pm.close();
		return list;
	}

	public PageList findAll(Class<?> entityClass, int page) {
		PageInfo pi = new PageInfo(page, getCount(entityClass));
		PersistenceManager pm = PMF.get().getPersistenceManager();
		javax.jdo.Query q = pm.newQuery(entityClass);
		q.setRange(PageInfo.PAGESIZE * (pi.curPage - 1), PageInfo.PAGESIZE * pi.curPage);// begin,end
		List<?> list = (List<?>) pm.detachCopyAll((List<?>) q.execute());
		pm.close();
		return new PageList(pi, list);
	}

	public int getCount(Class<?> entityClass) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query query = new Query(entityClass.getSimpleName());
		query.setKeysOnly();
		return ds.prepare(query).asList(FetchOptions.Builder.withOffset(0)).size();
	}

	public PageList findByJDOQL(String jdoql, int page) {
		PageInfo pi = new PageInfo(page, getCount(jdoql));
		PersistenceManager pm = PMF.get().getPersistenceManager();
		javax.jdo.Query q = pm.newQuery(jdoql);
		q.setRange(PageInfo.PAGESIZE * (pi.curPage - 1), PageInfo.PAGESIZE * pi.curPage);// begin,end
		List<?> list = (List<?>) pm.detachCopyAll((List<?>) q.execute());
		pm.close();
		return new PageList(pi, list);
	}

	public int getCount(String jdoql) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		javax.jdo.Query q = pm.newQuery(jdoql);
		int count = ((List<?>) q.execute()).size();
		pm.close();
		return count;
	}
}