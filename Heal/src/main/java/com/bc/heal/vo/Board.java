package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int no;
	private String title;
	private String cont;
	private int readcount;
	private String createdate;
	private String modifydate;
	private int memberno;
}
