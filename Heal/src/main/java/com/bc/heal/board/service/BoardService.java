package com.bc.heal.board.service;

import java.util.List;
import java.util.Map;

import com.bc.heal.vo.Board;
import com.bc.heal.vo.PageInfo;

public interface BoardService {
	List<Board> selectByMember(int no);

	int delete(int no);

	int save(Board board);

	int getBoardCount(String keyword);

	int getBoardCountAll();

	List<Board> selectBoardList(PageInfo pageInfo, Map<String, String> param);

	Board selectByNo(int no);

	int countPlus(int count, int no);

	int update(String title, String cont);
}
