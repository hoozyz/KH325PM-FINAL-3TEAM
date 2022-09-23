package com.bc.heal.park.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.park.mapper.ParkMapper;
import com.bc.heal.vo.Park;

@Service
public class ParkServiceImpl implements ParkService{

	@Autowired
	private ParkMapper mapper;
	
	@Override
	public Park findByNo(int no) {
		return mapper.selectByNo(no);
	}
	
}
