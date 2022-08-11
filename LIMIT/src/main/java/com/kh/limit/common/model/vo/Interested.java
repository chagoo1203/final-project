package com.kh.limit.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter 
@Setter
@NoArgsConstructor
public class Interested {
	private String userId; 
	private int productNo; 
	private int usedNo;
	public Interested(String userId, int usedNo) {
		super();
		this.userId = userId;
		this.usedNo = usedNo;
	} 
	
}
