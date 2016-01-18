
import java.net.MulticastSocket;
import java.net.DatagramPacket;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Scanner;


public class sendMulticast implements Runnable {

	
 	public sendMulticast(){
			
	}

	
	public void run (){
		
		try{
			DatagramPacket packet;
			Scanner scanner = new Scanner(System.in);
			int ttl = 512;
			String message;
			InetAddress group = InetAddress.getByName("224.0.0.1");
			int port = 7654 ; 
			MulticastSocket s = new MulticastSocket(7654);

			while(true){
				message=scanner.nextLine();
				packet = new DatagramPacket (message.getBytes(), message.length(), group, port);
				s.send(packet,(byte)ttl); 
				s.close(); 
			}
		}catch(Exception e ){
			System.out.println(" le message d'erreur");
			e.printStackTrace();
		}

	}

}
