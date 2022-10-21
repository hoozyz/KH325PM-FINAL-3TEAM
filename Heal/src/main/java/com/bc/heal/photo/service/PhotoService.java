package com.bc.heal.photo.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.bc.heal.vo.PageInfo;
import com.bc.heal.vo.Photo;

public interface PhotoService {
	int delete(int no);

	int save(Photo photo);

	Photo findByNo(int photono);

	List<Photo> selectByMember(int no);

	String saveFile(MultipartFile file, String savePath);

	int getPhotoCount(Map<String, String> param);

	int getPhotoCountAll();

	List<Photo> selectPhotoList(PageInfo pageInfo, Map<String, String> param);
}
