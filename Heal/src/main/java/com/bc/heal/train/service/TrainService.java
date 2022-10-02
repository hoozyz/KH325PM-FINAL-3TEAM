package com.bc.heal.train.service;

import java.util.List;

import com.bc.heal.vo.Train;

public interface TrainService {
	Train findByNo(int no);

	List<Train> selectListByEndSta();

	List<Train> selectListByEnd(String trainEnd);

	List<Train> selectTimeBySta(String start, String end);
}
