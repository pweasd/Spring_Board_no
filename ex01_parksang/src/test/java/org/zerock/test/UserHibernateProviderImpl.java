package org.zerock.test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserHibernateProviderImpl implements UserProvider {

	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		 Session session = HibernateUtil.getSessionFactory().openSession();
		 Transaction tx = session.beginTransaction();
		 session.persist(user);
		 tx.commit();
		 session.close();
	}

	@Override
	public List<User> findAllUsers() {
		// TODO Auto-generated method stub
		 Session session = HibernateUtil.getSessionFactory().openSession();
		 Transaction tx = session.beginTransaction();
		 List users = session.createQuery("from User u order by u.name asc").list();

		 tx.commit();
		 session.close();
		 return users;

	}

	@Override
	public User findUser(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUser(String userId, String updateName) {
		// TODO Auto-generated method stub
		return null;
	}

}
