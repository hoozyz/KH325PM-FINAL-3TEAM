package com.bc.heal.park.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Park;


public interface ParkService {
	Park findByNo(int no);
	List<Park> getParkList(PageInfo pageInfo, Map<String, String> param);
	int getParkCount(Map<String, String> param);

}
