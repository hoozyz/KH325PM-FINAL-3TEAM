package com.bc.heal.bus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Bus;

@Mapper
public interface BusMapper {
	Bus selectBusByNo(int no);
}
