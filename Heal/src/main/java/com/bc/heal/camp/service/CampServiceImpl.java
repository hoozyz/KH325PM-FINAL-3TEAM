package com.bc.heal.camp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.camp.mapper.CampMapper;
import com.bc.heal.vo.Camp;


@Service
public class CampServiceImpl implements CampService{

	@Autowired
	private CampMapper mapper;
	
	@Override
	public Camp findByNo(int no) {
		return mapper.selectCampByNo(no);
	}

	@Override
	public int getCampCount(Map<String, String> param) {
		return mapper.selectCampCount(param);
	}

	@Override
	public List<Camp> getCampList(com.bc.heal.common.util.PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectCampList(rowBounds, param);
	}
	
}
