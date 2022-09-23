package com.bc.heal.train.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Train;

@Mapper
public interface TrainMapper {
	Train selectTrainByNo(int no);
}
