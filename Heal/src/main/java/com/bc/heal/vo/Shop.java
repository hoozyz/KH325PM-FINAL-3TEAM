package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Shop {
	private String id;
	private String title;
	private String link;
	private String image;
	private int price;
	private String mall;
	private String maker;
	private String cate1;
	private String cate2;
	private String cate3;
	private String cate4;
}
