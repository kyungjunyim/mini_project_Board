package com.killop2000.persistence;

import java.util.List;

import com.killop2000.domain.Criteria;
import com.killop2000.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> list(Integer boardNumber) throws Exception;
	public void create(ReplyVO replyVO) throws Exception;
	public void update(ReplyVO replyVO) throws Exception;
	public void delete(Integer replyNumber) throws Exception;
	public List<ReplyVO> listPage(Integer boardNumber, Criteria cri) throws Exception;
	public int count(Integer boardNumber) throws Exception;
}
