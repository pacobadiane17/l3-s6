import java.io.*;
import java.net.*;
import java.util.*;

public class requeteDNS {

DatagramPacket paquet;
DatagramSocket socket;
InetAddress destinataire;


	public void senderDnsQuery(String message){

		 try {
		
				byte [] msg =message.getBytes();
				destinataire = InetAddress.getByName("172.18.12.8");
				
				paquet = new DatagramPacket(msg, msg.length,destinataire,53);
				
				socket = new DatagramSocket();
				
				socket.send(paquet);	

			}catch(Exception e){

				System.out.println(" erreur "+e.getMessage()+"\n");
				
			}
	}

	public void receiveDnsQuery(){

		try {
			paquet = new DatagramPacket(new byte[512],512);

			socket.receive(paquet);

			byte [] receiveMessage = paquet.getData(); 

			// reponse du serveur dns
			System.out.println(" serveur :"+paquet.getAddress()+"\n");

			System.out.println(receiveMessage+"\n");

		}catch(Exception e){

			System.out.println(" erreur "+e.getMessage()+"\n");
		}


	}


	public static  void main(String[] args) {

		String serveur="www.google.fr";
		
		senderDnsQuery(serveur);
		
		receiveDnsQuery();
		
	}


}
