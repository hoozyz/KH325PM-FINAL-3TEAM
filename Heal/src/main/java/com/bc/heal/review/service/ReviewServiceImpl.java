package com.bc.heal.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bc.heal.common.util.PageInfo;
import com.bc.heal.review.mapper.ReviewMapper;
import com.bc.heal.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;

	@Override
	public List<Review> selectNew(int no) {
		return mapper.selectNew(no);
	}

	@Override
	public int delete(int no) {
		return mapper.delete(no);
	}

	@Override
	public void setLike(int no, int like) {
		mapper.setLike(no, like);
	}

	@Override
	public int getLike(int no) {
		return mapper.getLike(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReview(Review rev) {
		return mapper.insertReview(rev);
	}

	// 캠핑
	@Override
	public List<Review> selectRevCamp(int no, PageInfo pageInfo, String sort) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); // 앞에서 뺄 수
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("no", "" + no); // ${}
		searchMap.put("sort", sort);
		// 정렬은 쿼리에서 if문
		return mapper.selectRevCamp(rowBounds, searchMap);
	}

	@Override
	public int getCountByCamp(int no) {
		return mapper.getCountByCamp(no);
	}

	// 상현
	@Override
	public List<Review> selectRevFood(int no, PageInfo pageInfo, String sort) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("no", "" + no); // ${}
		searchMap.put("sort", sort);

		return mapper.selectRevFood(rowBounds, searchMap);
	}

	@Override
	public int selectRevByFoodCnt(int no) {
		return mapper.selectRevByFoodCnt(no);
	}

	// 우성(hotel)
	@Override
	public List<Review> selectRevHotel(int no, PageInfo pageInfo, String sort) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("no", "" + no); // ${}
		searchMap.put("sort", sort);

		return mapper.selectRevHotel(rowBounds, searchMap);
	}

	@Override
	public int selectRevByHotelCnt(int no) {

		return mapper.selectRevByHotelCnt(no);
	}

	// 정우
	@Override
	public List<Review> selectRevFestival(int no, PageInfo pageInfo, String sort) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); // 앞에서 뺄 수
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("no", "" + no);
		searchMap.put("sort", sort);
		return mapper.selectRevFestival(rowBounds, searchMap);
	}

	@Override
	public int getCountByFestival(int no) {
		return mapper.getCountByFestival(no);
	}

	// 세은(공원)
	@Override
	public List<Review> selectRevPark(int no, PageInfo pageInfo, String sort) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("no", "" + no); // ${}
		searchMap.put("sort", sort);
		System.out.println("----" + sort);

		return mapper.selectRevPark(rowBounds, searchMap);

	}

	@Override
	public int selectRevByParkCnt(int no) {

		return mapper.selectRevByParkCnt(no);
	}

	@Override
	public int getStarByCamp(int no) {
		return mapper.getStarByCamp(no);
	}

	@Override
	public int getStarByFood(int no) {
		return mapper.getStarByFood(no);
	}
	
	@Override
	public int getStarByHotel(int no) {
		return mapper.getStarByHotel(no);
	}
	
	@Override
	public int getStarByFestival(int no) {
		return mapper.getStarByFestival(no);
	}
	
	@Override
	public int getStarByPark(int no) {
		return mapper.getStarByPark(no);
	}
}
