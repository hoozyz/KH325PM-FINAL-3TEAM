package com.bc.heal.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.board.mapper.BoardMapper;
import com.bc.heal.vo.Board;
import com.bc.heal.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public List<Board> selectBoardList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); // 앞에서 뺄 수 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		Map<String, String> searchMap = new HashMap<String, String>();
		String keyword = param.get("keyword");
		if (keyword != null && keyword.length() > 0) {
			searchMap.put("keyword", keyword);
		}
		
		return mapper.selectBoardList(rowBounds, searchMap);
	}

	@Override
	public List<Board> selectByMember(int no) {
		return mapper.selectMember(no);
	}

	@Override
	public int delete(int no) {
		return mapper.delete(no);
	}

	@Override
	public int save(Board board) {
		return mapper.insert(board);
	}

	@Override
	public int getBoardCount(String keyword) {
		keyword = "%" + keyword + "%"; // like문 을 위한 문자열 변경
		return mapper.getBoardCount(keyword);
	}

	@Override
	public int getBoardCountAll() {
		return mapper.getBoardCountAll();
	}

	@Override
	public Board selectByNo(int no) {
		return mapper.selectByNo(no);
	}

	@Override
	public int countPlus(int count, int no) {
		return mapper.countPlus(count, no);
	}

	@Override
	public int update(String title, String cont) {
		return mapper.update(title, cont);
	}
}
