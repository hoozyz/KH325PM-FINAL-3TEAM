package com.bc.heal.air.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bc.heal.vo.Air;

@Mapper
public interface AirMapper {
	Air selectAirByNo(int no);

	List<Air> selectListByEnd(String airEnd);

	List<Air> selectTimeBySta(@Param("start") String start, @Param("end") String end);

	Air selectByStartTime(@Param("start") String start, @Param("end") String end, @Param("time") String time);
}
