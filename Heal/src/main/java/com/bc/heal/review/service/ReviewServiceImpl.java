package com.bc.heal.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.like.mapper.LikeMapper;
import com.bc.heal.review.mapper.ReviewMapper;
import com.bc.heal.vo.Like;
import com.bc.heal.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper mapper;

	@Override
	public List<Review> selectNew(int no) {
		return mapper.selectNew(no);
	}

	@Override
	public int delete(int no) {
		return mapper.delete(no);
	}

}
