package com.bc.heal.photo.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		File folder = new File(savePath);
		
		// 저장 된 경로가 없으면 폴더를 생성하는 코드
		if(folder.exists() == false) {
			folder.mkdir();
		}
		System.out.println(savePath);
		
		
		// test.txt -> 20220905_175430321.txt
		String originalFileName = upfile.getOriginalFilename();
		String reNameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
				+ originalFileName.substring(originalFileName.lastIndexOf("."));
		String reNamePath = savePath + "/" + reNameFileName;
		
		// 업로드 된 파일의 이름을 변경하고, 실제 보조기억장치(디스크)에 데이터를 저장하는 부
		try {
			upfile.transferTo(new File(reNamePath));
		} catch (Exception e) {
			return null;
		}
		
		return reNameFileName;
	}

}
