package com.bc.heal.shop.service;

import java.util.List;

import com.bc.heal.vo.Shop;

public interface ShopService {

	void insert(List<Shop> list);

	List<Shop> selectByTrip();

	List<Shop> selectByFood();

	List<Shop> selectBySup();

	Shop selectByMeat();

	Shop selectByShrimp();
	
	
	List<Shop> selectByCamp();
	
}
