package com.boxads.common.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/common")
public class CommonController {

	private static final Logger log = LoggerFactory.getLogger(CommonController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;	
	
	
}
