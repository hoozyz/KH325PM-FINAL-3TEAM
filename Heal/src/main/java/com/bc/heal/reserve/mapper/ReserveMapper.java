package com.bc.heal.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Reserve;

@Mapper
public interface ReserveMapper {
	List<Reserve> selectCamp(int no);

	List<Reserve> selectHotel(int no);

	List<Reserve> selectBus(int no);

	List<Reserve> selectTrain(int no);

	List<Reserve> selectAir(int no);
	
	int deleteReserve(int no);

	int insertReserve(Reserve reserve);
}
