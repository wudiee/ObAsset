package com.ob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.dao.TotalPropertyDAO;
import com.ob.dao.UserDAO;
import com.ob.dto.Portfolio;
import com.ob.dto.Property;

@Service
public class TotalPropertyService {
   
   @Autowired
   UserDAO userDAO;
   
   @Autowired
   TotalPropertyDAO totalPropertyDAO;
   
   public Portfolio getGenerationPortfolio(int age) {
      
      if(age != 20 && age != 30 && age != 40 && age!=50)
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
      
      portfolio.setStock(Double.valueOf(String.format("%.4f",sumOfProperties[0]/totalSum)));
      portfolio.setDeposit(Double.valueOf(String.format("%.4f",sumOfProperties[1]/totalSum)));
      portfolio.setHouse(Double.valueOf(String.format("%.4f",sumOfProperties[2]/totalSum)));
      portfolio.setFund(Double.valueOf(String.format("%.4f",sumOfProperties[3]/totalSum)));
      portfolio.setBond(Double.valueOf(String.format("%.4f",sumOfProperties[4]/totalSum)));
      portfolio.setGold(Double.valueOf(String.format("%.4f",sumOfProperties[5]/totalSum)));
      
      return portfolio;
   }
   
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
   public boolean updateTotalProperty(Property property) {
      
      if(property == null || property.getId().equals(""))
         return false;
      
      int row = totalPropertyDAO.updateTotalProperty(property);
      
      if(row==0)
         return false;
      else
         return true;
   }
}