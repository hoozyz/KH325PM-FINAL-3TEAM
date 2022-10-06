package com.bc.heal.camp.service;

import java.util.List;
import java.util.Map;


import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Camp;


public interface CampService {
	Camp findByNo(int no);
	
	int getCampCount(Map<String, String> param);
	
	List<Camp> getCampList(PageInfo pageInfo, Map<String, String> param);
	

	
}