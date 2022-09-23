package com.bc.heal.board.service;

import java.util.List;

import com.bc.heal.vo.Board;

public interface BoardService {
	List<Board> selectByMember(int no);

	int delete(int no);

	int save(Board board);
}
