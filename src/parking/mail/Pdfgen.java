package parking.mail;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import com.itextpdf.text.*;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import java.nio.file.FileSystems;
import java.nio.file.Path;


public class Pdfgen {

	private static void generateQRCodeImage(String text, int width, int height, String filePath)
            throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        Path path = FileSystems.getDefault().getPath(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
    }
	
public static void sendMain(String[] array) throws URISyntaxException, IOException, DocumentException {
	String to = array[3];
	String from = "parkingdoneeasy@gmail.com";
	String host = "smtp.gmail.com";
	String QR_CODE_IMAGE_PATH = "C:/Users/Rahul/Documents/My Games/qr.png";
    // Get system properties
	try {
        generateQRCodeImage(array[0], 350, 350, QR_CODE_IMAGE_PATH);
    } catch (WriterException e) {
        System.out.println("Could not generate QR Code, WriterException :: " + e.getMessage());
    } catch (IOException e) {
        System.out.println("Could not generate QR Code, IOException :: " + e.getMessage());
    }
    Properties properties = System.getProperties();
    
    // Setup mail server
    properties.setProperty("mail.smtp.host", host);
    properties.setProperty("mail.defaultEncoding","UTF-8");
    properties.setProperty("mail.smtp.auth","true");
    properties.setProperty("mail.user","parkingdoneeasy@gmail.com");
    properties.setProperty("mail.password","parkerparking");
    //properties.setProperty("mail.smtp.starttls.required","true");
    //properties.setProperty("mail.smtp.starttls.enable","true");
    properties.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    properties.setProperty("mail.smtp.socketFactory.fallback","false");
    properties.setProperty("mail.smtp.port","465");
    properties.setProperty("mail.smtp.socketFactory.port","465");
    // Get the default Session object.
    Session session = Session.getDefaultInstance(properties);

    try {
       // Create a default MimeMessage object.
       MimeMessage message = new MimeMessage(session);

       // Set From: header field of the header.
       message.setFrom(new InternetAddress(from));

       // Set To: header field of the header.
       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));

       // Set Subject: header field
       message.setSubject("Hello! " + array[2]);

       // Create the message part 
       BodyPart messageBodyPart = new MimeBodyPart();

       // Fill the message
       messageBodyPart.setText("Your booking has been confirmed at "+array[1]+"\nKindly show the attached QR code image to the parking attendant while entering inside the parking lot");
       
       // Create a multipar message
       Multipart multipart = new MimeMultipart();

       // Set text message part
       multipart.addBodyPart(messageBodyPart);

       // Part two is attachment
       messageBodyPart = new MimeBodyPart();
       String filename = "C:/Users/Rahul/Documents/My Games/qr.png";
       DataSource source = new FileDataSource(filename);
       messageBodyPart.setDataHandler(new DataHandler(source));
       messageBodyPart.setFileName(filename);
       multipart.addBodyPart(messageBodyPart);

       // Send the complete message parts
       message.setContent(multipart );

       // Send message
       Transport.send(message,"parkingdoneeasy@gmail.com","parkerparking");
       System.out.println("Sent message successfully....");
    } catch (MessagingException mex) {
       mex.printStackTrace();
    }
}
}
