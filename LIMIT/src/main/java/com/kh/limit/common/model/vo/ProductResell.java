package com.kh.limit.common.model.vo;

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
public class ProductResell {

	private int productNo;			//"PRODUCT_NO"	NUMBER		NOT NULL,
	private int productAmount;		//"PRODUCT_AMOUNT"	NUMBER		NOT NULL,
	private String productSize;		//"PRODUCT_SIZE"	VARCHAR2(30)		NOT NULL
}
