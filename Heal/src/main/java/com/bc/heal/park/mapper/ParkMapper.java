package com.bc.heal.park.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Park;

@Mapper
public interface ParkMapper {
	Park selectByNo(int no);
	List<Park> selectParkList(RowBounds rowbounds, Map<String, String> map);
	int selectParkCount(Map<String, String> Map);
}