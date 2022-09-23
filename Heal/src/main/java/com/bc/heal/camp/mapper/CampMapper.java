package com.bc.heal.camp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Camp;

@Mapper
public interface CampMapper {
	Camp selectCampByNo(int no);
}
