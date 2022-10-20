package com.bc.heal.food.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Food;

public interface FoodService {
	Food findByNo(int no);
	List<Food> getFoodList(PageInfo pageInfo, Map<String, String> param);
	int getFoodCount(Map<String, String> param);
	void updateFood(String no1, String no2, String no3, String no4);
	
	List<Food> selectByGu(String gu);

}
