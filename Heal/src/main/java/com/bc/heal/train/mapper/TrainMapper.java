package com.bc.heal.train.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bc.heal.vo.EndStation;
import com.bc.heal.vo.Train;

@Mapper
public interface TrainMapper {
	Train selectTrainByNo(int no);

	List<EndStation> selectListByEndSta();

	List<Train> selectListByEnd(String trainEnd);

	List<Train> selectTimeBySta(@Param("start") String start, @Param("end") String end);

	Train selectByStartTime(@Param("start") String start, @Param("end") String end, @Param("time") String time);

	List<String> selectStart();

	List<String> selectEnd();

	List<String> selectListByStart(String start);
}
