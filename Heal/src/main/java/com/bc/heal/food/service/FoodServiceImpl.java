package com.bc.heal.food.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.food.mapper.FoodMapper;
import com.bc.heal.vo.Food;

@Service
public class FoodServiceImpl implements FoodService{
	
	@Autowired
	private FoodMapper mapper;
	
	@Override
	public Food findByNo(int no) {
		return mapper.selectByNo(no);
	}
	
}
