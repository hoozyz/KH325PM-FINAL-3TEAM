package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Photo {
	private int no;
	private String id;
	private String title;
	private String cont;
	private int readcount;
	private String category;
	private String originalfile;
	private String renamefile;
	private String createdate;
	private String modifydate;
	private int memberno;
}
