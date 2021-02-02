package com.ob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ob.dto.User;

@Mapper
public interface UserDAO {
	public User getUser(String id);
	public List<User> getUsers();
	public void addUser(User user);
	public void deleteUser(User user);	
	public List<User> findId(User user);
	public User findPassword(User user);
}
