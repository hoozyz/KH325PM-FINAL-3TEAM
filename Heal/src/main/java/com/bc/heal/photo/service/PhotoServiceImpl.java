package com.bc.heal.photo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.photo.mapper.PhotoMapper;
import com.bc.heal.vo.Photo;

@Service
public class PhotoServiceImpl implements PhotoService{

	@Autowired
	private PhotoMapper mapper;
	
	@Override
	public int delete(int no) {
		return mapper.delete(no);
	}

	@Override
	public int save(Photo photo) {
		return mapper.insert(photo);
	}

	@Override
	public Photo findByNo(int no) {
		return mapper.selectByNo(no);
	}

	@Override
	public List<Photo> selectByMember(int no) {
		return mapper.selectMember(no);
	}

}
