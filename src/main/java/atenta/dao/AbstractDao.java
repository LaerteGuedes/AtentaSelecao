package atenta.dao;

import java.io.Serializable;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public abstract class AbstractDao<PK extends Serializable, T> {
	
	private final Class<T> persistentClass;
	
	@SuppressWarnings("unchecked")
	public AbstractDao(){
		this.persistentClass =(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
	}

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	protected EntityManager getEntityManager(){
		return entityManagerFactory.createEntityManager();
	}

	public T findById(PK key){
		EntityManager manager = entityManagerFactory.createEntityManager();

		try{
			return manager.find(persistentClass, key);
		}finally {
			manager.close();
		}
	}

	public List<T> findAll() {
		EntityManager manager = entityManagerFactory.createEntityManager();
		Query query = manager.createQuery("Select t from " + persistentClass.getSimpleName() + " t");
		List<T> result = query.getResultList();
		manager.close();
		return result;
	}

	public void store(T entity){
		EntityManager manager = entityManagerFactory.createEntityManager();
		EntityTransaction tx = manager.getTransaction();

		try{
			tx.begin();
			manager.merge(entity);
			tx.commit();
		}catch (RuntimeException ex){
			tx.rollback();
			throw ex;
		}
		finally {
			manager.close();
		}
	}

	public void delete(PK key){
		EntityManager manager = entityManagerFactory.createEntityManager();
		EntityTransaction tx = manager.getTransaction();

		try{
			tx.begin();
			T obj = manager.find(persistentClass, key);
			manager.remove(obj);
			tx.commit();
		}catch (RuntimeException ex){
			tx.rollback();
			throw ex;
		}finally {
			manager.close();
		}

	}

}
