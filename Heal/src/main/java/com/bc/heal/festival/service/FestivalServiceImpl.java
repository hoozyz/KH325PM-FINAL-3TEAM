package com.bc.heal.festival.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.festival.mapper.FestivalMapper;
import com.bc.heal.vo.Festival;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Autowired
	private FestivalMapper mapper;
	
	@Override
	public Festival findByNo(int no) {
		return mapper.selectByNo(no);
	}

	@Override
	public List<Festival> getFestivalList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		Map<String, String> searchMap = new HashMap<String, String>();
		String startdate = param.get("startdate");
		String enddate = param.get("enddate");
		String keyword = param.get("keyword");
		String addr = param.get("addr");
		if (startdate != null && startdate.length() > 0) {
			searchMap.put("startdate", startdate);
		} 
		if (enddate != null && enddate.length() > 0) {
			searchMap.put("enddate", enddate);
		}
		if (keyword != null && keyword.length() > 0) {
			searchMap.put("keyword", keyword);
		}
		if (addr != null && addr.length() > 0) {
			searchMap.put("addr", addr);
		}
		
		return mapper.selectFestivalList(rowBounds, searchMap);
	}

	@Override
	public int getFestivalCount(Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String startdate = param.get("startdate");
		String enddate = param.get("enddate");
		String keyword = param.get("keyword");
		String addr = param.get("addr");
		if (startdate != null && startdate.length() > 0) {
			searchMap.put("startdate", startdate);
		} 
		if (enddate != null && enddate.length() > 0) {
			searchMap.put("enddate", enddate);
		}
		if (keyword != null && keyword.length() > 0) {
			searchMap.put("keyword", keyword);
		}
		if (addr != null && addr.length() > 0) {
			searchMap.put("addr", addr);
		}
		
		return mapper.selectFestivalCount(searchMap);
	}
}
