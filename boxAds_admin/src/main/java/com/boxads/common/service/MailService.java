package com.boxads.common.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;


@Service
public class MailService {
	private JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	
	@Resource 
	private String mailPath;
	
	@Autowired 
	private Environment mailConfig;
	
	@Async
	public void sendMail(Map<String, String> data, String type) throws IOException, MessagingException {	
		
		Properties prop = System.getProperties();		
        prop.put("mail.smtp.starttls.enable", mailConfig.getProperty("mail.smtp.starttls.enable"));
        prop.put("mail.smtp.auth", mailConfig.getProperty("mail.smtp.auth"));
        prop.put("mail.smtp.host", mailConfig.getProperty("mail.smtp.host"));
        prop.put("mail.smtp.port", mailConfig.getProperty("mail.smtp.port"));
                
        mailSender.setJavaMailProperties(prop);		
        mailSender.setUsername(mailConfig.getProperty("mail.username"));
		mailSender.setPassword(mailConfig.getProperty("mail.password"));		
	
		String url = mailConfig.getProperty("url");
		
		MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

        /* -------------------------------------------------------------------------------- */
				
		SimpleDateFormat sf = new SimpleDateFormat ("yyyy??? MM??? dd???");
		SimpleDateFormat sf2 = new SimpleDateFormat ("yyyy.MM.dd HH:mm");
		SimpleDateFormat sf3 = new SimpleDateFormat ("yyyy-MM-dd"); 
		Date time = new Date();
		Calendar cal = new GregorianCalendar();
		
		File input = null;
		Document doc = null;
		String[] iter = null;
        
        messageHelper.setFrom("mail.test.nthony@gmail.com");// ?????? ??? ??????     
        messageHelper.setTo(data.get("id").toString());     // ???????????? ?????????        	
        
        //mailPath = "C:\\anthony\\191011_boxAds\\work\\boxAds\\src\\main\\webapp\\resources\\mailForm";
        //mailPath = "C:\\Users\\user21\\git\\boxAds_admin\\src\\main\\webapp\\resources\\mailForm"    //  ;
        
        // html ????????? ??????
        input = new File(mailPath+"/"+type+".html"); 
        doc = Jsoup.parse(input, "UTF-8", url);
                
        switch(type) {
        case "change" : // ???????????? ?????? ??????
        	messageHelper.setSubject("???????????? ?????? ?????? ?????????????????????.");
	        
        	url += "/login";
	        doc.select("#btn").attr("href", url);
	        doc.select("#name").html(data.get("name"));
	        doc.select("#id").html(data.get("id"));
	        doc.select("#loginDate").html(data.get("loginDate"));
        	break;
//        case "mail_certify" : // ???????????? ?????? ??????
//        	messageHelper.setSubject("????????????(BoxAds) ???????????? ???????????????.");
//	        data.put("pwdDate", sf2.format(time.getTime()));
//	        iter = "#name,#pwd,#pwdDate".split(",");
//        	break;
        case "change_finish" : // ???????????? ?????? ??????
        	messageHelper.setSubject("???????????? ?????? ?????? ?????????????????????.");
        	data.put("humunDate", sf.format(time.getTime()));
        	
        	url += "/login";
	        doc.select("#btn").attr("href", url);
	        doc.select("#name").html(data.get("name"));
	        doc.select("#humunDate").html(data.get("humunDate"));
        	break;
        	
        case "biz_confirm" : // ???????????? ?????? ??????
        	messageHelper.setSubject("???????????? ????????? ????????? ?????????????????????.");
        	data.put("confirmDate", sf2.format(time.getTime()));
        	
        	url += "/main";
	        doc.select("#btn").attr("href", url);
	        doc.select("#name").html(data.get("name"));
	        doc.select("#confirmDate").html(data.get("confirmDate"));
        	break;
        	
        case "mail_reset" : // ???????????? ?????????
        	messageHelper.setSubject("????????????(BoxAds) ???????????? ????????? ???????????????.");
	        
        	url += "/login/reset?authkey="+data.get("authkey");
	        doc.select("#btn").attr("href", url);
	        doc.select("#name").html(data.get("name"));
        	break;
        }
        
        

        // src ????????? ?????? ?????? ???????????? ?????? ??????
        Elements elems = doc.select("[src]");
        for( Element elem : elems ){
        	if( !elem.attr("src").equals(elem.attr("abs:src")) ){
        		elem.attr("src", elem.attr("abs:src"));
        	}
        }
        
        
        if(iter != null && iter.length > 0) { mailSetting(doc, iter, data); }
        
        messageHelper.setText(doc.html(), true);        		
        mailSender.send(message);
}

	/* mailForm??? id??? class??? key?????? ????????? ?????? key data??? ?????? ?????? display none ?????? */
	public void mailSetting(Document doc, String[] iter, Map<String, String> data) {	
		for (String selector : iter) {
			if(selector.substring(0,1).equals("#")) {
				String s = selector.replace("#", "");
				Element ele = doc.getElementById(s);				
				if(data.get(s) != null && !"".equals(data.get(s)) && ele != null) {
					ele.html(data.get(s));
				} else {
					ele.parent().html("");
				}
			} else if(selector.substring(0,1).equals(".")){
				String s = selector.replace(".", "");
				Elements eles = doc.select(selector);
				if(data.get(s) != null && !"".equals(data.get(s)) && eles != null) {
					eles.html(data.get(s));
				} else {
					eles.parents().html("");
				}
			}
		}	
	} 
}