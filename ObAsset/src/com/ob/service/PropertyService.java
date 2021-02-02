package com.ob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.dao.PropertyDAO;
import com.ob.dto.Property;

@Service
public class PropertyService {
	@Autowired
	private PropertyDAO propertydao;
	
	public List<Property> getUserProperty(String id){ 
		//=> 내 자산 추이에서 사용 (property) --성공
		return propertydao.getProperties(id);
	}
	public boolean checkProperty(Property property) {
		//=> 자산 입력시, 해당 월에 데이터가 있는지 확인
		return propertydao.getProperty(property) != null;
	}
	public boolean addProperty(Property property) {
		// => 자산 입력시, 해당 월에 데이터가 없으면 사용
		  if (!checkProperty(property)) { 
			  propertydao.addProperty(property);
		  return true;
		  } else return false;
	}
	public boolean updateProperty(Property property) { 
		//=> 자산 입력시, 해당 월에 데이터가 있으면 업데이트 (property) --성공
		 if (checkProperty(property)) { 
			  propertydao.updateProperty(property);
		  return true;
		  } else return false;
	}
	
		public List<Integer> getMonthlyProperty(String id, String year){
		System.out.println(id);
		System.out.println(year);
		
		List<Integer> totalProperty = new ArrayList<Integer>();
		
		for(int i=1;i<=12;i++) {
			
			if(i<10) {
				
				Property property = new Property();
				property.setId(id);
				property.setRegdate(year+"0"+String.valueOf(i));

				String total = propertydao.getColumnProperty(property);
				
				if(total!=null)
					totalProperty.add(Integer.valueOf(total));
				else
					totalProperty.add(0);
			}
			else {
				Property property = new Property();
				property.setId(id);
				property.setRegdate(year+String.valueOf(i));

				String total = propertydao.getColumnProperty(property);
				
				if(total!=null)
					totalProperty.add(Integer.valueOf(total));
				else
					totalProperty.add(0);
			
			}
		}
		
		return totalProperty;
	}
	
}


