package com.bc.heal.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.bc.heal.vo.Reply;

@Mapper
public interface ReplyMapper {
	List<Reply> selectNew(int no);

	int delete(int no);

	int insert(Reply reply);

	List<Reply> selectListByPhoto(RowBounds rowBounds, int no);

	int getCount(int no);
}
