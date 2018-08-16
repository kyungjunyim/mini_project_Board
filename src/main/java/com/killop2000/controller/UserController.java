package com.killop2000.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.killop2000.domain.UserVO;
import com.killop2000.dto.LoginDTO;
import com.killop2000.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Inject
	private UserService userService;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession session, Model model) throws Exception {
		UserVO userVO = userService.login(loginDTO);
		
		if(userVO == null) {
			return;
		}
		
		model.addAttribute("userVO", userVO);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public void logout(LoginDTO loginDTO, HttpSession session, Model model) throws Exception {
		session.invalidate();
	}	
	

}
