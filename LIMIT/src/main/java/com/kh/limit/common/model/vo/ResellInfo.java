package com.kh.limit.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter 
@Setter
@NoArgsConstructor
public class ResellInfo {
	private int resellNo; 
	private int productNo; 
	private String seller; 
	private String prodcutSize; 
	private int productAmount; 
	private String resellWantDate; // 판매예약날짜
	private String resellDate; // 판매등록날짜
	private String resellPrice; 
}	
