package project.model.Dao;

import java.util.List;

public interface genericDao {
	
	<E> E insert(E e);
	List View(String model,String where);
	List display(String model);
	int delete(String model,long id);
//	List display(String model);
//	List get(String un);

	
}
