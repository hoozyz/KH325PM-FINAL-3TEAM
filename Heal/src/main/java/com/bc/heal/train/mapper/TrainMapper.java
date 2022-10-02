package com.bc.heal.train.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Train;

@Mapper
public interface TrainMapper {
	Train selectTrainByNo(int no);

	List<Train> selectListByEndSta();

	List<Train> selectListByEnd(String trainEnd);

	List<Train> selectTimeBySta(String start, String end);
}
