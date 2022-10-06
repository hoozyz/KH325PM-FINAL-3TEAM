package com.bc.heal.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Board;

public interface BoardMapper {
	List<Board> selectMember(int no);

	int delete(int no);

	int insert(Board board);

	int getBoardCount(String keyword);

	int getBoardCountAll();

	List<Board> selectBoardList(RowBounds rowBounds, Map<String, String> searchMap);

	Board selectByNo(@Param("no") int no);

	int countPlus(@Param("count") int count, @Param("no") int no);

	int update(@Param("title") String title,@Param("cont") String cont);
}
