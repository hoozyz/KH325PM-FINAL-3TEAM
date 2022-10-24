package com.bc.heal.bus.service;

import java.util.List;

import com.bc.heal.vo.Bus;
import com.bc.heal.vo.EndStation;

public interface BusService {
	Bus findByNo(int no);

	List<EndStation> selectListByEndSta();

	List<Bus> selectListByEnd(String busEnd);

	Bus selectTimeBySta(String start, String end);

	List<String> selectStart();

	List<String> selectEnd();

	List<String> selectListByStart(String start);
}
