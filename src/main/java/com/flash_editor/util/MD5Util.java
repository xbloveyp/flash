package com.flash_editor.util;

import sun.misc.BASE64Encoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	public static String encode(String message){
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte b[] = md.digest(message.getBytes());
			return new BASE64Encoder().encode(b);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
}
