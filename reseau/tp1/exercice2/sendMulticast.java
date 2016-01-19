import java.net.MulticastSocket;
import java.net.DatagramPacket;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Scanner;


public class sendMulticast {
	
	public static void main( String [] args ) throws Exception{

		DatagramPacket packet;
		Scanner scanner = new Scanner(System.in);
		int ttl = 512;
		String message;
			int port = 7654 ;
			MulticastSocket s = new MulticastSocket(port); 
			InetAddress group = InetAddress.getByName("224.0.0.1");

			while(true){
				message=scanner.nextLine();
			
		
				packet = new DatagramPacket (message.getBytes(), message.length(), group, port);
				s.send(packet,(byte)ttl); 
				s.close(); 
		      }
	}
}
