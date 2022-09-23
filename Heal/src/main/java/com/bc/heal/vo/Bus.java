package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bus {
	private int no;
	private String startsta;
	private String endsta;
	private String startlat;
	private String startlng;
	private String endlat;
	private String endlng;
	private String wastetime;
	private String schedule;
	private String nightschedule;
	private int normalprice;
	private int nightprice;
}
