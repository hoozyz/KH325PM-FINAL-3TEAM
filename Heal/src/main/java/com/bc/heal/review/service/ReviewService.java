package com.bc.heal.review.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Review;

public interface ReviewService {
	List<Review> selectNew(int no);

	int delete(int no);

	int getCount();

	List<Review> selectRevCamp(int no, PageInfo pageInfo, String sort);

	void setLike(int no, int like);

	int getLike(int no);

	int insert(Map<String, String> param);
}
