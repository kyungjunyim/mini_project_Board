package com.killop2000.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.killop2000.domain.BoardVO;
import com.killop2000.domain.Criteria;
import com.killop2000.domain.SearchCriteria;
import com.killop2000.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public void register(BoardVO board) throws Exception {
		dao.create(board);
	}

	@Override
	public BoardVO read(Integer boardNumber) throws Exception {
		return dao.read(boardNumber);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public void remove(Integer boardNumber) throws Exception {
		dao.delete(boardNumber);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
