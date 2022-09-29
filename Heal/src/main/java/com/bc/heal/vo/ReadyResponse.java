package com.bc.heal.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReadyResponse {
	private String tid;
	private String next_redirect_pc_url;
	private String partner_order_id;
}
