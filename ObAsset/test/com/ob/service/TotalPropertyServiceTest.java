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
public class TotalPropertyServiceTest {
	
	@Autowired
	TotalPropertyService totalPropertyService;
	
	@Test
	public void getGenerationPortfolio() throws Exception{
		Assert.assertNotNull(totalPropertyService.getGenerationPortfolio(30));
		System.out.println(totalPropertyService.getGenerationPortfolio(30));
	}
	@Test
	public void getSectorPortfolio() throws Exception{
		Assert.assertNotNull(totalPropertyService.getSectorPortfolio(0.99));
		System.out.println(totalPropertyService.getSectorPortfolio(0.99));
	}
	@Test
	public void getUserPortfolio() throws Exception{
		Assert.assertNotNull(totalPropertyService.getUserPortfolio("one"));
		System.out.println(totalPropertyService.getUserPortfolio("one"));
	}
	@Test
	public void updateTotalProperty() throws Exception{
		Property property = new Property();
		property.setId("one");
		property.setBond(1200);
		property.setDeposit(170000);
		property.setFund(100);
		property.setGold(1000);
		property.setHouse(190000);
		property.setStock(15000);
		
		System.out.println(totalPropertyService.updateTotalProperty(property));
	}
	
}

