import java.net.MulticastSocket;
import java.net.DatagramPacket;
import java.io.IOException;
import java.net.InetAddress;


public class receiveMulticast {
	
	public static void main(String []args) throws Exception {
		
		DatagramPacket p;
		InetAddress group = InetAddress.getByName("224.0.0.1");
		MulticastSocket s = new MulticastSocket(7654);
		s.joinGroup(group);
		try{
			do{
				p = new DatagramPacket(new byte[512],512); 		
				s.receive(p); 
				System.out.println("paquet reçu de :"+ p.getAddress()+ 
						   " \n port "+            p.getPort()+ 
						"\n taille" +          p.getLength()+"\n"); 
				byte[] array = p.getData(); 
				System.out.println(new String(p.getData())+"\n");
			}while(true);
			//s.leaveGroup(group); 
			//System.out.println("\n terminé");
		}catch(Exception e){

			e.printStackTrace();
		}
	}
}
