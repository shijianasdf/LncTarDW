package utils;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SimpleFactory <O>{
	
	private String tableName;
	
	
	
	/**
	 * 
	 * @param fieldName 
	 * @param keyword
	 * @return for redirect to web page
	 */
	public List<O> query(String fieldName, String keyword){
		String queryTerm = "from "+this.tableName+" where "+fieldName+" = '"+keyword+"'";
		//Session s= new Configuration().configure().buildSessionFactory().openSession();
		SessionFactory sf = HibernateUtils.getSessionFactory();
		Session s =sf.getCurrentSession();
		s.beginTransaction();
		@SuppressWarnings("unchecked")
		List<O> qrslt = s.createQuery(queryTerm).list();
		s.getTransaction().commit();
		//s.close();
		return qrslt;
	}
	
	public List<O> query(){
		//Session s= new Configuration().configure().buildSessionFactory().openSession();
		SessionFactory sf = HibernateUtils.getSessionFactory();
		Session s =sf.getCurrentSession();
		s.beginTransaction();
		@SuppressWarnings("unchecked")
		List<O> qrslt = s.createQuery("from "+this.tableName).list();
		s.getTransaction().commit();
		//s.close();
		return qrslt;
	}
	
	public List<O> query(String queryTerm){
		//Session s= new Configuration().configure().buildSessionFactory().openSession();
		SessionFactory sf = HibernateUtils.getSessionFactory();
		Session s =sf.getCurrentSession();
		s.beginTransaction();
		@SuppressWarnings("unchecked")
		List<O> qrslt = s.createQuery(queryTerm).list();
		s.getTransaction().commit();
		//s.close();
		return qrslt;
	}
	
	public List<O> remainerquery(){
		//Session s= new Configuration().configure().buildSessionFactory().openSession();
		SessionFactory sf = HibernateUtils.getSessionFactory();
		Session s =sf.getCurrentSession();
		s.beginTransaction();
		@SuppressWarnings("unchecked")
		List<O> qrslt = s.createQuery("from hdfregulatory a where a.regulatortype = 'PCG' or a.regulatortype = 'snRNA' or a.regulatortype = 'pseudo' or a.regulatortype = 'snoRNA'").list();
		s.getTransaction().commit();
		//s.close();
		return qrslt;
	}
	
	public List<O> remainerquerys(){
		//Session s= new Configuration().configure().buildSessionFactory().openSession();
		SessionFactory sf = HibernateUtils.getSessionFactory();
		Session s =sf.getCurrentSession();
		s.beginTransaction();
		@SuppressWarnings("unchecked")
		List<O> qrslt = s.createQuery("select source,target from regulatortotarget a where a.regulatortype = 'PCG' or a.regulatortype = 'snRNA' or a.regulatortype = 'pseudo' or a.regulatortype = 'snoRNA'").list();
		s.getTransaction().commit();
		//s.close();
		return qrslt;
	}
	
	
	
	public boolean save(O obj){
		//Session s= new Configuration().configure().buildSessionFactory().openSession();
		SessionFactory sf = HibernateUtils.getSessionFactory();
		Session s =sf.getCurrentSession();
		s.beginTransaction();
		s.saveOrUpdate(obj);
		s.getTransaction().commit();
		//s.close();
		return true;
	}
	
	public SimpleFactory(String tableName){
		this.tableName = tableName;
	}
	
	public SimpleFactory(){
		
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	
}
