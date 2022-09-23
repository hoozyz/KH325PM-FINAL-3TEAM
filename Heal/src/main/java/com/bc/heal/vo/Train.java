package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Train {
	private int no;
	private String startsta;
	private String endsta;
	private String startlat;
	private String startlng;
	private String endlat;
	private String endlng;
	private String starttime;
	private String endtime;
	private String wastetime;
	private int specialprice;
	private int generalprice;
	private String trainclass;
	private String railname;
}
