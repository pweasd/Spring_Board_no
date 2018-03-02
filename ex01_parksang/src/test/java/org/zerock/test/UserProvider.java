package org.zerock.test;

import java.util.List;

public interface UserProvider {
	public void insertUser(User user);
	 public List<User> findAllUsers();
	 public User findUser(String userId);
	 public User updateUser(String userId,String updateName);
}
