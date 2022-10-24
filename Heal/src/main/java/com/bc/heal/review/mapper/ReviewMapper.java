package com.bc.heal.review.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Review;

@Mapper
public interface ReviewMapper {
	List<Review> selectNew(int no);

	int delete(int no);

	void setLike(@Param("no") int no, @Param("like") int like);

	int getLike(int no);

	int insertReview(Review rev);

	// 캠핑
	List<Review> selectRevCamp(RowBounds rowBounds, Map<String, String> searchMap);

	int getCountByCamp(int no);

	// 상현(food)
	List<Review> selectRevFood(RowBounds rowBounds, Map<String, String> searchMap);

	int selectRevByFoodCnt(int no);

	// 우성(hotel)
	List<Review> selectRevHotel(RowBounds rowBounds, Map<String, String> searchMap);

	int selectRevByHotelCnt(int no);

	// 정우(축제)
	List<Review> selectRevFestival(RowBounds rowBounds, Map<String, String> searchMap);

	int getCountByFestival(int no);

	// 세은(공원)
	List<Review> selectRevPark(RowBounds rowBounds, Map<String, String> map);

	int selectRevByParkCnt(int no);

	int getStarByCamp(int no);
	
	int getStarByFood(int no);
	
	int getStarByHotel(int no);
	
	int getStarByFestival(int no);
	
	int getStarByPark(int no);
}
