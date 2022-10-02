package com.bc.heal.bus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Bus;

@Mapper
public interface BusMapper {
	Bus selectBusByNo(int no);

	List<Bus> selectListByEndSta();

	List<Bus> selectListByEnd(String busEnd);

	Bus selectTimeBySta(String start, String end);
}
