package com.ob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ob.dto.Property;

@Mapper
public interface TotalPropertyDAO {

	 public List<Property> getTotalProperties();
	 public Property getTotalProperty(String id);
	 public List<Property> getTotalPropertiesFromGeneration(int generation);
	 public int updateTotalProperty(Property property);
	 public int addTotalProperty(String id);
}
