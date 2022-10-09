package com.bc.heal.park.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.park.mapper.ParkMapper;
import com.bc.heal.vo.Park;

@Service
public class ParkServiceImpl implements ParkService{

	@Autowired
	private ParkMapper mapper;
	
	@Override
	public Park findByNo(int no) {
		return mapper.selectByNo(no);
	}


	@Override
	public int getParkCount(Map<String, String> param) {
		return mapper.selectParkCount(param);
	}

	@Override
	public List<Park> getParkList(PageInfo pageInfo, Map<String, String> param) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectParkList(rowBounds, param);
	}
}
