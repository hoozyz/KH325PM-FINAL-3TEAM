package com.bc.heal.air.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.air.mapper.AirMapper;
import com.bc.heal.vo.Air;

@Service
public class AirServiceImpl implements AirService{

	@Autowired
	private AirMapper mapper;
	
	@Override
	public Air findByNo(int no) {
		return mapper.selectAirByNo(no);
	}
	
}
