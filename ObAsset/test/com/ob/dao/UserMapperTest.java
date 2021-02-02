package com.ob.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ob.config.ApplicationConfig;
import com.ob.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class})
public class UserMapperTest {
	
	@Autowired
	private UserDAO userDAO;
	
	@Test
	public void getUser() throws Exception{
		Assert.assertNotNull(userDAO.getUser("one"));
		System.out.println(userDAO.getUser("one"));
	}
	@Test
	public void getUsers()throws Exception{
		Assert.assertNotNull(userDAO.getUsers());
		System.out.println(userDAO.getUsers());
	}
	@Test
	public void addUser() throws Exception{
		User user = new User();
		user.setId("id");
		user.setName("name");
		user.setPassword("password");
		user.setGeneration(30);
		user.setBank("bank");
		userDAO.addUser(user);
	}
}