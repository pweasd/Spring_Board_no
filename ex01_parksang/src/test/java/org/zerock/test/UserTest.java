package org.zerock.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class UserTest {
	private UserProvider provider;
	 @Before
	 public void setUp() throws Exception {
		 provider = new UserHibernateProviderImpl();
	 }
	 
	 @Test
	 public void testInsertUser() throws Exception {
	 User user = new User("demonpark", "ев╫╨ем", "seoul");
	 provider.insertUser(user);

	 List<User> users = provider.findAllUsers();

	 assertNotNull(users);
	 assertEquals("demonpark", users.get(0).getUserId());
	 }

}
