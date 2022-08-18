package com.kh.limit.style.model.vo;

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
public class Reply {
	private int replyNo;
	private int refSno;
	private String replyWriter;
	private String replyContent;
	private String replyDate;
	private String status;
	private String nickname;
}
