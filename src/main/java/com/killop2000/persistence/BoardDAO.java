package com.killop2000.persistence;

import java.util.List;

import com.killop2000.domain.BoardVO;
import com.killop2000.domain.Criteria;

public interface BoardDAO {
	public void create(BoardVO vo) throws Exception;
	public BoardVO read(Integer boardNumber) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(Integer boardNumber) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	public List<BoardVO> listPage(int page) throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
}
