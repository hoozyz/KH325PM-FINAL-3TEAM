package com.bc.heal.hotel.service;

import java.util.HashMap;
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
		
		Map<String, String> map = new HashMap<String, String>();
		String keyword = param.get("keyword");
		String addr = param.get("addr");
		String price = param.get("price");
		String price2 = param.get("price2");
		
		if (keyword != null && keyword.isEmpty()==false) {
			map.put("keyword", keyword);
		}
		if (addr != null && addr.isEmpty()==false) {
			map.put("addr", addr);
		}
		if (price != null && price.isEmpty()==false ) {
			map.put("price", price);
		}
		if (price2 != null && price2.isEmpty()==false) {
			map.put("price2", price2);
		}
		
		return mapper.selectHotelCount(map);
	}

	@Override
	public List<Hotel> getHotelList(com.bc.heal.common.util.PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		Map<String, String> map = new HashMap<String, String>();
		String keyword = param.get("keyword");
		String addr = param.get("addr");
		String price = param.get("price");
		String price2 = param.get("price2");
		
		if (keyword != null && keyword.isEmpty()==false) {
			map.put("keyword", keyword);
		}
		if (addr != null && addr.isEmpty()==false) {
			map.put("addr", addr);
		}
		if (price != null && price.isEmpty()==false ) {
			map.put("price", price);
		}
		if (price2 != null && price2.isEmpty()==false) {
			map.put("price2", price2);
		}
		
		System.out.println("서비스 : "+map);
		
		return mapper.selectHotelList(rowBounds, map);
	}
	
	@Override
	public List<Hotel> getNearHotelList(String addr) {
		return mapper.selectNearHotelList(addr);
	}

	@Override
	public void updateHotel(String no1, String no2, String no3, String no4) {
		mapper.updateHotel(no1,no2,no3,no4);
	}
	
	
}