package com.bc.heal.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bc.heal.vo.Reply;

@Mapper
public interface ReplyMapper {
	List<Reply> selectNew(int no);

	int delete(int no);

}
