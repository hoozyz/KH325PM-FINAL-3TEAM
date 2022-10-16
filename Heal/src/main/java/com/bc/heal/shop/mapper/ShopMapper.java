package com.bc.heal.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Shop;

@Mapper
public interface ShopMapper {

	void insert(Shop shop);

	List<Shop> selectByTrip();
	
}
