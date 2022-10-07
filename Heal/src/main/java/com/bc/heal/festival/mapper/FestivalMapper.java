package com.bc.heal.festival.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Festival;

@Mapper
public interface FestivalMapper {
	Festival selectByNo(int no);
	List<Festival> selectFestivalList(RowBounds rowBounds, Map<String, String> searchMap);
	int selectFestivalCount(Map<String, String> searchMap);
	
}
