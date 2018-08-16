package com.killop2000.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.killop2000.domain.UserVO;
import com.killop2000.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.killop2000.mapper.UserMapper";

	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return session.selectOne(nameSpace + ".login", loginDTO);
	}

}
