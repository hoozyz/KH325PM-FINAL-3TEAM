package com.bc.heal.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.reserve.mapper.ReserveMapper;
import com.bc.heal.vo.Reserve;

@Service
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired
	private ReserveMapper mapper;

	@Override
	public List<Reserve> selectCamp(int no) {
		return mapper.selectCamp(no);
	}

	@Override
	public List<Reserve> selectHotel(int no) {
		return mapper.selectHotel(no);
	}

	@Override
	public List<Reserve> selectBus(int no) {
		return mapper.selectBus(no);
	}

	@Override
	public List<Reserve> selectTrain(int no) {
		return mapper.selectTrain(no);
	}

	@Override
	public List<Reserve> selectAir(int no) {
		return mapper.selectAir(no);
	}

	@Override
	public int delete(int no) {
		return mapper.deleteReserve(no);
	}
	
}
