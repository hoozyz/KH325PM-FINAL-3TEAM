package com.bc.heal.air.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Air;

@Mapper
public interface AirMapper {
	Air selectAirByNo(int no);
}
