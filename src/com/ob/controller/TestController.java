package com.ob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/test")
public class TestController {

	@RequestMapping
	public String test() {
		return "register";
	}
}
