package com.ob.dao;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ob.config.ApplicationConfig;
import com.ob.dto.Property;
import com.ob.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class})
public class PropertyMappertTest {
	@Autowired
	private PropertyDAO propertyDAO;
	
	@Test
	public void getProperties() throws Exception{
		Assert.assertNotNull(propertyDAO.getProperties("one"));
		System.out.println(propertyDAO.getProperties("one"));
	}
	@Test
	public void getProperty() throws Exception{
		Property property = new Property();
		
		property.setId("one");
		property.setRegdate("202105");
	
		Assert.assertNotNull(propertyDAO.getProperty(property));
		System.out.println(propertyDAO.getProperty(property));
	}
	@Test
	public void addProperty() throws Exception{
		Property property = new Property();
		
		property.setId("one");
		property.setStock(100);
		property.setBond(100);
		property.setDeposit(100);
		property.setFund(100);
		property.setGold(100);
		property.setHouse(100);
		property.setRegdate("202106");
		
		propertyDAO.addProperty(property);
	}
	@Test
	public void updateProperty() throws Exception{
		Property property = new Property();
		
		property.setId("one");
		property.setStock(200);
		property.setBond(100);
		property.setDeposit(100);
		property.setFund(100);
		property.setGold(100);
		property.setHouse(100);
		property.setRegdate("202106");
		
		propertyDAO.updateProperty(property);
	}
	
}