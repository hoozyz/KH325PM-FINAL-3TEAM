package com.bc.heal.bus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.bus.mapper.BusMapper;
import com.bc.heal.vo.Bus;

@Service
public class BusServiceImpl implements BusService{

	@Autowired
	private BusMapper mapper;
	
	@Override
	public Bus findByNo(int no) {
		return mapper.selectBusByNo(no);
	}

}
