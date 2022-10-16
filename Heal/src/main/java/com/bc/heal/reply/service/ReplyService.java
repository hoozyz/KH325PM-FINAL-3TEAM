package com.bc.heal.reply.service;

import java.util.List;

import com.bc.heal.vo.Reply;

public interface ReplyService {
	List<Reply> selectNew(int no);

	int delete(int no);
	
}
