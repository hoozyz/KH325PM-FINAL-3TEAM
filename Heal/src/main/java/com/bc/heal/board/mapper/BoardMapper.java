package com.bc.heal.board.mapper;

import java.util.List;

import com.bc.heal.vo.Board;

public interface BoardMapper {
	List<Board> selectMember(int no);

	int delete(int no);

	int insert(Board board);
}
