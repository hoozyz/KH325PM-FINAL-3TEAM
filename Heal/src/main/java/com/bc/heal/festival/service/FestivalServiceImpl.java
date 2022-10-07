package com.bc.heal.festival.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.festival.mapper.FestivalMapper;
import com.bc.heal.vo.Festival;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Autowired
	private FestivalMapper mapper;
	
	@Override
	public Festival findByNo(int no) {
		return mapper.selectByNo(no);
	}

	@Override
	public List<Festival> getFestivalList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectFestivalList(rowBounds, param);
	}

	@Override
	public int getFestivalCount(Map<String, String> param) {
		return mapper.selectFestivalCount(param);
	}
}
