package com.killop2000.service;

import java.util.List;

import com.killop2000.domain.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO replyVO) throws Exception;
	public List<ReplyVO> listReply(Integer boardNumber) throws Exception;
	public void modifyReply(ReplyVO replyVO) throws Exception;
	public void removeReply(Integer replyNumber) throws Exception;
}
