package com.bc.heal.photo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Photo;

@Mapper
public interface PhotoMapper {
	int delete(int no);

	int insert(Photo photo);

	Photo selectByNo(int no);

	List<Photo> selectMember(int no);
}
