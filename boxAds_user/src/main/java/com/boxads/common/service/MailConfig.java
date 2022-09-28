package com.boxads.common.service;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource(value = "classpath:/mail/mail.properties")
public class MailConfig {

}
