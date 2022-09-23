package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Festival {
	private int no;
	private String name;
	private String place;
	private String startdate;
	private String enddate;
	private String cont;
	private String phone;
	private String homepage;
	private String addr;
	private String lat;
	private String lng;
}
