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
public class TotalPropertyMapperTest {
	
	@Autowired
	private TotalPropertyDAO totalPropertyDAO;
	
	@Test
	public void getTotalProperties() throws Exception{
		Assert.assertNotNull(totalPropertyDAO.getTotalProperties());
		System.out.println(totalPropertyDAO.getTotalProperties());
	}
	@Test
	public void getTotalProperty() throws Exception{
		Assert.assertNotNull(totalPropertyDAO.getTotalProperty("one"));
		System.out.println(totalPropertyDAO.getTotalProperty("one"));
	}
	@Test
	public void getTotalPropertiesFromGeneration() throws Exception{
		Assert.assertNotNull(totalPropertyDAO.getTotalPropertiesFromGeneration(20));
		System.out.println(totalPropertyDAO.getTotalPropertiesFromGeneration(20));
	}
	@Test
	public void updateTotalProperty() throws Exception{
		Property property  = new Property();
		property.setId("id");
		property.setStock(100);
		property.setBond(100);
		property.setDeposit(100);
		property.setFund(100);
		property.setGold(100);
		property.setHouse(100);	
		int row = totalPropertyDAO.updateTotalProperty(property);
		System.out.println(row);

	}
	@Test
	public void addTotalProperty() throws Exception{
		
		int row = totalPropertyDAO.addTotalProperty("id");
		System.out.println(row);
	}
	
}
