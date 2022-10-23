package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	private int no;
	private String id;
	private String title;
	private String cont;
	private String createdate;
	private String modifydate;
	private int memberno;
	private int photono;
}
