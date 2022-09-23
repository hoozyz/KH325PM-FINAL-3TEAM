package com.bc.heal.reply.service;

import java.util.List;

import com.bc.heal.vo.Like;
import com.bc.heal.vo.Reply;
import com.bc.heal.vo.Review;

public interface ReplyService {
	List<Reply> selectNew(int no);

	int delete(int no);
	
}
