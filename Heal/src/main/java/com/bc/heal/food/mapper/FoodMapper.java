package com.bc.heal.food.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Food;

@Mapper
public interface FoodMapper {
	Food selectByNo(int no);
	List<Food> selectFoodList(RowBounds rowBounds, Map<String, String> map);
	int selectFoodCount(Map<String, String> map);
	
}
