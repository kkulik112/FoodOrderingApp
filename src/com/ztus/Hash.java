package com.ztus;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	
	public static String hashPassword(String password) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		StringBuilder sb = new StringBuilder();
        for(int i = 0; i < digest.length; i++){        
            sb.append(Integer.toString((digest[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
        }
	
}
