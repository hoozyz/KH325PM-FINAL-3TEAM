package com.bc.heal.review.service;

import java.util.List;

import com.bc.heal.vo.Like;
import com.bc.heal.vo.Review;

public interface ReviewService {
	List<Review> selectNew(int no);

	int delete(int no);
	
}
