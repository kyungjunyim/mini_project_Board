package com.killop2000.service;

import java.util.List;

import com.killop2000.domain.Criteria;
import com.killop2000.domain.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO replyVO) throws Exception;
	public List<ReplyVO> listReply(Integer boardNumber) throws Exception;
	public void modifyReply(ReplyVO replyVO) throws Exception;
	public void removeReply(Integer replyNumber) throws Exception;
	public List<ReplyVO> listReplyPage(Integer boardNumber, Criteria cri) throws Exception;
	public int count(Integer boardNumber) throws Exception;
}
