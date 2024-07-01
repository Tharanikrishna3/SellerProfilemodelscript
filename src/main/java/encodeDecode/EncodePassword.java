package encodeDecode;

import org.apache.commons.codec.binary.Base64;
import org.junit.Test;

public class EncodePassword {
	
	//@Test
	public void encodeString() {
		String stringToEncode = "";
		byte[] encodedString = Base64.encodeBase64(stringToEncode.getBytes());
		System.out.println("encodedString: "+new String (encodedString));
	}
	
	public String decodeString(){
		String stringToDecode = "V2ViSWJtSXRlbGxpNzY4QAo=";
		byte[] decodedString = Base64.decodeBase64(stringToDecode.getBytes());
		return new String(decodedString);
	}
	

}
