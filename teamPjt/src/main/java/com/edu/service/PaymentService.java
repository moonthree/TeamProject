package com.edu.service;

import java.io.IOException;

public interface PaymentService {
	String getToken() throws IOException;
	
	public void paymentCancel(String access_token, String imp_uid, int amount, String reason) throws IOException;
	
}
