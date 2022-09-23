package com.bc.heal.hotel.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Hotel;

@Mapper
public interface HotelMapper {
	Hotel selectHotelByNo(int no);
}
