package com.bc.heal.festival.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Festival;

public interface FestivalService {
	Festival findByNo(int no);
	List<Festival> getFestivalList(PageInfo pageInfo, Map<String, String> param);
	int getFestivalCount(Map<String, String> param);
	
}
