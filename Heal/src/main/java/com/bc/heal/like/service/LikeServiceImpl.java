package com.bc.heal.like.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.like.mapper.LikeMapper;
import com.bc.heal.vo.Like;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeMapper mapper;

	@Override
	public List<Like> selectNew(int no) {
		return mapper.selectNew(no);
	}

	@Override
	public int insertLike(Like like) {
		return mapper.insertLike(like);
	}

	@Override
	public int deleteLike(int no) {
		return mapper.deleteLike(no);
	}

	@Override
	public int deleteLikeById(int memberNo, int no) {
		return mapper.deleteLikeById(memberNo, no);
	}

	@Override
	public int selectNo(int no, Map<String, String> param) {
		String type = param.get("type");
		Map<String, Integer> map = new HashMap<>();
		map.put("no", no);
		int no1 = Integer.parseInt(param.get("likeNo"));
		if (type.equals("hotel")) {
			map.put("hotelno", no1);
			if (!param.containsKey("check")) {
				insertLike(new Like(0, no, no1, 0, 0, 0, 0));
			}
		} else if (type.equals("camp")) {
			map.put("campno", no1);
			if (!param.containsKey("check")) {
				insertLike(new Like(0, no, 0, no1, 0, 0, 0));
			}
		} else if (type.equals("festival")) {
			map.put("festivalno", no1);
			if (!param.containsKey("check")) {
				insertLike(new Like(0, no, 0, 0, no1, 0, 0));
			}
		} else if (type.equals("food")) {
			map.put("foodno", no1);
			if (!param.containsKey("check")) {
				insertLike(new Like(0, no, 0, 0, 0, no1, 0));
			}
		} else if (type.equals("park")) {
			map.put("parkno", no1);
			if (!param.containsKey("check")) {
				insertLike(new Like(0, no, 0, 0, 0, 0, no1));
			}
		}
		if (mapper.checkNo(map) == 0) {
			return 0;
		}
		return mapper.selectNo(map);
	}

}
