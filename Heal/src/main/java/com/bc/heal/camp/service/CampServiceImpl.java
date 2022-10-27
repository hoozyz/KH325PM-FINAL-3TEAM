package com.bc.heal.camp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.camp.mapper.CampMapper;
import com.bc.heal.vo.Camp;


@Service
public class CampServiceImpl implements CampService{

	@Autowired
	private CampMapper mapper;
	
	@Override
	public Camp findByNo(int no) {
		return mapper.selectCampByNo(no);
	}

	@Override
	public int getCampCount(Map<String, String> param) {
		
		Map<String, String> map = new HashMap<String, String>();
		String keyword = param.get("keyword");
		String addr = param.get("addr");
		String theme = param.get("theme");
		String category = param.get("category");
		String price = param.get("price");
		String price2 = param.get("price2");
		
		if (keyword != null && keyword.isEmpty()==false) {
			map.put("keyword", keyword);
		}
		if (addr != null && addr.isEmpty()==false) {
			map.put("addr", addr);
		}
		if (theme != null && theme.isEmpty()==false ) {
			map.put("theme", theme);
		} 
		if (category != null && category.isEmpty()==false ) {
			map.put("category", category);
		}
		if (price != null && price.isEmpty()==false ) {
			map.put("price", price);
		}
		if (price2 != null && price2.isEmpty()==false) {
			map.put("price2", price2);
		}
		
		
		return mapper.selectCampCount(map);
	}

	@Override
	public List<Camp> getCampList(com.bc.heal.common.util.PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		Map<String, String> map = new HashMap<String, String>();
		String keyword = param.get("keyword");
		String addr = param.get("addr");
		String theme = param.get("theme");
		String category = param.get("category");
		String price = param.get("price");
		String price2 = param.get("price2");
		
		if (keyword != null && keyword.isEmpty()==false) {
			map.put("keyword", keyword);
		}
		if (addr != null && addr.isEmpty()==false) {
			map.put("addr", addr);
		}
		if (theme != null && theme.isEmpty()==false ) {
			map.put("theme", theme);
		} 
		if (category != null && category.isEmpty()==false ) {
			map.put("category", category);
		}
		if (price != null && price.isEmpty()==false ) {
			map.put("price", price);
		}
		if (price2 != null && price2.isEmpty()==false) {
			map.put("price2", price2);
		}
		
		
		
		return mapper.selectCampList(rowBounds, map);
	}

	@Override
	public void updateCamp(String no1, String no2, String no3, String no4) {
		mapper.updateCamp(no1,no2,no3,no4);
	}
	
}
