package com.bc.heal.camp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Camp;

@Mapper
public interface CampMapper {
	Camp selectCampByNo(int no);

	List<Camp> selectCampList(RowBounds rowBounds, Map<String, String> map);

	int selectCampCount(Map<String, String> map);

	void updateCamp(@Param("no1") String no1, @Param("no2") String no2, @Param("no3") String no3, @Param("no4") String no4);

}
