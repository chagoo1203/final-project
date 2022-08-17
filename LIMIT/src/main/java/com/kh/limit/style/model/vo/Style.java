package com.kh.limit.style.model.vo;

import java.util.ArrayList;

import com.kh.limit.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class Style {
	private int styleNo; // STYLE_NO	NUMBER
	private String styleTag; // STYLE_TAG	VARCHAR2(1000 BYTE)
	private String styleContent; //STYLE_CONTENT	VARCHAR2(1000 BYTE)
	private String status; // STATUS	VARCHAR2(1 BYTE)
	private int count; // COUNT	NUMBER
	private int like; // LIKE	NUMBER
	private String createDate; // CREATE_DATE	DATE
	private String modifyDate; // MODIFY_DATE	DATE
	private String styleWriter; // STYLE_WRITER	VARCHAR2(40 BYTE)
	private String titleImg;
	private ArrayList<Product> tag; 
}
