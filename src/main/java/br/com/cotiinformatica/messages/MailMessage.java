package br.com.cotiinformatica.messages;

import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

//classe responsavel pelo envio de emails
public class MailMessage {

	private static final String CONTA = "cotiaulasnoreply@gmail.com";
	private static final String SENHA = "@Admin123456";
	private static final String SMTP = "smtp.gmail.com";
	private static final Integer PORTA = 587;

	public static void sendMessage(final String to, final String subject, final String body) throws Exception {

		JavaMailSenderImpl mailSenderImpl = new JavaMailSenderImpl();

		mailSenderImpl.setHost(SMTP);
		mailSenderImpl.setPort(PORTA);
		mailSenderImpl.setUsername(CONTA);
		mailSenderImpl.setPassword(SENHA);

		Properties properties = new Properties();

		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.transport.protocol", "smtp");
		properties.put("mail.debug", "true");

		mailSenderImpl.setJavaMailProperties(properties);

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				message.setTo(to);
				message.setFrom(CONTA);
				message.setSubject(subject);
				message.setText(body);

			}

		};

		mailSenderImpl.send(preparator);
	}
}