package com.bc.heal.train.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.train.mapper.TrainMapper;
import com.bc.heal.vo.EndStation;
import com.bc.heal.vo.Train;

@Service
public class TrainServiceImpl implements TrainService{

	@Autowired
	private TrainMapper mapper;
	
	@Override
	public Train findByNo(int no) {
		return mapper.selectTrainByNo(no);
	}

	@Override
	public List<EndStation> selectListByEndSta() {
		return mapper.selectListByEndSta();
	}

	@Override
	public List<Train> selectListByEnd(String trainEnd) {
		return mapper.selectListByEnd(trainEnd);
	}

	@Override
	public List<Train> selectTimeBySta(String start, String end) {
		return mapper.selectTimeBySta(start, end);
	}

	@Override
	public Train selectByStartTime(String start, String end, String time) {
		return mapper.selectByStartTime(start, end, time);
	}

	@Override
	public List<String> selectStart() {
		return mapper.selectStart();
	}

	@Override
	public List<String> selectEnd() {
		return mapper.selectEnd();
	}

	@Override
	public List<String> selectListByStart(String start) {
		return mapper.selectListByStart(start);
	}
	
}
