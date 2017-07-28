package com.akcord.in.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.akcord.group.service.GroupService;
import com.akcord.in.service.InService;

@Controller

@RequestMapping("/in")
public class InController {
	@Autowired
	private InService inService;
	
}
