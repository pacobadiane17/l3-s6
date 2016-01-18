


import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.io.IOException;
public class UDPreceive {
	
	public static void main(String []args) throws IOException{
		
		DatagramSocket s; 
		DatagramPacket p;
		int i;
		//InetAddress dst = InetAddress.getByName("Pape");
		s = new DatagramSocket(5000); 
		p = new DatagramPacket(new byte[512],512); 
		s.receive(p); 
		System.out.println("paquet reçu de :"+ p.getAddress()+ 
		                   "port "+            p.getPort()+ 
		                "taille" +          p.getLength()); 
		byte[] array = p.getData(); 
		for(i=0;i<p.getLength();i++) 
			System.out.println("array["+i+"] = "+array[i]); 
		s.close(); 
		System.out.println("terminé");
		
	}
 
}
