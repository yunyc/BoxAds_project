package com.boxads.etc.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/etc")
public class EtcController {
	
	private static final Logger log = LoggerFactory.getLogger(EtcController.class);

    @RequestMapping(value = "/company_about")
    public String company() throws Exception {
    	return "about/company_about";
    }
    @RequestMapping(value = "/service_intro")
    public String service() throws Exception {
    	return "about/service_intro";
    }  
    @RequestMapping(value = "/guide_box")
    public String guideBox() throws Exception {
    	return "guide/guide_box";
    }  
    @RequestMapping(value = "/guide_ads")
    public String guideAds() throws Exception {
    	return "guide/guide_ads";
    }  
}
