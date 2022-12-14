package com.kh.limit.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@NoArgsConstructor
@ToString
public class Trade {
	private int tradeNo; 
	private String recevierName; 
	private String recevierPhone; 
	private String recevierAddress; 
	private String orderComment; 
	private String payment; 
	private String purchaseDate; 
	private String status; 
	private String delivery; 
	private int productNo; 
	private String buyer; 
	private String seller; 
	private int resellNo; 
	private String productName;
	private String productContent;
	
}
