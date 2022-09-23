package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Camp {
	private int no;
	private String name;
	private String lineintro;
	private String aria;
	private String category;
	private String addr;
	private String lat;
	private String lng;
	private int price;
	private String phone;
	private String homepage;
	private String sub;
	private String theme;
	private String image;
}
