package com.bc.heal.reply.service;

import java.util.List;

import com.bc.heal.vo.PageInfo;
import com.bc.heal.vo.Reply;

public interface ReplyService {
	List<Reply> selectNew(int no);

	int delete(int no);

	int save(Reply reply);

	int getCount(int no);

	List<Reply> selectListByPhoto(int no, PageInfo pageInfo);
}
