package com.bc.heal.review.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Review;

public interface ReviewService {
	List<Review> selectNew(int no);

	int delete(int no);

	List<Review> selectRevCamp(int no, PageInfo pageInfo, String sort);

	void setLike(int no, int like);

	int getLike(int no);

	int insert(Map<String, String> param);
	int getCountByCamp(int campNo);
	
	// 상현
	List<Review> selectRevByFood(PageInfo pageInfo, Map<String, String> param);

	int selectRevByFoodCnt(int no);

}
