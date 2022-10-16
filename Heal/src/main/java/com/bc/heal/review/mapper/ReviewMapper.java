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

	int getCount();

	List<Review> selectRevCamp(RowBounds rowBounds, Map<String, String> searchMap);

	void setLike(@Param("no") int no, @Param("like") int like);

	int getLike(int no);

	int insert(Map<String, String> param);
}
