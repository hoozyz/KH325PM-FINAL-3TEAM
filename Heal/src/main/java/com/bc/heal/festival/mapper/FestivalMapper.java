package com.bc.heal.festival.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Camp;
import com.bc.heal.vo.Festival;

@Mapper
public interface FestivalMapper {
	Festival selectByNo(int no);
	
}
