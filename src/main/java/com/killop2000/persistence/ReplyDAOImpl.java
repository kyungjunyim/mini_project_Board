package com.killop2000.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.killop2000.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.killop2000.mapper.ReplyMapper";

	@Override
	public List<ReplyVO> list(Integer boardNumber) throws Exception {
		return session.selectList(nameSpace + ".list", boardNumber);
	}

	@Override
	public void create(ReplyVO replyVO) throws Exception {
		session.insert(nameSpace + ".create", replyVO);
	}

	@Override
	public void update(ReplyVO replyVO) throws Exception {
		session.update(nameSpace + ".update", replyVO);
	}

	@Override
	public void delete(Integer replyNumber) throws Exception {
		session.delete(nameSpace + ".delete", replyNumber);
	}

}
