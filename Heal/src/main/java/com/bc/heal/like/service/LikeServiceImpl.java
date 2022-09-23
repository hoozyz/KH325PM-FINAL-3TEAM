package com.bc.heal.like.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.like.mapper.LikeMapper;
import com.bc.heal.vo.Like;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeMapper mapper;

	@Override
	public List<Like> selectNew(int no) {
		return mapper.selectNew(no);
	}

}
