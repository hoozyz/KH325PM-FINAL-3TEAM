package com.bc.heal.park.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.park.mapper.ParkMapper;
import com.bc.heal.vo.Park;

@Service
public class ParkServiceImpl implements ParkService{

	@Autowired
	private ParkMapper mapper;
	
	@Override
	public Park findByNo(int no) {
		return mapper.selectByNo(no);
	}


	@Override
	public int getParkCount(Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String keyword = param.get("keyword");
		if (keyword != null && keyword.length() > 0) {
			String city = param.get("city");
			if (city != null && city.length() > 0) {
				String category = param.get("category");
				if (category != null && category.length() > 0) {
					searchMap.put("keyword", keyword);
					searchMap.put("cityKeyword", city);
					searchMap.put("categoryKeyword", category);
				}
			}
		}
		
		System.out.println(searchMap);
		return mapper.selectParkCount(searchMap);
	}

	@Override
	public List<Park> getParkList(PageInfo pageInfo, Map<String, String> param) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		Map<String, String> searchMap = new HashMap<String, String>();
		String keyword = param.get("keyword");
		if(keyword != null && keyword.length() > 0) {
			String city = param.get("city");
			if(city != null && city.length() > 0) {
				String category = param.get("category");
				if(category != null && category.length() > 0) {
					searchMap.put("keyword", keyword);
					searchMap.put("cityKeyword", city);
					searchMap.put("categoryKeyword", category);
				}
			}
		}
		return mapper.selectParkList(rowBounds, searchMap);
	}
}
