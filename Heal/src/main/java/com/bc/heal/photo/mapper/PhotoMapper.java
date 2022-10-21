package com.bc.heal.photo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Photo;

@Mapper
public interface PhotoMapper {
	int delete(int no);

	int insert(Photo photo);

	Photo selectByNo(int no);

	List<Photo> selectMember(int no);

	int getPhotoCount(Map<String, String> param);

	int getPhotoCountAll();

	List<Photo> selectPhotoList(RowBounds rowBounds, Map<String, String> searchMap);

	void addCount(int no);

	void update(Photo photo);
}
