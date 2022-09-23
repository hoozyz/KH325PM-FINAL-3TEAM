package com.bc.heal.festival.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
