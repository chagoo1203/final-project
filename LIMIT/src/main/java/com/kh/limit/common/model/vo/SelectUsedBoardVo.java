package com.kh.limit.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SelectUsedBoardVo {
	private String productTypeName;
	private String brandName;
	private String collectionName;
	private int startRow;
	private int endRow;
}
