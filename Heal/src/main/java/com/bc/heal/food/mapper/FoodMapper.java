package com.bc.heal.food.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Camp;
import com.bc.heal.vo.Food;

@Mapper
public interface FoodMapper {
	Food selectByNo(int no);
	
}
