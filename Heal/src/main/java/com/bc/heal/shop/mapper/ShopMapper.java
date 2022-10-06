package com.bc.heal.shop.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Camp;
import com.bc.heal.vo.Shop;

@Mapper
public interface ShopMapper {
	Shop selectShopByNo(int no);
}
