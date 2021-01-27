package com.ob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ob.dto.Property;

@Mapper
public interface PropertyDAO {
	 public List<Property> getProperties(String id);
	 public Property getProperty(Property property);
	 public int addProperty(Property property);
	 public int updateProperty(Property property);
	
}
