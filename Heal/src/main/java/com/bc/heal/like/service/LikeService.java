package com.bc.heal.like.service;

import java.util.List;

import com.bc.heal.vo.Like;

public interface LikeService {
	List<Like> selectNew(int no);
	
}
