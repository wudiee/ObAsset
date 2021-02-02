package com.ob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.ob.dao.TotalPropertyDAO;
import com.ob.dao.UserDAO;
import com.ob.dto.Portfolio;
import com.ob.dto.Property;
import com.ob.dto.User;

@Service
public class TotalPropertyService {
   
   @Autowired
   UserDAO userDAO;
   
   @Autowired
   TotalPropertyDAO totalPropertyDAO;
   
   @Autowired
   PropertyService propertyService;
   
   @Transactional(readOnly = true)
   public Portfolio getGenerationPortfolio(int age) {
      
      if(age != 10 && age != 20 && age != 30 && age != 40 && age!=50)
         return null;
      
      List<Property> properties = totalPropertyDAO.getTotalPropertiesFromGeneration(age);

      if(properties.size() == 0)
         return null;
      
      double totalSum = 0;
      
      
      //0 : stock / 1 : deposit / 2 : house / 3: fund / 4 : bond / 5 : gold 
      double[] sumOfProperties = new double[6];
      
      Portfolio portfolio = new Portfolio();
      
      for(Property property : properties) {
         
         sumOfProperties[0] += property.getStock();
         sumOfProperties[1] += property.getDeposit();
         sumOfProperties[2] += property.getHouse();
         sumOfProperties[3] += property.getFund();
         sumOfProperties[4] += property.getBond();
         sumOfProperties[5] += property.getGold();
         
      }
      
      for(double num : sumOfProperties)
         totalSum += num;
      
      portfolio.setStock(Double.valueOf(String.format("%.4f",(sumOfProperties[0]/totalSum)*100)));
      portfolio.setDeposit(Double.valueOf(String.format("%.4f",(sumOfProperties[1]/totalSum)*100)));
      portfolio.setHouse(Double.valueOf(String.format("%.4f",(sumOfProperties[2]/totalSum)*100)));
      portfolio.setFund(Double.valueOf(String.format("%.4f",(sumOfProperties[3]/totalSum)*100)));
      portfolio.setBond(Double.valueOf(String.format("%.4f",(sumOfProperties[4]/totalSum)*100)));
      portfolio.setGold(Double.valueOf(String.format("%.4f",(sumOfProperties[5]/totalSum)*100)));
      
      return portfolio;
   }
   
   @Transactional(readOnly = true)
   public List<Portfolio> getSectorPortfolio(double riskyAssetRate){
      
      if(riskyAssetRate > 1 || riskyAssetRate <=0)
         return null;
      
      List<Property> properties = totalPropertyDAO.getTotalProperties();

      if(properties.size() == 0)
         return null;
       
      
      // 0 : Risky Asset Portfolio / 1 : Average Asset portfolio / 2 : Safety Asset Portfolio
      
      // 섹터별 자산 총합
      double[] sectorSum = new double[3];
      // 섹터별 자산 합
      Property[] sectorProperty = new Property[3];
      sectorProperty[0] = new Property();
      sectorProperty[1] = new Property();
      sectorProperty[2] = new Property();
      
      // 섹터별 포트폴리오
      List<Portfolio> portfolios = new ArrayList<Portfolio>(); 
      portfolios.add(new Portfolio());
      portfolios.add(new Portfolio());
      portfolios.add(new Portfolio());
      
      /**
       * 모든 property를 받아와서, 비율에 따라 섹터별로 나눠서 합을 저장
       */
      for(int i=0;i<properties.size();i++) {
         
         Property property = properties.get(i);
         
         double tmpSum = property.getStock()+ property.getDeposit() + property.getHouse() + property.getFund() + property.getBond() + property.getGold();
         if(tmpSum > 0) {
        	 
         sectorSum[1] += tmpSum;
         
         // 평균
         sectorProperty[1].setStock(sectorProperty[1].getStock() + property.getStock()); 
         sectorProperty[1].setDeposit(sectorProperty[1].getDeposit() + property.getDeposit()); 
         sectorProperty[1].setHouse(sectorProperty[1].getHouse() + property.getHouse()); 
         sectorProperty[1].setFund(sectorProperty[1].getFund() + property.getFund()); 
         sectorProperty[1].setBond(sectorProperty[1].getBond() + property.getBond()); 
         sectorProperty[1].setGold(sectorProperty[1].getGold() + property.getGold()); 
         
         // 위험 비율
         double tmpRiskyRate = (property.getStock() + property.getFund())/tmpSum;
         
         // 위험 자산을 선호할 경우
         if(tmpRiskyRate > riskyAssetRate) {
            
            // 위험 자산군
            sectorProperty[0].setStock(sectorProperty[0].getStock() + property.getStock()); 
            sectorProperty[0].setDeposit(sectorProperty[0].getDeposit() + property.getDeposit()); 
            sectorProperty[0].setHouse(sectorProperty[0].getHouse() + property.getHouse()); 
            sectorProperty[0].setFund(sectorProperty[0].getFund() + property.getFund()); 
            sectorProperty[0].setBond(sectorProperty[0].getBond() + property.getBond()); 
            sectorProperty[0].setGold(sectorProperty[0].getGold() + property.getGold()); 
            
            sectorSum[0] += tmpSum;
         }
         // 안전 자산을 선호할 경우
         else {
            
            // 안전 자산군
            sectorProperty[2].setStock(sectorProperty[2].getStock() + property.getStock()); 
            sectorProperty[2].setDeposit(sectorProperty[2].getDeposit() + property.getDeposit()); 
            sectorProperty[2].setHouse(sectorProperty[2].getHouse() + property.getHouse()); 
            sectorProperty[2].setFund(sectorProperty[2].getFund() + property.getFund()); 
            sectorProperty[2].setBond(sectorProperty[2].getBond() + property.getBond()); 
            sectorProperty[2].setGold(sectorProperty[2].getGold() + property.getGold()); 
            
            sectorSum[2] += tmpSum;
            
         }
        }

         
      }
      
      for(int i=0;i<portfolios.size();i++) {
         
         Portfolio portfolio = portfolios.get(i);
         if(sectorSum[i] > 0 ) {
        	
         portfolio.setStock(Double.valueOf(String.format("%.4f",(sectorProperty[i].getStock())/sectorSum[i])));
         portfolio.setDeposit(Double.valueOf(String.format("%.4f",(sectorProperty[i].getDeposit())/sectorSum[i])));
         portfolio.setHouse(Double.valueOf(String.format("%.4f",(sectorProperty[i].getHouse())/sectorSum[i])));
         portfolio.setFund(Double.valueOf(String.format("%.4f",(sectorProperty[i].getFund())/sectorSum[i])));
         portfolio.setBond(Double.valueOf(String.format("%.4f",(sectorProperty[i].getBond())/sectorSum[i])));
         portfolio.setGold(Double.valueOf(String.format("%.4f",(sectorProperty[i].getGold())/sectorSum[i])));
         }
      }
      
      return portfolios;
   }
   
   @Transactional(readOnly = true)
   public Portfolio getUserPortfolio(String id) {
      
      if(id.equals(""))
         return null;

      Property property = totalPropertyDAO.getTotalProperty(id);
      
      if( property== null) 
         return null;
      
      double totalSum = 0;
      
      // 0 : stock / 1 : deposit / 2 : house / 3: fund / 4 : bond / 5 : gold
      double[] sumOfProperties = new double[6];
      
      Portfolio portfolio = new Portfolio();
      
      sumOfProperties[0] += property.getStock();
      sumOfProperties[1] += property.getDeposit();
      sumOfProperties[2] += property.getHouse();
      sumOfProperties[3] += property.getFund();
      sumOfProperties[4] += property.getBond();
      sumOfProperties[5] += property.getGold();
   
      for(double num : sumOfProperties)
         totalSum += num;
      
      if(totalSum > 0) {
    	  
      portfolio.setStock(Double.valueOf(String.format("%.4f",sumOfProperties[0]/totalSum)));
      portfolio.setDeposit(Double.valueOf(String.format("%.4f",sumOfProperties[1]/totalSum)));
      portfolio.setHouse(Double.valueOf(String.format("%.4f",sumOfProperties[2]/totalSum)));
      portfolio.setFund(Double.valueOf(String.format("%.4f",sumOfProperties[3]/totalSum)));
      portfolio.setBond(Double.valueOf(String.format("%.4f",sumOfProperties[4]/totalSum)));
      portfolio.setGold(Double.valueOf(String.format("%.4f",sumOfProperties[5]/totalSum)));
      }
      return portfolio;
      
   } 
   
   @Transactional(readOnly = false)
   public boolean updateTotalProperty(Property property) {
	      
	      if(property == null || property.getId().equals(""))
	         return false;
	      
	      List<Property> properties = propertyService.getUserProperty(property.getId());
	      
	      if(properties.size() == 0)
	          return false;
	      
	      //0 : stock / 1 : deposit / 2 : house / 3: fund / 4 : bond / 5 : gold 
	      int[] sumOfProperties = new int[6];
	      
	      for(Property tmpProperty : properties) {
	         
	         sumOfProperties[0] += tmpProperty.getStock();
	         sumOfProperties[1] += tmpProperty.getDeposit();
	         sumOfProperties[2] += tmpProperty.getHouse();
	         sumOfProperties[3] += tmpProperty.getFund();
	         sumOfProperties[4] += tmpProperty.getBond();
	         sumOfProperties[5] += tmpProperty.getGold();
	      }
	      
	      property.setStock(sumOfProperties[0]);
	      property.setDeposit(sumOfProperties[1]);
	      property.setHouse(sumOfProperties[2]);
	      property.setFund(sumOfProperties[3]);
	      property.setBond(sumOfProperties[4]);
	      property.setGold(sumOfProperties[5]);
	      
	      
	      int row = totalPropertyDAO.updateTotalProperty(property);
	      
	      if(row==0)
	         return false;
	      else
	         return true;
	   }
   
   @Transactional(readOnly = false)
   	public boolean addTotalProperty(User user) {
	   
	   if(user==null || user.getId()==null)
		   return false;
	   else {
		   
		   int row = totalPropertyDAO.addTotalProperty(user.getId());
		   
		   if(row==0)
		         return false;
		      else
		         return true;
	   }
	   
   	}
   	
   @Transactional(readOnly = true)
   	public void setBarChartData(ModelMap model, int age, String id, String year) {
 	   Portfolio portfolio = getGenerationPortfolio(age);
 	   model.addAttribute("barData", portfolio);
 	   model.addAttribute("age", age);
 	   
 	  Portfolio myPortfolio = getUserPortfolio(id);
  	  model.addAttribute("myPortfolio",myPortfolio);
  	 
   	List<Portfolio> portfoilos = getSectorPortfolio(0.3);
 	
 	model.addAttribute("riskyPortfolio",portfoilos.get(0));
 	model.addAttribute("averagePortfolio",portfoilos.get(1));
 	model.addAttribute("safetyPortfolio",portfoilos.get(2));
 	
 	List<Integer> list = propertyService.getMonthlyProperty(id, year);
    model.addAttribute("month", list);
    }

   	
   	
}