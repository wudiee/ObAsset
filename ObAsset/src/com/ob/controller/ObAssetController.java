package com.ob.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ob.dto.Portfolio;
import com.ob.dto.Property;
import com.ob.dto.User;
import com.ob.service.PropertyService;
import com.ob.service.TotalPropertyService;
import com.ob.service.UserService;

@Controller
@RequestMapping
public class ObAssetController {
   String year = "2021";
	
   @Autowired
   private UserService userService;
   
   @Autowired
   	TotalPropertyService totalPropertyService;
   
   @Autowired
	PropertyService propertyService;

   @RequestMapping("/register")
	public String register(HttpSession session, ModelMap model) {
		
		String id = (String)session.getAttribute("loginOK");

		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			 User user = userService.getUser(id);
             totalPropertyService.setBarChartData(model, user.getGeneration(), user.getId(), year);
             return "index";			
		}
		// 로그인 세션이 없는 경우
		else 
			return "register";
	}

   @RequestMapping("/userRegister")
	public String userRegister(User user, HttpSession session, ModelMap model) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			 user = userService.getUser(id);
             totalPropertyService.setBarChartData(model, user.getGeneration(), user.getId(), year);
             return "index";
		}
		
		// 로그인 세션이 없는 경우
		if(user!=null && !(user.getId()==null)){
			userService.signUp(user);
			boolean success = totalPropertyService.addTotalProperty(user);
			
			if(success)
				return "redirect:/login";
			else
				return "redirect:/register";
         }
         return "redirect:/login";
	}
   
   @RequestMapping("/login")
   public String login(HttpSession session, ModelMap model) {
// session.removeAttribute("loginOK");
      String id = (String)session.getAttribute("loginOK");
         
      // 로그인 세션이 있는 경우(내부이동)
      if(id!=null && !id.equals("")) {
    	  User user = userService.getUser(id);
          totalPropertyService.setBarChartData(model, user.getGeneration(), user.getId(), year);
          return "index";
      }
      else {
         return "login";
      }
   }

   @RequestMapping("/index")
	public String index(HttpSession session, ModelMap model) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우(내부이동)
		if(id!=null && !id.equals("")) {
			 User user = userService.getUser(id);
	          totalPropertyService.setBarChartData(model, user.getGeneration(), user.getId(), year);
	          return "index";
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
   
   @RequestMapping("/loginCheck")
      public String loginCheck(User user, HttpSession session, ModelMap model) {
       
      String id = (String)session.getAttribute("loginOK");
         
         // 로그인 세션이 있는 경우(내부이동)
         if(id!=null && !id.equals("")) {
        	 user = userService.getUser(id);
	          totalPropertyService.setBarChartData(model, user.getGeneration(), user.getId(), year);
	          return "index";
         }
      
         if(user!=null && !(user.getId()==null)){ 
        	// 여기부터 로그인 세션 없는 경우
             boolean loginUser = userService.signIn(user);
             
             //ID,password 미입력 or 잘못 입력시 로그인 페이지로 다시 이동
             if(!loginUser) {
                 return "redirect:/"; 
              } else {
                 session.setAttribute("loginOK", user.getId());
                 user = userService.getUser(user.getId());
                 totalPropertyService.setBarChartData(model, user.getGeneration(), user.getId(), year);
                 List<Integer> list = propertyService.getMonthlyProperty(user.getId(), "2021");
                 model.addAttribute("month", list);
                 
                 return "index";
              }
         }
         return "redirect:/login";
      }
   
   @RequestMapping("/logout")
   public String logout(HttpSession session) {
      
      String id = (String)session.getAttribute("loginOK");
      
      // 로그인 세션이 있는 경우
      if(id!=null && !id.equals("")) 
         session.removeAttribute("loginOK");
      
      return "redirect:/login";
   }
   
   @RequestMapping("/addProperty")
	public String addProperty(Property property,HttpSession session, ModelMap model) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")){
			
			// 정상적으로 자산이 입력된 경우
			if(property !=null && property.getRegdate()!=null) {
				
				String date = property.getRegdate();
				String parsingDate = date.substring(0, 4)+date.substring(5, 7);
			
				property.setRegdate(parsingDate);
				
				// 해당 월에 자산이 존재하는 경우
				if(!(propertyService.checkProperty(property))) 
					propertyService.addProperty(property);
				
				// 해당 월에 자산이 존재하지 않는 경우
				else 
					propertyService.updateProperty(property);
				
				// total property 업데이트에 성공한 경우
				if(totalPropertyService.updateTotalProperty(property)) {
					 User user = userService.getUser(id);
			          totalPropertyService.setBarChartData(model, user.getGeneration(), user.getId(), year);
			          return "index";
				}
				// total property 업데이트에 실패한 경우
				else
					return "redirect:/portfolio";
			}
			// 자산이 입력되지 않은 경우
			else
				return "redirect:/portfolio";
			
		}
		// 로그인 세션이 없는 경우
		else 	
			return "redirect:/login";
	}

   @RequestMapping("/portfolio")
	public String portfolio(HttpSession session) {
		
		String id = (String)session.getAttribute("loginOK");

		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals(""))
			return "portfolio";			
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
   
	@RequestMapping("/news")
	public String news(HttpSession session) {
		
		String id = (String)session.getAttribute("loginOK");

		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals(""))
			return "news";			
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
	
	@GetMapping("/updateAge")
	public String updateAge(int age, ModelMap model, HttpSession session) {
		
		String id = (String)session.getAttribute("loginOK");

		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			
			totalPropertyService.setBarChartData(model, age, id, year);
			return "index";
			
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
		
	}

	

}