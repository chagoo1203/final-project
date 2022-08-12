package com.kh.limit.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Notice {
	
	private int noticeNo;			//NOTICE_NO	NUMBER
	private String noticeTitle;		//NOTICE_TITLE	VARCHAR2(50 BYTE)
	private String noticeContent;		//NOTICE_CONTENT	VARCHAR2(4000 BYTE)
	private int noticeCount;		//NOTICE_COUNT	NUMBER
	private String createDate;		//CREATE_DATE	DATE
	private String modifyDate;		//MODIFY_DATE	DATE
	private String status;			//STATUS	VARCHAR2(2 BYTE)
	private String noticeWriter;	//NOTICE_WRITER	VARCHAR2(40 BYTE)
	private String noticeType;		//NOTICE_TYPE	VARCHAR2(2 BYTE)
	
}
