package com.killop2000.persistence;

import java.util.List;

import com.killop2000.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> list(Integer boardNumber) throws Exception;
	public void create(ReplyVO replyVO) throws Exception;
	public void update(ReplyVO replyVO) throws Exception;
	public void delete(Integer replyNumber) throws Exception;
}
