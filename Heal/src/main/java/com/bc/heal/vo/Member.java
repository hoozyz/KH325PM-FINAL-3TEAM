package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String dong; // 거주지 (동)
}
