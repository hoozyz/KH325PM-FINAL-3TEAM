package com.bc.heal.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import com.bc.heal.shop.mapper.ShopMapper;
import com.bc.heal.vo.Shop;


@Primary
@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopMapper mapper;

	
	@Override
	public void insert(List<Shop> list) {
		if(!list.isEmpty()) {
			for(Shop shop: list) {
				mapper.insert(shop);
			}
		}
	}

	@Override
	public List<Shop> selectByTrip() {
		return mapper.selectByTrip();
	}

	@Override
	public List<Shop> selectByFood() {
		return mapper.selectByFood();
	}

	@Override
	public List<Shop> selectBySup() {
		return mapper.selectBySup();
	}

	@Override
	public Shop selectByMeat() {
		return mapper.selectByMeat();
	}

	@Override
	public Shop selectByShrimp() {
		return mapper.selectByShrimp();
	}
}
