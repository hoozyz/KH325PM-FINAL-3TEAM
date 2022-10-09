package com.bc.heal.hotel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Hotel;

@Mapper
public interface HotelMapper {
	Hotel selectHotelByNo(int no);
	List<Hotel> selectHotelList(RowBounds rowBounds, Map<String, String> map);
	int selectHotelCount(Map<String, String> map);
}
