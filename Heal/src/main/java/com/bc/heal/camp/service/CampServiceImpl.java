package com.bc.heal.camp.service;

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
	
}
