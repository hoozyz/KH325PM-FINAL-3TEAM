package com.bc.heal.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.board.mapper.BoardMapper;
import com.bc.heal.vo.Board;
import com.bc.heal.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	
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

}
