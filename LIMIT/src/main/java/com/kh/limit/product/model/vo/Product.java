package com.kh.limit.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Product {
	
	private int productNo;
	private String productName;
	private String productContent;
	private int likes;
	private int count;
	private String status;
	private String createDate;
	private String modifyDate;
	private String productWriter;
	private int tradeCount;
	private String productTypeName;
	private String brandName;
	private String releaseDate;
	private String modelNo;
	private String collectionName;
	private String releasePrice;
	private String resellPrice;
	
	private String titleImg;

}
