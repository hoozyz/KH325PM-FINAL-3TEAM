package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hotel {
	private int no;
	private String phone;
	private String addr;
	private String name;
	private int price;
	private String lat;
	private String lng;
}
