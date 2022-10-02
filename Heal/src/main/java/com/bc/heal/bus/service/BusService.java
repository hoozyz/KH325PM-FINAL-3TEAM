package com.bc.heal.bus.service;

import java.util.List;

import com.bc.heal.vo.Bus;

public interface BusService {
	Bus findByNo(int no);

	List<Bus> selectListByEndSta();

	List<Bus> selectListByEnd(String busEnd);

	Bus selectTimeBySta(String start, String end);
}
