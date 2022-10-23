package com.bc.heal.hotel.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Hotel;

public interface HotelService {
	Hotel findByNo(int no);
	List<Hotel> getHotelList(PageInfo pageInfo, Map<String, String> param);
	int getHotelCount(Map<String, String> param);
	List<Hotel> getNearHotelList(String addr);
	
	void updateHotel(String no1, String no2, String no3, String no4);
	
}
