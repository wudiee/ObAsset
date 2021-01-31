package com.ob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.dao.TotalPropertyDAO;
import com.ob.dao.UserDAO;
import com.ob.dto.User;

@Service
public class UserService {
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private TotalPropertyDAO totalPropertyDao;
	
	//회원 가입시 아이디 체크
	public boolean idCheck(String id) {
		boolean idCheck = false;
		
		if(!id.equals(userDao.getUser(id))) {
			idCheck = true;
		}
		
		return idCheck;
	}
	
	//회원가입
	public void signUp(User user) {
		userDao.addUser(user);
	}
	
	//회원가입시 totalproperty 생성
	public void addTotalProperty(String id) {
		totalPropertyDao.addTotalProperty(id);
	}
	
	//로그인
	public boolean signIn(User user) {
	      boolean login = false;
	      String id = user.getId();
	      String password = user.getPassword();
	      if(id.equals("")||password.equals("")) {
	         return false;
	      } else {
	         if(userDao.getUser(id) == null) {
	            return false;
	         } else if(id.equals(userDao.getUser(id).getId()) && password.equals(userDao.getUser(id).getPassword())){
	            login = true;
	         }
	      }
	      
	      return login;
	   }
	
	public User getUser(String id) {
		
		return userDao.getUser(id);
	}
	
	//중복아이디 체크
	public int userIdCheck(String id) {
		User user = userDao.getUser(id);
		if(user != null && user.getId() != null && user.getId().equals(id)) {
			return 1;
		}
		else return 0;
	}
}

