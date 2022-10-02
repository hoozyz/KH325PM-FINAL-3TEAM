package com.bc.heal.bus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.bus.mapper.BusMapper;
import com.bc.heal.vo.Bus;
import com.bc.heal.vo.EndStation;

@Service
public class BusServiceImpl implements BusService{

	@Autowired
	private BusMapper mapper;
	
	@Override
	public Bus findByNo(int no) {
		return mapper.selectBusByNo(no);
	}

	@Override
	public List<EndStation> selectListByEndSta() {
		return mapper.selectListByEndSta();
	}

	@Override
	public List<Bus> selectListByEnd(String busEnd) {
		return mapper.selectListByEnd(busEnd);
	}

	@Override
	public Bus selectTimeBySta(String start, String end) {
		return mapper.selectTimeBySta(start, end);
	}

}
