package com.bc.heal.park.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Camp;
import com.bc.heal.vo.Park;

@Mapper
public interface ParkMapper {
	Park selectByNo(int no);
	
}
