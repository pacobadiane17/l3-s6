
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.io.IOException;

public class senUDP {

	public void main( String [] args ) throws IOException{

		DatagramPacket p; 
		DatagramSocket s; 
		
		byte [] adresse = new byte[4] ;
		/*adresse[0] =172;
		adresse[1] =18;
		adresse[2] =12;
		adresse[3] =102;*/
		int port = 1024 ;
		int dst =2000;
		byte array[] = new byte[2]; 
		Array[0] = 1; 
		Array[1] = 2; 
		InetAddress dst = InetAddress.getByAddresse("localhost"); 
		p = new DatagramPacket p(array, 2, dst, port); 
		s = new DatagramSocket(); 
		s.send(p); 
		s.close(); 

	}

}
