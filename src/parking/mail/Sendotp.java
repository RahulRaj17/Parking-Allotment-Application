package parking.mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Sendotp {
	public static boolean sendmail(String email,int otp) {
		
		boolean status=false;
		final String username="";
		final String password="";
		Properties prop=new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable",true);
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port","587");
		Session session=Session.getInstance(prop,
				new javax.mail.Authenticator() {
			@override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
	});
		try {
			Message message =new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			String to = email;
			InternetAddress[] parse = InternetAddress.parse(to , true);
			message.setRecipients(Message.RecipientType.TO,parse);
			MimeBodyPart textpart=new MimeBodyPart();
			Multipart multipart=new MimeMultipart();
			String finaltext="OTP for Login is "+otp;
			textpart.setText(finaltext);
			message.setSubject("OTP for verification");
			multipart.addBodyPart(textpart);
			message.setContent(multipart);
			Transport.send(message);
			status=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
		
	}
}
