package com.bc.heal.train.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.train.mapper.TrainMapper;
import com.bc.heal.vo.Train;

@Service
public class TrainServiceImpl implements TrainService{

	@Autowired
	private TrainMapper mapper;
	
	@Override
	public Train findByNo(int no) {
		return mapper.selectTrainByNo(no);
	}
	
}
