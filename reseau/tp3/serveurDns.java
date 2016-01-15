import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Scanner;


public class serveurDns{

	public static  void main(String [] args)throws IOException{
	

		DatagramPacket messageSender;
		DatagramPacket messageReceiver;
		Scanner scanner = new Scanner(System.in);
		int ttl = 512;
		String requete;
		
	
			requete=scanner.nextLine();
			DatagramSocket s = new DatagramSocket(); 
			InetAddress adresse = InetAddress.getByName("172.18.12.8");
			int port = 53 ; 
			messageSender = new DatagramPacket(requete.getBytes(), requete.length(), adresse, port);
			s.send(messageSender);
			messageReceiver = new DatagramPacket(new byte[512], 512);
			s.receive(messageReceiver);

			System.out.println(new String(messageReceiver.getData()));
		
			s.close(); 
	

	}
}
