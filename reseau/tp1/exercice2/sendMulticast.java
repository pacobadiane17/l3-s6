import java.net.MulticastSocket;
import java.net.DatagramPacket;
import java.io.Exception;
import java.net.InetAddress;
import java.util.Scanner;


public class sendMulticast {
	
	public static void main( String [] args ) throws Exception{

		DatagramPacket packet;
		Scanner scanner = new Scanner(System.in);
		int ttl = 512;
		String message;

		while(true){
			message=scanner.nextLine();
			MulticastSocket s = new MulticastSocket(7654); 
			InetAddress group = InetAddress.getByName("224.0.0.1");
			int port = 7654 ; 
			packet = new DatagramPacket (message.getBytes(), message.length(), group, port);
			s.send(packet,(byte)ttl); 
			s.close(); 
		}
	}
}
