package com.kh.limit.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@NoArgsConstructor
@ToString
public class Attachment {		
    private int fileNo; // FILE_NO NUMBER PRIMARY KEY,
    private String originName; // ORIGIN_NAME VARCHAR2(255) NOT NULL,
    private String changeName; // CHANGE_NAME VARCHAR2(255) NOT NULL,
    private String filePath; // FILE_PATH VARCHAR2(1000) NOT NULL,
    private int fileLevel; // FILE_LEVEL NUMBER NOT NULL,
    private String uploadDate;
    private int refNo;
    private int typeNo;
    private String status;
	
    public Attachment(String originName, String changeName, String filePath, int fileLevel) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}	 
    
}
