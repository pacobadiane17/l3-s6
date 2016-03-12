
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Scanner;
public class sendUDP {

	public static void main( String [] args ) throws IOException{

		DatagramPacket p; 
		DatagramSocket s; 
		String message;
		Scanner scanner = new Scanner(System.in);
		int dst =5000;
		while(true){
			message= scanner.nextLine();
			InetAddress adresse = InetAddress.getByName("172.18.12.45"); 
			p = new DatagramPacket(message.getBytes(), message.length(), adresse, dst); 
			s = new DatagramSocket(); 
			s.send(p); 
			s.close(); 
		}
	}

}
