package com.bc.heal.reply.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.heal.reply.mapper.ReplyMapper;
import com.bc.heal.vo.PageInfo;
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

	@Override
	public int save(Reply reply) {
		return mapper.insert(reply);
	}

	@Override
	public List<Reply> selectListByPhoto(int no, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); // 앞에서 뺄 수 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectListByPhoto(rowBounds, no);
	}

	@Override
	public int getCount(int no) {
		return mapper.getCount(no);
	}

}
