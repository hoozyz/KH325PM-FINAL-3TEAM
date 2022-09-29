package com.bc.heal.shop.service.copy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.camp.mapper.CampMapper;
import com.bc.heal.shop.mapper.copy.ShopMapper;
import com.bc.heal.vo.Camp;
import com.bc.heal.vo.Park;
import com.bc.heal.vo.Shop;

@Service
public class ShopImpl implements ShopService{

	@Autowired
	private ShopMapper mapper;

	@Override
	public Shop findByNo(int no) {
		return mapper.selectShopByNo(no);
	}
}
