package com.bc.heal.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int no;
	private String id;
	private String title;
	private String cont;
	private int revstar;
	private int revlike;
	private Date createdate;
	private int memberno;
	private int hotelno;
	private int campno;
	private int festivalno;
	private int foodno;
	private int parkno;
}
