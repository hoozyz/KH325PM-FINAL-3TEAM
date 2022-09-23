package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int no;
	private String title;
	private String cont;
	private int revstar;
	private int revlike;
	private String createdate;
	private int memberno;
	private int hotelno;
	private int campno;
	private int festivalno;
	private int foodno;
	private int parkno;
}
