package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Like {
	private int no;
	private int memberno;
	private int hotelno;
	private int campno;
	private int festivalno;
	private int foodno;
	private int parkno;
}
