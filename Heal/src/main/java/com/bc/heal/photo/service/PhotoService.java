package com.bc.heal.photo.service;

import java.util.List;

import com.bc.heal.vo.Photo;

public interface PhotoService {
	int delete(int no);

	int save(Photo photo);

	Photo findByNo(int photono);

	List<Photo> selectByMember(int no);
}
