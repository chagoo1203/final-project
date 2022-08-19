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
public class Chat {
	private String text;
	private String date;
	private String msgWriter;	
	private String readStatus;
	public Chat(String text, String date, String msgWriter) {
		super();
		this.text = text;
		this.date = date;
		this.msgWriter = msgWriter;
	}
	
}
