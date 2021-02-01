package com.ob.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.dto.Board;
import com.ob.dto.Property;
import com.ob.dto.User;
import com.ob.service.BoardService;
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

   @Autowired
   BoardService boardService;
   
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
            	 session.setAttribute("loginResult", "아이디 또는 비밀번호가 잘못되었습니다.");
                 return "redirect:/"; 
              } else {
             	 user = userService.getUser(user.getId());
                 session.setAttribute("loginOK", user.getId());
                 String bank = null;
         		switch(user.getBank()) {
         		
         		case "ibk":
         			bank="img/ibk_logo.png";
         			break;
         		case "nh":
         			bank="img/nh_logo.png";
         			break;
         		case "sh":
         			bank="img/sh_logo.jpg";
         			break;
         		case "kb":
         			bank="img/kb_logo.jpg";
         			break;
         		case "wr":
         			bank="img/wr_logo.jpg";
         			break;
         		}
         		session.setAttribute("bank", bank);

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
	
	@RequestMapping("/board")
	public String board(HttpSession session, ModelMap model) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			model.addAttribute("boardList", boardService.getBoards());
			return "board/board";
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
	
	// 글쓰기 기능
	@RequestMapping("/write")
	public String write(HttpSession session) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			return "board/write";			
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
	
	@RequestMapping("/content")
	public String content(@RequestParam("id")String auth, @RequestParam("seq")Integer seq, HttpSession session, ModelMap model) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			Board board = new Board();
			board.setSeq(seq);
			board.setId(auth);
			board = boardService.getBoard(board);
			board.setCnt(board.getCnt()+1);
			boardService.updateBoard(board);
			model.addAttribute("board",board);
			return "board/content";			
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
	
	// 게시판 content 삭제기능
	@RequestMapping("/contentdelete")
	public String contentdelete(@RequestParam("id")String auth, @RequestParam("seq")Integer seq, HttpSession session) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			Board board = new Board();
			board.setSeq(seq);
			board.setId(auth);
			board = boardService.getBoard(board);
			boardService.deleteBoard(board);
			return "redirect:/board";			
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
	
	// 게시판 content 등록기능
	@RequestMapping("/contentwrite")
	public String contentwrite(HttpSession session, Board board) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			boardService.addBoard(board);
			return "redirect:/board";			
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
	
	// 게시판 content 수정기능
	@RequestMapping("/contentupdate")
	public String contentupdate(HttpSession session, Board board) {
		
		String id = (String)session.getAttribute("loginOK");
		
		// 로그인 세션이 있는 경우
		if(id!=null && !id.equals("")) {
			System.out.println(board);
			boardService.updateBoard(board);
			return "redirect:/board";			
		}
		// 로그인 세션이 없는 경우
		else 
			return "redirect:/login";
	}
	
	// 게시판 내용 업데이트
		@RequestMapping("/update")
		public String update(@RequestParam("id")String auth, @RequestParam("seq")Integer seq, HttpSession session, ModelMap model) {
			
			String id = (String)session.getAttribute("loginOK");
			
			// 로그인 세션이 있는 경우
			if(id!=null && !id.equals("")) {
				Board board = new Board();
				board.setSeq(seq);
				board.setId(auth);
				board = boardService.getBoard(board);
				model.addAttribute(board);
				return "board/update";			
			}
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
	
	// 아이디 중복체크 
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {

		return userService.userIdCheck(id);
	}

}