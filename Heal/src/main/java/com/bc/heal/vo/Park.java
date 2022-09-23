package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Park {
	private int no;
	private String name;
	private String category;
	private String addr;
	private String lat;
	private String lng;
	private String sport;
	private String phone;
}
