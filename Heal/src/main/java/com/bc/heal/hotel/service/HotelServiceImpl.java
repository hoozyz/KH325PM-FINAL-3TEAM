package com.bc.heal.hotel.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.hotel.mapper.HotelMapper;
import com.bc.heal.vo.Hotel;

@Service
public class HotelServiceImpl implements HotelService{

	@Autowired
	private HotelMapper mapper;
	
	@Override
	public Hotel findByNo(int no) {
		return mapper.selectHotelByNo(no);
	}
	
	@Override
	public int getHotelCount(Map<String, String> param) {
		return mapper.selectHotelCount(param);
	}

	@Override
	public List<Hotel> getHotelList(com.bc.heal.common.util.PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectHotelList(rowBounds, param);
	}
	
}