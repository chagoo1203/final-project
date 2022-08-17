package com.kh.limit.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@NoArgsConstructor
@ToString
public class ResellInfo {
	private int resellNo; 
	private int productNo; 
	private String seller; 
	private String productSize; 
	private int productAmount; 
	private String resellWantDate; // 판매예약날짜
	private String resellDate; // 판매등록날짜
	private String resellPrice; 
}	
