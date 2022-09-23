package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Food {
	private int no;
	private String name;
	private String addr;
	private String type;
	private String main;
	private String phone;
	private String lat;
	private String lng;
}
