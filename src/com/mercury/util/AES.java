package com.mercury.util;

import java.security.*;

import javax.crypto.*;

public class AES {
  
	private static AES instance;
	
    private KeyGenerator keygen;    
    private SecretKey deskey;    
    private Cipher c;  
    private byte[] cipherByte;
    
    private AES() {
    	try {
	    	Security.addProvider(new com.sun.crypto.provider.SunJCE());  
	        keygen = KeyGenerator.getInstance("AES");  
	        deskey = keygen.generateKey();   
	        c = Cipher.getInstance("AES"); 
    	} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}  catch (NoSuchPaddingException e) {
			e.printStackTrace();
		}
    }
    
    public static AES getInstance(){
		if(instance == null){
			synchronized(Adapter.class){
				if(instance == null)
					instance = new AES();
			}
		}
		return instance;
	}
    
    /** 
     * Encryption 
     *  
     * @param str 
     * @return 
     * @throws InvalidKeyException 
     * @throws IllegalBlockSizeException 
     * @throws BadPaddingException 
     */  
    public byte[] Encrytor(String str) {    
    	try {
			c.init(Cipher.ENCRYPT_MODE, deskey);
			byte[] src = str.getBytes();    
	    	cipherByte = c.doFinal(src); 
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		}  catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
    	return cipherByte;  
    } 
    
    /** 
     * Decryption
     *  
     * @param buff 
     * @return 
     * @throws InvalidKeyException 
     * @throws IllegalBlockSizeException 
     * @throws BadPaddingException 
     */ 
    public byte[] Decryptor(byte[] buff) {  
    	try {
	    	c.init(Cipher.DECRYPT_MODE, deskey);  
	    	cipherByte = c.doFinal(buff);  
    	} catch (InvalidKeyException e) {
			e.printStackTrace();
		}  catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
    	return cipherByte;  
    } 
    
//    /** 
//     * @param args 
//     * @throws NoSuchPaddingException  
//     * @throws NoSuchAlgorithmException  
//     * @throws BadPaddingException  
//     * @throws IllegalBlockSizeException  
//     * @throws InvalidKeyException  
//     */  
//    public static void main(String[] args) throws Exception {  
//    	AES aes = new AES();  
//        String msg ="www.suning.com/index.jsp";  
//        byte[] encontent = aes.Encrytor(msg);  
//        byte[] decontent = aes.Decryptor(encontent);  
//        System.out.println("Plaintext:" + msg);  
//        System.out.println("Encryted:" + new String(encontent));  
//        System.out.println("Decrypted:" + new String(decontent));  
//    }
}
