package com.bc.heal.food.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.common.util.PageInfo;
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
	
	@Override
	public int getFoodCount(Map<String, String> param) {
		return mapper.selectFoodCount(param);
	}

	@Override
	public List<Food> getFoodList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectFoodList(rowBounds, param);
	}
	

	@Override
	public void updateFood(String no1, String no2, String no3, String no4) {
		mapper.updateFood(no1,no2,no3,no4);
	}

	// ---

	@Override
	public List<Food> selectByGu(String gu) {
		return mapper.selectByGu(gu);
	}
	
}