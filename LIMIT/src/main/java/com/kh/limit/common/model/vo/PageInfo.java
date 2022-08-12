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
public class PageInfo {

	private int listCount;//전체 리스트의 갯수
	private int currentPage; //현재 페이지
	private int pageLimit; //페이징 바의 한줄에 있는 최대 갯수
	private int boardLimit; //한페이지에 리스트가 몇개까지 들어갈수잇는지
	
	private int maxPage;
	private int startPage;
	private int endPage;
	
	
	
	
}
