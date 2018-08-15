package com.killop2000.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.killop2000.domain.BoardVO;
import com.killop2000.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.killop2000.mapper.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(nameSpace + ".create", vo);
	}

	@Override
	public BoardVO read(Integer boardNumber) throws Exception {
		return session.selectOne(nameSpace + ".read", boardNumber);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(nameSpace + ".update", vo);
	}

	@Override
	public void delete(Integer boardNumber) throws Exception {
		session.delete(nameSpace + ".delete", boardNumber);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(nameSpace + ".listAll");
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(nameSpace + ".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(nameSpace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(nameSpace + ".countPaging", cri);
	}

}