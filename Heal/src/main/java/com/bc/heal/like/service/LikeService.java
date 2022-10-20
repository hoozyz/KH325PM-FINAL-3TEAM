package com.bc.heal.like.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.vo.Like;

public interface LikeService {
	List<Like> selectNew(int no);
	
	int insertLike(Like like);

	int deleteLike(int no);
	
	int deleteLikeById(int memberNo, int no);

	int selectNo(int no, Map<String, String> param);
}
