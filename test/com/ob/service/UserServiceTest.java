package com.ob.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ob.config.ApplicationConfig;
import com.ob.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class})
public class UserServiceTest {

	@Autowired
	UserService userService;
	
	@Test
	public void idCheck() {
		System.out.println(userService.idCheck("one"));
	}
	
	@Test
	public void signUp(){
		User user = new  User();
		user.setId("two");
		user.setPassword("1234");
		user.setName("name");
		user.setGeneration(40);
		user.setBank("KB");
		
		userService.signUp(user);
	}
}
