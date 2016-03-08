
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.io.*;
import java.net.InetAddress;

public class UDPreceive {
	
	public static void main(String []args) throws Exception{
		
		DatagramSocket s; 
		DatagramPacket p;
		int i;
		//InetAddress dst = InetAddress.getByName("172.18.12.45");
		s = new DatagramSocket(5000); 
		p = new DatagramPacket(new byte[512],512); 
		while(true){		
			s.receive(p); 
			System.out.println("paquet reçu de :"+ p.getAddress()+ 
				           " \n port "+            p.getPort()+ 
				        " \n taille" +          p.getLength()); 
	 
			System.out.println(new String(p.getData())+" \n");		
			//s.close(); 
			System.out.println("terminé");
	 	}	
	}
 
}
