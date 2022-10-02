package com.bc.heal.train.service;

import java.util.List;

import com.bc.heal.vo.EndStation;
import com.bc.heal.vo.Train;

public interface TrainService {
	Train findByNo(int no);

	List<EndStation> selectListByEndSta();

	List<Train> selectListByEnd(String trainEnd);

	List<Train> selectTimeBySta(String start, String end);

	Train selectByStartTime(String start, String end, String time);
}
