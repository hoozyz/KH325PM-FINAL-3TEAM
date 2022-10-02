package com.bc.heal.air.service;

import java.util.List;

import com.bc.heal.vo.Air;

public interface AirService {
	Air findByNo(int no);

	List<Air> selectListByEnd(String airEnd);

	List<Air> selectTimeBySta(String start, String end);

	Air selectByStartTime(String start, String end, String time);
}
