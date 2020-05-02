package project.model.Dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.model.Dao.genericDao;

@Repository
public class genericDaoImpl implements genericDao {
	
	@PersistenceContext
	private EntityManager en;	
	@Transactional
	public <E> E insert(E e) {
		 return en.merge(e);
	}
	
	@Transactional
	public List View(String model,String where) {
		return en.createQuery("from "+ model +" where " + where +"").getResultList();
	}
	
	@Transactional
	public List display(String model) {
		return en.createQuery("from "+model).getResultList();
	}
	
	@Transactional
	public int delete(String model,long id) {
		 Query q = en.createQuery("delete from "+model+" where id = '"+id+"'");
	     return q.executeUpdate();
	}
	
/*	
	
	
	
	@Transactional
	public List display(String model) {
		return en.createQuery("from "+model+" ORDER BY "+model+"_id DESC").getResultList();
	}
	
	@Transactional
	public List get(String un){
	    
		Query q = en.createQuery("from employeemodel where username = '"+un+"'");
	    List list = q.getResultList();
	    return list;
	} */
	
	
}
