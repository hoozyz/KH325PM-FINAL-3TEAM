package com.bc.heal.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.board.mapper.BoardMapper;
import com.bc.heal.vo.Board;

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
	
}
