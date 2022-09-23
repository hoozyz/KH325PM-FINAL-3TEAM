package com.bc.heal.like.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Like;

@Mapper
public interface LikeMapper {
	List<Like> selectNew(int no);

}
