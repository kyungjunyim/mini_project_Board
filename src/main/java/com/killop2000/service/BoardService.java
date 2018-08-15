package com.killop2000.service;

import java.util.List;

import com.killop2000.domain.BoardVO;
import com.killop2000.domain.Criteria;

public interface BoardService {
	public void register(BoardVO board) throws Exception;
	public BoardVO read(Integer boardNumber) throws Exception;
	public void modify(BoardVO board) throws Exception;
	public void remove(Integer boardNumber) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int listCountCriteria(Criteria cri) throws Exception;
}
