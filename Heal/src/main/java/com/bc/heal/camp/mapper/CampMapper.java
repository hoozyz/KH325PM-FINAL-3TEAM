package com.bc.heal.camp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Camp;

@Mapper
public interface CampMapper {
	Camp selectCampByNo(int no);
	List<Camp> selectCampList(RowBounds rowBounds, Map<String, String> map);
	int selectCampCount(Map<String, String> map);
	
}
