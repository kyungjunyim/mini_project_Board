package com.killop2000.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.killop2000.domain.Criteria;
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

	@Override
	public List<ReplyVO> listPage(Integer boardNumber, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("boardNumber", boardNumber);
		paramMap.put("cri", cri);
		
		return session.selectList(nameSpace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer boardNumber) throws Exception {
		return session.selectOne(nameSpace + ".count", boardNumber);
	}

}
