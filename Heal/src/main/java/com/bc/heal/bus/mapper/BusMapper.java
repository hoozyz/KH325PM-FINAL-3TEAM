package com.bc.heal.bus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bc.heal.vo.Bus;
import com.bc.heal.vo.EndStation;

@Mapper
public interface BusMapper {
	Bus selectBusByNo(int no);

	List<EndStation> selectListByEndSta();

	List<Bus> selectListByEnd(String busEnd);

	Bus selectTimeBySta(@Param("start") String start, @Param("end") String end);
}
