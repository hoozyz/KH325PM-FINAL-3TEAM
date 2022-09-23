package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Air {
	private int no;
	private String startsta;
	private String endsta;
	private int price;
	private String starttime;
	private String endtime;
	private String flight;
	private String airline;
}
