package com.kh.limit.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor
public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String gender;
	private String birthDate;
	private String phone;
	private String address;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private String nickName;
	public Member(String userId, String userName, String email, String gender, String birthDate, String phone,
			String nickName) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.birthDate = birthDate;
		this.phone = phone;
		this.nickName = nickName;
	}
	
}
