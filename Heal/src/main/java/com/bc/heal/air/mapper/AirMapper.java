package com.bc.heal.air.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Air;

@Mapper
public interface AirMapper {
	Air selectAirByNo(int no);

	List<Air> selectListByEnd(String airEnd);

	List<Air> selectTimeBySta(String start, String end);
}
