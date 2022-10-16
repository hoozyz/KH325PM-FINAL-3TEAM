package com.bc.heal.review.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.vo.Review;

public interface ReviewService {
	List<Review> selectNew(int no);

	int delete(int no);

	void setLike(int no, int like);

	int getLike(int no);

	int insert(Map<String, String> param);
	
	// 캠핑
	List<Review> selectRevCamp(int no, PageInfo pageInfo, String sort);
	int getCountByCamp(int campNo);
	
	// 상현
	List<Review> selectRevFood(int no, PageInfo pageInfo, String sort);
	int selectRevByFoodCnt(int no);

	// 우성(hotel)
	List<Review> selectRevHotel(int no, PageInfo pageInfo, String sort);
	int selectRevByHotelCnt(int no);
	
}
