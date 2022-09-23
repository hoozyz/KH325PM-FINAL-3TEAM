package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reserve {
	private int no;
	private String paydate;
	private String reservedate;
	private String starttime;
	private int count;
	private int price;
	private int memberno;
	private int hotelno;
	private int campno;
	private int airno;
	private int busno;
	private int trainno;
}
