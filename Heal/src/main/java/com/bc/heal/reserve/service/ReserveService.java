package com.bc.heal.reserve.service;

import java.util.List;

import com.bc.heal.vo.Reserve;

public interface ReserveService {
	List<Reserve> selectCamp(int no);

	List<Reserve> selectHotel(int no);

	List<Reserve> selectBus(int no);

	List<Reserve> selectTrain(int no);

	List<Reserve> selectAir(int no);
	
	int delete(int no);
}
