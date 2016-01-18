
public class chat{

	public static void main(String [] args){
	
		receiveMulticast receive = new receiveMulticast();
		sendMulticast sender = new sendMulticast();

		Thread threceive = new Thread(receive);
		Thread thsender = new Thread(sender);
		

			thsender.start();
			threceive.start();
			
			try{
				thsender.join();
				threceive.join();

			} catch(InterruptedException e){

				e.printStackTrace();
			}
			



	}


}
