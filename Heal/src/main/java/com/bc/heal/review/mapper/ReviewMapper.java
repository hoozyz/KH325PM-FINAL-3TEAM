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

	int insert(Map<String, String> param);
	
	// 캠핑
	List<Review> selectRevCamp(RowBounds rowBounds, Map<String, String> searchMap);
	int getCountByCamp(int no);
	
	// 상현(food)
	List<Review> selectRevFood(RowBounds rowBounds, Map<String, String> searchMap);
	int selectRevByFoodCnt(int no);
	

}
