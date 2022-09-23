package com.bc.heal.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Like;
import com.bc.heal.vo.Reply;
import com.bc.heal.vo.Review;

@Mapper
public interface ReviewMapper {
	List<Review> selectNew(int no);

	int delete(int no);

}
