package com.killop2000.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.killop2000.domain.Criteria;
import com.killop2000.domain.ReplyVO;
import com.killop2000.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO dao;

	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		dao.create(replyVO);
	}

	@Override
	public List<ReplyVO> listReply(Integer boardNumber) throws Exception {
		return dao.list(boardNumber);
	}

	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		dao.update(replyVO);
	}

	@Override
	public void removeReply(Integer replyNumber) throws Exception {
		dao.delete(replyNumber);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer boardNumber, Criteria cri) throws Exception {
		return dao.listPage(boardNumber, cri);
	}
	
	@Override
	public int count(Integer boardNumber) throws Exception {
		return dao.count(boardNumber);
	}

}
