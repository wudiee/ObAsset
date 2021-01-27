package com.ob.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ob.config.ApplicationConfig;
import com.ob.dto.Property;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ApplicationConfig.class})
public class PropertyServiceTest {
	
	@Autowired
	PropertyService propertyService;
	
	@Test
	public void getUserProperty() throws Exception{
		Assert.assertNotNull(propertyService.getUserProperty("one"));
		System.out.println(propertyService.getUserProperty("one"));
	}
	
	@Test
	public void checkProperty() throws Exception{
		Property property = new Property();
		property.setId("one");
		property.setBond(10);
		property.setDeposit(10);
		property.setFund(10);
		property.setGold(10);
		property.setHouse(10);
		property.setRegdate("121212");
		property.setStock(10);
		
		propertyService.checkProperty(property);
		
		System.out.println(propertyService.checkProperty(property));
	}
	
	@Test
	public void addProperty() throws Exception{
		Property property = new Property();
		property.setId("one");
		property.setBond(10);
		property.setDeposit(10);
		property.setFund(10);
		property.setGold(10);
		property.setHouse(10);
		property.setRegdate("121212");
		property.setStock(10);
		
		System.out.println(propertyService.addProperty(property));
	}
	
	@Test
	public void updateProperty() throws Exception{
		Property property = new Property();
		property.setId("one");
		property.setBond(10);
		property.setDeposit(10);
		property.setFund(10);
		property.setGold(10);
		property.setHouse(10);
		property.setRegdate("3131");
		property.setStock(3030);
		
		propertyService.updateProperty(property);
		System.out.println(propertyService.updateProperty(property));
	}
}
