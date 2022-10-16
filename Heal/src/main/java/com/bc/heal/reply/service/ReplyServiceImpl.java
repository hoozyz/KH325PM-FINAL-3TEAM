package com.bc.heal.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.reply.mapper.ReplyMapper;
import com.bc.heal.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;

	@Override
	public List<Reply> selectNew(int no) {
		return mapper.selectNew(no);
	}

	@Override
	public int delete(int no) {
		return mapper.delete(no);
	}

}
