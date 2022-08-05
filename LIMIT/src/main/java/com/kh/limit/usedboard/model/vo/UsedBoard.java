package com.kh.limit.usedboard.model.vo;

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

public class UsedBoard {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String status;
	private int boardCount;
	private String careateDate;
	private String productTypeName;
	private String brandName;
	private String boardWriter;
	private int boardProductNo;
	private String modifyDate;
	private String collectionName;	
	private int usedPrice;
}
