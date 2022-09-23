package com.bc.heal.hotel.service;

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
	
}
